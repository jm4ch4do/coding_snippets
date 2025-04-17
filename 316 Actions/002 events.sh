# --------------------------------------- EVENTS ---------------------------------------
# events specify when workflow is triggered
on: workflow_dispatch  # triggered manually
on: push  # when pushing (most common usage)

# events for repos
on: [pull_request, create, fork, issues, issue_comment, watch]  

# events others
on: respository_dispatch:  # rest api can request workflow
    schedule:              # workflow can be scheduled
    workflow_call:         # can be called by other workflows


# -------------------------------- FILTERS, ACTIVITY_TYPE --------------------------------
# refine selection of events
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


# ----------------------------------- NEEDS -----------------------------------
# jobs can be configured to run only if a previous job passed
jobs:
  test:
    ...
  deploy:
    needs: test  # also takes a list: [test, job2]