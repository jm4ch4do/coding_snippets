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


# ----------------------------------- EVENTS -----------------------------------
on: workflow_dispatch # workflow can be triggered manually
on: push  # runs when pushing a commit (most common usage)

# repository related
on: [pull_request, create, fork, issues, issue_comment, watch]  
# others
on: [respository_dispatch, schedule, workflow_call]
     # respository_dispatch: REST api can request workflow
     # schedule: workflow can be scheduled
     # workflow_call: can be called by other workflows

# --- FILTERS AND ACTIVITY TYPES
# filters to only trigger for push event when js code is pushed in release branches
# also, only trigger for pull_request when opening, closing or synchronizing
on:
  push:                # event
    branches:          # filter
      - 'release/**'
    paths:             # filter
      - '**.js'
    pull_request:      # event
      types:           # activity type (these are actually the default values)
        - opened
        - reopened
        - synchronized


# ----------------------------------- JOBS -----------------------------------
# jobs can be configure to run only if a previous job passed
jobs:
  test:
    ...
  deploy:
    needs: test  # also takes a list: [test, job2]


# -------------------------------------- ACTIONS --------------------------------------
# you can use your own actions or use community actions from marketplace
      - name: Install NodeJS
        uses: actions/setup-node@v3
        with:
          node-version: 18  # parameters are specified in the action documentation

# --- ARTIFACTS
# actions that allows generating files and folders (typically used to store or analyze)
      - name: Upload artifacts
        uses: actions/upload-artifact@v4.6.2
        with:
            name: dist-files  # takes everything in this folder
            path: dist  # and puts it here

# files are not automatically available in other jobs, so to import them:
      - name: Get build artifacts
        uses: actions/download-artifact@v4
        with:
            name: dist-files

# --- OUTPUTS
# actions that output simple values instead of files
    outputs:
        script-file: ${{ steps.publish.outputs.script-file}}
    steps:
      - name: Publish JS filename
        id: publish
        run: find dist/assets/*.js -type f -execdir echo 'script-file={}' >> $GITHUB_OUTPUT ';'

        # alternative syntax
        run: find dist/assets/*.js -type f -execdir echo '::set-output name=script-file::{}' ';'

# to use in a different file
      - name: Output file name
        run: echo ${{ needs.build.outputs.script-file }}

# --- CACHING DEPENDENCIES
# Installing dependencies is a common step in multiple jobs so is good to cache it
# the first time it runs so in the next job time spent is reduced
# hashFiles function is used to build the name using a hash of the content of the file.
# So, when one of the value in the files change (file holds dependencies)
# The name will change and github will know that the cache needs to be rebuilt
      - name: Cache dependencies
        uses: actions/cache@v4
        with:
            path: ~/.npm  # path that should be cached
            key: deps-node-modules-${{ hashFiles('**/package-lock.json')}}  # name of cache
      - name: Install dependencies
        run: npm ci

# this same lines are to be repeated in the second job. Cache is shared among all jobs


# -------------------------------------- CONTEXT --------------------------------------
# github handles variables like secrets in its context which you can visualize using
# the 'github' value refers here to a given context but you can find more available context at:
# https://docs.github.com/en/actions/writing-workflows/choosing-what-your-workflow-does/accessing-contextual-information-about-workflow-runs
    steps:
      - name: Output event data
        run: echo "${{ toJSON(github.event) }}"
      - name: Output repo url
        run: echo "${{ github.server_url }}/${{ github.repository }}"

# other_contexts: env, vars, jobs, steps, runner, secrets