# ---------------------------------------- JOBS ----------------------------------------
# Every job will run in a separate container.
# They will run in parallel unless there is a need declared


# --------------------------------------- NEEDS ----------------------------------------
# jobs can be configured to run only if a previous job passed
jobs:
  test:
    ...
  deploy:
    needs: test  # also takes a list: [test, job2]


# --------------------------------------- RUNNER ---------------------------------------
# the vm where the code runs is specified using "runs-on".
# These vms are provided by github
jobs:
  first-job:                      # job
    runs-on: ubuntu-latest        # runner

# alternatively, you can specify a container using "container"
# images must refer the offical docker repo at hub.docker.com
first-job:                        
  runs-on: ubuntu-latest          # container is running inside this image
  container: node:16              # container 

# or
    container:
      image: node:16
      env: ...  # provide more fields here


# --------------------------------- SERVICE CONTAINER ----------------------------------
# You run an extra container to be used as service when doing tests in you application
# A common use case is for testing databases.
# note: you can use service container even if you're not using "container:"
jobs:
  first-job:                      
    runs-on: ubuntu-latest        
    services:
      mongodb:                    # name of service
        image: mongo              # official docker image
        env: 
          MONGO_INITDB_ROOT_USERNAME: root
          MONGO_INITDB_ROOT_PASSWORD: example
      another-service:
        ...


# --------------------------------------- EVENTS ---------------------------------------
# events specify when a workflow is triggered
on: workflow_dispatch     # triggered manually
on: push                  # when pushing (most common usage)

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
