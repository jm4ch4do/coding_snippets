''' ------------------------------- BASIC -----------------------------  '''
# Pytest is a framework for unit testing which means it meant to test the small units
# that make the whole system such as create Customer, delete Contacts and such.

# Other types of testing such as performance testing are conceived to test the system as a whole

# install for any python project
pip install pytest

# install for Django
pip install pytest-django

# docs
https://pytest-django.readthedocs.io/en/latest/
    
# youtube video
https://www.youtube.com/watch?v=LYX6nlECcro&list=PLOLrQ9Pn6caw3ilqDR8_qezp76QuEOlHY

    
''' --------------------------- FILE STRUCTURE ------------------------- '''
# create a folder and a file outside the project folder (file is outside the folder)
mkdir test
nano pytest.ini
    [pytest]
    DJANGO_SETTINGS_MODULE = project_lease.settings  

    # naming conventions for test files
    python_files = test.py test_*.py *_test.py
