# ----------------------------------- MATRIX -----------------------------------
# Matrixes are used to reuse jobs that are very similar to one another
# "matrix" key sets values to be use in multiple combinations
# "include" is used to add a standalone combination
# "exclude" is used to exclude a given combination


# --------------------------- FULL EXAMPLE OF MATRIX ---------------------------
# executes 6 different jobs for every combination of values in matrix
# by default if one job fails, rest are skipped
name: Matrix Demo
on: push
jobs:
  build:
    continue-on-error: true  # all jobs will run even if one fails
    strategy:
      matrix:
        node-version: [12, 14, 16]
        operating-system: [ubuntu-latest, windows-latest]
        include:  # adds standalone combination that is not combined with rest of values
          - node-version: 18
            operating-system: macos-latest
            npm: 6  # you could add extra parameters not used before
        exclude:
          - node-version: 12
            operating-system: windows-latest  # this combination will not be executed
    runs-on: ${{ matrix.operating-system }}
    steps:
      - name: Get Code
        uses: actions/checkout@v4
      - name: Install NodeJS
        uses: actions/setup-node@v4
        with:
          node-version: ${{ matrix.node-version }}
      - name: Install Dependencies
        run: npm ci
      - name: Build Project
        run: npm run build
  