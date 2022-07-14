''' ------------------------------- BASIC -----------------------------  '''
# install
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

    
''' ------------------------------ FIRST TEST --------------------------- '''
# create your first simple test
nano test_ex1.py
import pytest
def test_example():
    assert 1 == 1
    
command_lines >> pytest
























