# -------------------------------------- CONTEXT ---------------------------------------
# github handles variables in a centralized location called context
# most used contexts are:
github, env, vars, jobs, job, steps, runner, secrets, needs, inputs

# there are also environment variables provided by github
GITHUB_PATH, GITHUB_ENV, GITHUB_WORKSPACE, GITHUB_ACTION_PATH, GITHUB_RUN_ID, GITHUB_RUN_NUMBER ...


# ------------------------------ EXAMPLE OF GITHUB CONTEXT -----------------------------
# printing some of the value available inside the github context
steps:
  - name: Output event data
    run: echo "${{ toJSON(github.event) }}"
  - name: Output repo url
    run: echo "${{ github.server_url }}/${{ github.repository }}"


# ------------------------------ EXAMPLE OF SECRETS CONTEXT ----------------------------
# Secrets and variables stored in github can be retrieved
# using the "secrets" and "vars" contexts
run: echo "My secret is ${{ secrets.MY_SECRET }}"
run: echo "My variable is ${{ vars.MY_VARIABLE }}"


# ----------------------------------- ENV VARIABLES AND SECRETS -----------------------------------
# You can also create variables in the workflow code, they are stored in the env context
# They will appear as exported in the runner's console

#  USE 1 - Define at Job level (most common)
env:
  MONGODB_DB_NAME: gha-demo
jobs:
  test:
    env:
      MONGODB_USERNAME: my_user_uat

# USE 2 - Define at step level
# is also possible to use at step useful for avoiding injection
- name: Step with its own env
  env:
    STEP_VAR: "I'm step-specific"
  run: echo $STEP_VAR 


# USE 3 - Retrieve from env. or os at runner 
# You can access variables from the env context and as variable in the console
- name: Output env variable
  run: echo "${{ env.MONGODB_DB_NAME }}"  # reading from the env context
  run: echo $MONGODB_DB_NAME  # or reading from os at the runner



# -------------------------------------- CUSTOM ENVIRONMENTS --------------------------------------
# if you don't specify an environment, the vars en secrets from repo level will be pulled
# but you can have a different set of vars and secrets per environment
# and specify the one you are using in a given workflow
jobs:
  deploy:
    environment: PRD
