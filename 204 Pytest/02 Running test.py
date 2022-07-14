''' ------------------------------ FIRST TEST --------------------------- '''
# create your first simple test
nano test_ex1.py
import pytest
def test_example():
    print("testing case 1")
    assert 1 == 1
    
def test_example2():
    assert 1 == 2

# run all tests from all files matching defined naming conventions
>> pytest

# stop after a test fails
>> pytest -x

# report function to show prints
>> pytest -rP

# execute test files only within a given folder
>> pytest app_lease/tests

# specify the exact function test we want to run
>> pytest app_lease/tests::test_example2