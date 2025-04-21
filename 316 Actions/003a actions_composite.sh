# -------------------------------------- ACTIONS --------------------------------------
# Although there are many actions available in the marketplace, 
# you may want to create your own which you can also publish in the marketplace
# The reason may be because there is no such action available or more likely
# because you want to avoid repeating long steps that you're using in multiple workflows

# .github/actions  actions are stored here by conventions (not forced)
# you can also create a new repo just for your custom actions so they are available everywhere


# --------------------------------- TYPES OF ACTIONS ----------------------------------
# You can build three types of actions: Javascript, Docker or Composite actions.
# Javascript: you define a javascript file that is going to be triggered
# Docker: For any other language you can define a dockerfile and put the code you want
#         to execute inside
# Composite: You combine multiple workflow steps in one action.


# -------------------------------- COMPOSITE ACTIONS ----------------------------------
# Is the simplest type of custom action since it combines steps and doesn't do programming

# .github/action/my_action.yml
name: Say Hello Composite Action
description: A simple composite action that prints hello and the current date.
runs:
  using: "composite"
  steps:
    - run: echo "Hello from the composite action!"
      shell: bash
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '18'

# .github/workflows/my_workflow.yml
steps:
  - name: Run our composite action
    uses: ./.github/actions/my_action.yml   # you don't need to specify the file
                                            # if it's name is action.yml

    # call like this if composite action is in another repo
    uses: username/my-composite-action@v1


# ------------------------ COMPOSITE WITH INPUTS & OUTPUTS ----------------------------
# --- Action definition
name: Greet Action
description: "Greets someone, unless it's 'nobody'"

inputs:
  name:
    description: "The name to greet"
    required: false
    default: "World"

outputs:
  greeting:
    description: "The generated greeting"

runs:
  using: "composite"
  steps:
    - id: greet
      if: ${{ inputs.name != 'nobody' }}
      run: |
        echo "greeting=Hello, ${{ inputs.name }}!" >> $GITHUB_OUTPUT
        echo "Hello, ${{ inputs.name }}!"
      shell: bash


# --- Action used from workflow
steps:
  - name: Greet Alice
    id: greet1
    uses: ./.github/actions/greet
    with:
      name: Alice

  - name: Print Alice's greeting
    run: echo "Greeting: ${{ steps.greet1.outputs.greeting }}"

  - name: Greet Nobody
    id: greet2
    uses: ./.github/actions/greet
    with:
      name: nobody

  - name: Print Nobody's greeting (should be empty)
    run: echo "Greeting: ${{ steps.greet2.outputs.greeting || 'No greeting created' }}"

  - name: Greet with default (no input)
    id: greet3
    uses: ./.github/actions/greet