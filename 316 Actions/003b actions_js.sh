# ------------------------------------- ACTIONS JS -------------------------------------
# Custom actions using javascript point to pre-processing, main-processing and post files
name: "Deploy to AWS S3"
description: "Deploy a static website via AWS S3."
runs:
  using: "node16"
  pre: "setup.js"      # optional
  main: "index.js"
  post: "cleanup.js"   # optional



# --------------------------------------- EXAMPLE --------------------------------------
# action.yml
name: Minimal JS Action
description: Say hello to someone

inputs:
  name:
    description: "Who to greet"
    required: true

outputs:
  greeting:
    description: "The greeting message"

runs:
  using: "node16"
  main: "index.js"

# index.js
const core = require('@actions/core');

try {
  const name = core.getInput('name');
  const message = `Hello, ${name}!`;

  console.log(message);
  core.setOutput('greeting', message);
} catch (error) {
  core.setFailed(error.message);
}

# package.json (run npm install in action folder to install required dependencies)
{
  "name": "minimal-js-action",
  "version": "1.0.0",
  "main": "index.js",
  "dependencies": {
    "@actions/core": "^1.10.0"
  }
}

# usage in workflow
steps:
  - uses: actions/checkout@v4

  - name: Run custom JS action
    id: hello
    uses: ./my-js-action
    with:
      name: Alice

  - run: echo "${{ steps.hello.outputs.greeting }}"