# ---------------------------------- ACTIONS DOCKER ------------------------------------
# A docker action allows executing code in any programming language like python
# you need at least three files: action.yml, Dockerfile and a file for python


# --------------------------------------- EXAMPLE --------------------------------------
# action.yml
name: Minimal Python Action
description: Greets someone using Python

inputs:
  name:
    description: "Name to greet"
    required: true

outputs:
  greeting:
    description: "The greeting message"

runs:
  using: "docker"
  image: "Dockerfile"
  args:
    - ${{ inputs.name }}


# entrypoint.py
import sys
name = sys.argv[1]
greeting = f"Hello, {name}!"
print(greeting)

with open(os.environ['GITHUB_OUTPUT'], 'a') as fh:
    fh.write(f"greeting={greeting}\n")

# dockerfile
FROM python:3.11-slim
COPY entrypoint.py /entrypoint.py
RUN chmod +x /entrypoint.py
ENTRYPOINT ["python", "/entrypoint.py"]

# usage
steps:
  - name: Checkout repo
    uses: actions/checkout@v4

  - name: Run Python container action
    id: greet
    uses: ./my-python-action
    with:
      name: Alice

  - name: Print the greeting
    run: echo "Greeting: ${{ steps.greet.outputs.greeting }}"
