# // ------- Artifacts
 1. Custom retention periods can be defined for individual artifacts using the actions/upload-artifact action.
 2. Github artifacts cannot be recovered after deletion.
 3. How long does GitHub store logs and artifacts by default? 90 days
 4. Expiration date for an artifact can be obtained executing a specific API call.


# // ------- Groups
 5. Runner groups are a collection of self-hosted runners you can restrict from being used from certain environments.
 6. Runner labels can also be used to groups runners and are a native Github Actions feature, unlike runner groups.
 7. There is a default group where new runners are placed.
 8. Groups are used to restrict access while labels are used to target specific runners in a workflow.


# // ------- Variables
 9. Environment variables are not forced to be upper case but to be treated as case-sensitive.
10. Secrets take precedence over variables.


# // ------- Javascript
11. Github Actions toolkit provides a set of tools for creating Javascript actions.
12. Javascript actions involve committing dependent packages alongside the code.
13. You can use actions/toolkit to send error annotations to the runner.


# // ------- Jobs
14. Jobs will fail if not approved within 30 days while awaiting review in a workflow.
15. Maximum amount of jobs a matrix can generate? 256
16. Github adds two steps to workflows: "Set up job" and "Complete job".


 # // ------- Workflow
17. Github allows deleting a workflow that is: completed or two weeks old.
18. For triggering a workflow on webhook events use types: [created, completed]
19. GITHUB_ACTIONS evaluates to true when Github Actions is running in the workflow.
20. Checks API is provided by Github to output statuses, results and logs for a workflow.
21. gihub.event can be used to access information about the event that triggered a workflow.


# // ------- Actions
22. The check_suite event is designed to exclusively trigger workflow runs on the default branch.
23. Not specifying the version is invalid syntax: - uses: actions/checkout
24. Github interprets 0 exit code of actions as success and the rest of exit codes as failure.
25. The main requirement to publish an action to the Github Marketplace is that is available in a public repo.
    Also, each repository must contain a single action.
26. What is the URL for the GitHub Container Registry? ghcr.io
27. What is the purpose of the restore-keys parameter in the GitHub Actions cache action?
    provide alternative keys to use in case of a cache miss


# // ------- Messages
28. This is called a workflow command and is used to pass instructions and info the the runner env.
    echo "::set-output name=result::success"
29. debug messages are not displayed in the logs by default.
30. Correct way to print debug messages: echo "::debug::executing the setup script"
31. How to improve logs readability? echo "::group::Installing dependencies" ... echo "::endgroup::"


# // ------- Runners
32. Docker container actions can only be executed on a Linux runner.
33. Validates a self-hosted runner can access network services on GitHub?  --check
34. You can disable updates for ephemeral runners in containers to avoid disruptions.
35. https_proxy is the environment variable to be configured on self-hosted runners to use a proxy.
36. _diag folder has connectivity logs for the self hosted runners.
37. How can you validate that your GitHub self-hosted-runner can access all required GitHub services? Using a GitHub provided script on the runner machine.


# // ------- Others
38. Workflow badges in private repositories are not accesssible externally to prevent unauthorized embedding or linking from external sources.
39. Policies can be used to limit the use of public actions and reusable workflows to your enterprise.
40. Github publishes the range of ip for runners but the list may change often.
41. Github packages are not compatible with RPM package manager for linux distributions.
42. Github creates a scoped installation token with read access to the repository, automatically expiring after one hour,
    to enable runners to download actions from internal or private repositories.
43. For storing secrets larger than 48 KB use a workaround involving encryption with GPG and 
    storing the decryption passphrase as a secret.


# // ----- New
44. default keyword can be used at workflow or job level to define default working-directory and shell.
45. concurrency keyword can be used to create concurrency groups which limit parallel execution of jobs.
46. secrets cannot be referenced directly in "if:" conditionals. They have to be declared in env first.
47. You cannot access artifacts that were created in a different workflow run.
48. Clean-up script is passed in composite actions as: 
       post:
   But for docker actions is:
       post-entrypoint: 'cleanup.sh'
49. You can configure permissions granted to the GITHUB_TOKEN by using the permissions key at workflow or job level.
   For each of the available permission you can set the values of read, write or none
50. You can use max-parallel in a matrix to set the maximum number of jobs that can run in parallel.
51. The repository_dispatch event is triggered by webhooks from outside the repository
52. Workflow_dispatch allows manual trigger from ui, api or cli
53. What's the maximun amount of reusable workflows that can be called from a single workflow file? 20
