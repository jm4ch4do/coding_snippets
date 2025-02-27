''' -------------------------- CLASS ----------------------- '''
# latitude is always between -90 and 90
# while longitude is always between -180 and 180
# so, we'll raise an error when it fails this validation

class Point():
    def __init__(self, name, latitude, longitude):
        
        if not isinstance(name, str):
            raise ValueError("Invalid city name, city name must be a string.")
        
        self.name = name

        if not (-90 <= latitude <= 90) or not (-180 <= longitude <= 180):
            raise ValueError("Invalid latitude, longitude combination.")
        self.latitude = latitude
        self.longitude = longitude


    def get_lat_long(self):
        return (self.latitude, self.longitude)
    
    
    
''' --------------------------- TEST ------------------------ '''
import pytest

from scripts.chp2.video3.mapmaker_exceptions_end import Point

# test data being created correctly
def test_make_one_point():
    p1 = Point("Dakar", 14.7167, 17.4677)
    assert p1.get_lat_long() == (14.7167, 17.4677)

# test wrong latitud or longitude triggers an error
def test_invalid_point_generation():
    with pytest.raises(ValueError) as exp:
        Point("Senegal", 99.6937, -189.44406)
    assert str(exp.value) == "Invalid latitude, longitude combination."
    
# test wrong city name triggers an error
def test_invalid_name_generation():
    with pytest.raises(ValueError) as exp:
        Point(10, 50, 50)
    # breakpoint()
    assert str(exp.value) == "Invalid city name, city name must be a string."