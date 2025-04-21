# -------------------------------------- ACTIONS --------------------------------------
# actions are pre-built functions that you can execute
# so, instead of running 10 lines of batch, you use one action
# you can use your own actions or use community actions from marketplace


# ----------------------------------- SIMPLE ACTION -----------------------------------
- name: Install NodeJS
  uses: actions/setup-node@v3
  with:
    node-version: 18  # parameters are specified in the action documentation


# ------------------------------------- ARTIFACT --------------------------------------
# actions that allows generating files and folders (typically used to store or analyze)
- name: Upload artifacts
  uses: actions/upload-artifact@v4.6.2
  with:
      name: dist-files  # takes everything in this folder
      path: dist  # and puts it here

# import files to be used in other jobs
- name: Get build artifacts
  uses: actions/download-artifact@v4
  with:
      name: dist-files


# ------------------------------------- OUTPUTS ---------------------------------------
# actions that output values
outputs:
    script-file: ${{ steps.publish.outputs.script-file}}  # retrieves variable "script-file" from step "publish"
steps:
  - name: Publish JS filename
    id: publish
    run: find dist/assets/*.js -type f -execdir echo 'script-file={}' >> $GITHUB_OUTPUT ';'  # save variable script-file

    # alternative syntax
    run: find dist/assets/*.js -type f -execdir echo '::set-output name=script-file::{}' ';'

# to use in a different workflow
  - name: Output file name
    run: echo ${{ needs.build.outputs.script-file }}


# --------------------------- EXAMPLE CACHING DEPENDENCIES ----------------------------
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
