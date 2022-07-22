# provides suggestions on what to test
pip install coverage  # install

coverage run manage.py test  # run tests
coverage run --omit='*/venv/*' manage.py test  # omit virtual environment from results (recommended)

coverage report  # results from tests in terminal
coverage html  # creates a new folder with results
