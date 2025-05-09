# ----------------------------------- UI PARAMETERS ------------------------------------
# present parameters in UI to select and capture in step
name: Choose Option Example

on:
  workflow_dispatch:
    inputs:
      environment:
        description: 'Choose an environment'
        required: true
        default: 'staging'
        type: choice
        options:
          - development
          - staging
          - production

jobs:
  show-selection:
    runs-on: ubuntu-latest
    steps:
      - name: Print selected environment
        run: echo "Selected environment: ${{ inputs.environment }}"
