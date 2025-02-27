''' ------------------------------ STANDARD MARKERS --------------------------- '''
# docs
https://docs.pytest.org/en/stable/how-to/mark.html

# skip a test temporarely (flag as skip)
@pytest.mark.skip
def test_example():
    assert 1 == 1
    
@pytest.mark.xfail  # flag as fail but don't display an error



''' ------------------------------ DEFINE MARKERS --------------------------- '''
# define
nano pytest.ini
markers = 
    slow: slow running test

# use in your test
@pytest.mark.slow

# run the test marked as slow
pytest -m "slow"