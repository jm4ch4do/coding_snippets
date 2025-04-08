# --------------------------------- GIT HUB ACTIONS ---------------------------------
GitHubActions is Automation as Code or CI/CD as code  # same as terraform is IaC 
Lives inside the code in your own code repo


# ------------------------------------ COMPONENTS ------------------------------------
Workflows            <- Triggers(events) are assigned to Workflows
  Job1               <- A Runner (machine) executes each job
    Step1a           <- Parallel is the default mode in which jobs run
    Step1b           <- Conditions can be set for Job or Step to run or not
  Job2           
    Step2a           <- Steps run sequentially in the same runner
    Step2b           <- Steps are shell scripts or actions 
                     Actions are pre-defined and configurable code (preferred)

# ---------------------------------- BASIC WORKFLOW ----------------------------------
name: First Workflow
on: workflow_dispatch  # workflow can be triggered manually
jobs:
  first-job:
    runs-on: ubuntu-latest
    steps:
      - name: Print greeting
        run: echo "Hello World"
      - name: Get code using action
        uses: actions/checkout@v3

# ------------------------------------ EVENTS ------------------------------------
on: workflow_dispatch # workflow can be triggered manually
on: push  # runs when pushing a commit (most common usage)
repository_related-> pull_request, create, fork, issues, issue_comment, watch
other-> respository_dispatch  # REST api can request workflow
     -> schedule  # workflow can be scheduled
     -> workflow_call  # can be called by other workflows

# conditions to only trigger when js code is pushed in release branches
on:
  push:
    branches:
      - 'release/**'
    paths:
      - '**.js'
      
# ------------------------------------ ACTIONS ------------------------------------
# you can use your own actions or use community actions from marketplace
      - name: Install NodeJS
        uses: actions/setup-node@v3
        with:
          node-version: 18  # parameters are specified in the action documentation


# -------------------------------------- JOBS --------------------------------------
# jobs can be configure to run only if a previous job passed
jobs:
  test:
    ...
  deploy:
    needs: test  # also takes a list: [test, job2]

# multiple triggers
on: [push, workflow_dispatch]


# -------------------------------------- CONTEXT --------------------------------------
# github handles variables like secrets in its context which you can visualize using
# the 'github' value refers here to a given context but you can find more available context at:
# https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/accessing-contextual-information-about-workflow-runs
    steps:
      - name: Output event data
        run: echo "${{ toJSON(github.event) }}"
      - name: Output repo url
        run: echo "${{ github.server_url }}/${{ github.repository }}"

other_contexts: env, vars, jobs, steps, runner, secrets