''' ------------------------------- CLASE CON DECORADOR DE VALIDACIÓN -------------------------------  '''
# ----- Problem: Vector class (5ku)
# ----- URL: https://www.codewars.com/kata/526dad7f8c0eb5c4640000a4
from math import sqrt


def vectors_equal_size(func):
    """
    (function_object)
    :param func: function_object with a function to be executed
    :return: Raises an exception if size of input vector is different from size of self
             Otherwise, just executes func
    """

    def inner(*args, **kwargs):
        vector1 = args[0].coordinates
        vector2 = args[1].coordinates

        if len(vector1) != len(vector2):
            # raise Exception('Both vectors must have equal len')
            print('error')

        returned_value = func(*args, **kwargs)
        return returned_value

    return inner


class Vector:
    """
        :description:
        Is a vector class that supports vector addition, subtraction, dot product and norm
    """
    # use validation through decorators
    # IMPORTS

    def __init__(self, coordinates):
        """
        (list)
        :param coordinates: vector coordinates (ex. [1, 2, 5])
        Saves coordinates into internal var

        """
        self.coordinates = coordinates

    def __str__(self):
        """
        :return: Vector coordinates as string (ex. '(1, 2, 5)')
        """
        # turn list into string
        output = '('
        for value in self.coordinates:
            output += str(value) + ','

        # final fix: replace final ',' by ')'
        output = output[:-1] + ')'

        return output

    @vectors_equal_size
    def add(self, vector2):
        """
        (list)
        :param vector2: vector object which has its own var coordinates (ex. [2, 4, 10])
        :return: The sum of both vectors
        """
        output = []
        for value1, value2 in zip(self.coordinates, vector2.coordinates):
            output.append(value1 + value2)

        return Vector(output)

    @vectors_equal_size
    def subtract(self, vector2):
        """
        (list)
        :param vector2: vector object which has its own var coordinates (ex. [2, 4, 10])
        :return: The subtraction of both vectors
        """
        output = []
        for value1, value2 in zip(self.coordinates, vector2.coordinates):
            output.append(value1 - value2)

        return Vector(output)

    @vectors_equal_size
    def dot(self, vector2):
        """
        (list)
        :param vector2: vector object which has its own var coordinates (ex. [2, 4, 10])
        :return: The dot product of both vectors
        """
        output = 0
        for value1, value2 in zip(self.coordinates, vector2.coordinates):
            output += value1*value2

        return output

    def norm(self):
        """
        (list)
        :return: The norm of the vector
        """
        output = 0
        for value in self.coordinates:
            output += value**2

        return sqrt(output)

    @vectors_equal_size
    def equals(self, vector2):
        """
        (list)
        :param vector2: vector object which has its own var coordinates (ex. [2, 4, 10])
        :return: True if both vectors are equal (ie. all coordinates are equal)
        """
        for value1, value2 in zip(self.coordinates, vector2.coordinates):
            if value1 != value2:
                return False

        return True


# ------------------------- MAIN CODE -------------------------
a = Vector([1, 2, 3])
b = Vector([3, 4, 5])
c = Vector([5, 6, 7, 8])

result = a.add(b)
print(result)

result = a.subtract(b)
print(result)

result = a.dot(b)
print(result)

result = a.norm()
print(result)

result = a.equals(b)
print(result)

a.add(c)  # should rise exception

print(a.add(b).equals(Vector([4, 6, 8])))

