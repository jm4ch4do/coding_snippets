# ----------------------------------- CONDITIONS -----------------------------------
# conditions are used to skip or execute steps or jobs


# ------------------------------- JOB LEVEL CONDITION ------------------------------
# Print data if any job failed
report:
  if: failure()
  needs: [lint, deploy]
  runs-on: ubuntu-latest
  steps:
    - name: Output Information
      run: | 
        echo "Something went wrong"
        echo "${{ github }}"


# ------------------------------ STEP LEVEL CONDITION ------------------------------
# execute step if previous fails
- name: Test code
  id: run-test  # sets id for target step
  run: npm run test
- name: Upload test report
  if: failure() && steps.run-test.outcome == 'failure'
  uses: actions/upload-artifact@v4
  with:
    name: test-report
    path: test.json


# ------------------------------- SPECIAL CONDITIONS -------------------------------
# there are 4 special conditions functions provided by github
failure()  # true if any previous step failed
success()  # true if none of the previous steps failed
always()  # always true
cancelled()  # true if workflow was cancelled


# --------------------------- EXAMPLE CONTINUE-ON-ERROR ----------------------------
# use "continue-on-error" instead of "if: failure"
- name: Test code
  continue-on-error: true  # everything continues, not the next step only
                           # changes steps.run-test.conclusion to success
                           # even though steps.run-test.outcome is still failure
  id: run-test  # sets id for target step
  run: npm run test
- name: Upload test report
  uses: actions/upload-artifact@v4
  with:
    name: test-report
    path: test.json


# -------------------------------- EXAMPLE CACHE -----------------------------------
# CACHE EXAMPLE
# install dependencies only if cache was not used
- name: Cache dependencies
  id: cache
  uses: actions/cache@v4
  with:
    path: node_modules
    key: deps-node-modules-${{ hashFiles('**/package-lock.json') }}
- name: Install dependencies
  if: steps.cache.outputs.cache-hit != 'true'
  run: npm ci
