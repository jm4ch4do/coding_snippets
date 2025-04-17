# --------------------------------- REUSABLE WORKFLOWS ---------------------------------
# to reuse a workflow you need to put it in a separate file and use the workflow_call event
# you cannot add extra steps to a job that calls a reusable workflow 
# but you can pass parameters or add another job that depens on it


# ----------------------------------- BASIC EXAMPLE ------------------------------------
# file#1
name: Reusable Deploy
on: workflow_call
jobs: 
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Output information
        run: echo "Deploying & uploading"

# file#2
deploy:
  uses: ./.github/workflows/reusable.yml


# ------------------------------ EXAMPLE WITH PARAMETERS -------------------------------
# file_1 (reusable) 
name: Reusable Deploy
on: 
  workflow_call:
    inputs:
      artifact-name:
        description: The name of the deployable artifact files
        required: false
        default: dist-files
        type: string
    outputs:
      result:
        description: The result of the deployment operation
jobs: 
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Get Code
        uses: actions/download-artifact@v4
        with:
          name: ${{ inputs.artifact-name}}
          path: dist
      - name: Output information
        run: echo "Deploying & uploading"
      - name: Set result output
        run: echo "step-result=success" >> $GITHUB_OUTPUT

# file_2 (caller)
deploy:
  needs: build
  uses: ./.github/workflows/reusable.yml
  with:
    artifact-name: dist-files


# -------------------------------- EXAMPLE WITH OUTPUTS --------------------------------
# file_1 (reusable) 
name: Reusable Deploy
on: 
  workflow_call:
    outputs:
      result:
        value: ${{ jobs.deploy.outputs.result }}
jobs:
  deploy:
    runs-on: ubuntu-latest
    outputs:
      result: ${{ steps.set-output.outputs.result }}
    steps:
      - id: set-output
        run: echo "result=success" >> $GITHUB_OUTPUT

# file_2 (caller)
name: Caller Workflow
on: push
jobs:
  call-deploy:
    uses: ./.github/workflows/reusable-deploy.yml
    outputs:
      deploy-result: ${{ jobs.call-deploy.outputs.result }}
  print-result:
    needs: call-deploy
    runs-on: ubuntu-latest
    steps:
      - run: echo "Deploy result: ${{ needs.call-deploy.outputs.deploy-result }}"


# -------------------------------- EXAMPLE WITH SECRETS --------------------------------
# file_1 (reusable) 
name: Reusable Deploy
on: 
  workflow_call:
    secrets:
      some-secret:
        required: true
jobs: 
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Print my secret
        run: echo "My secret is ${{ secrets.some-secret }}"

# file_2 (caller)
deploy:
  needs: build
  uses: ./.github/workflows/reusable.yml
  with:
    artifact-name: dist-files
  secrets:
    some-secret: ${{ secrets.MY_SECRET }}"
