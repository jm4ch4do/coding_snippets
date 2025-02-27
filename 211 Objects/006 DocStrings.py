#--------------------READING DOCSTRINGS--------------------
help(len)
print(len.__doc__)

#--------------------ONE LINE--------------------
# Use one line for obvious cases. Always use a . at the end of all Docstrings
def kos_root():
     """Return the pathname of the KOS root directory."""
     global _kos_root

     if _kos_root: return _kos_root

#--------------------FUNCTION EXAMPLE--------------------
def make_frequency_dict(sequence):
    """Return a dictionary that maps each element in sequence to its frequency.
    
    Description:
        Create a dictionary that maps each element in the list sequence
        to the number of times the element occurs in the list. The element
        will be the key of the key-value pair in the dictionary and its frequency
        will be the value of the key-value pair.

    Argument(s):
        sequence: [list_of_values] These values have to be of an
            immutable data type because they will be assigned as the keys
            of the dictionary. For example, they can be integers, booleans,
            tuples, or strings.

    Return:
        [Dict] A dictionary that maps each element in the list to its frequency.
        
    Example:
        >> make_frequency_dict([1, 6, 2, 6, 2])
        {1: 1, 6: 2, 2: 2}

    Raise:
        ValueError: if the list is empty.
    """
    pass

#--------------------CLASS EXAMPLE--------------------
class Circle:
    """A class that represents a circle.

    Attributes:
        radius [float]: the distance from the center of the circle
            to its circumference.
        color [string]: the color of the circle.
        diameter [float]: the distance through the center of the circle
            from one side to the other.

    Methods:
        find_area[self]:
            Return the area of the circle.
        find_perimeter[self]:
            Return the perimeter of the circle.
    """

    def __init__(self, radius, color):
        """Initialize an instance of Circle.

        Arguments:
            radius (float): the distance from the center
                of the circle to its circumference.
            color (string): the color of the circle.
        """
        self._radius = radius
        self._color = color

    @property
    def radius(self):
        """Return the radius of the circle.

        This is a float that represents the distance from
        the center of the circle to its circumference."""
        return self._radius

