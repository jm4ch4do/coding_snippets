# --------------------------------- GIT HUB ACTIONS ---------------------------------
# GitHubActions is Automation as Code or CI/CD as code  # same as terraform is IaC 
# Lives inside the code in your own code repo


# ------------------------------------ STRUCTURE -------------------------------------
Workflows            <- Triggers(events) are assigned to Workflows
  Job1               <- A Runner (machine) executes each job
    Step1a           <- Parallel is the default mode in which jobs run
    Step1b           <- Conditions can be set for Job or Step to run or not
  Job2           
    Step2a           <- Steps run sequentially in the same runner
    Step2b           <- Steps are shell scripts or actions 
                     Actions are pre-defined and configurable code (preferred)


# ---------------------------------- BASIC WORKFLOW ----------------------------------
name: First Workflow                    # workflow
on: workflow_dispatch                   # event
jobs:
  first-job:                            # job
    runs-on: ubuntu-latest              # runner
    steps:                              
      - name: Print greeting            # step with code 
        run: echo "Hello World"
      - name: Get code using action     # step with action
        uses: actions/checkout@v3
