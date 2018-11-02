# Imports
from math import pi
pi * 71 / 223
from math import sin
sin(pi/2)

# Assignment
radius = 10
2 * radius
area, circ = pi * radius * radius, 2 * pi * radius
radius = 20

# Function values
max
max(3, 4)
f = max
f
f(3, 4)
max = 7
f(3, 4)
f(3, max)
f = 2
# f(3, 4)
__builtins__.max

# User-defined functions
from operator import add, mul
# Note that only def sqiare(x): is processed before
# this function is called
def square(x):
    return mul(x, x)

square(21)
square(add(2, 5))
square(square(3))

def sum_squares(x, y):
    return add(square(x), square(y))
sum_squares(3, 4)
sum_squares(5, 12)

# this = that
def this():
    return that
# this()
that = 100
this()

# Name conflicts
# def square(square):
#     return mul(square, square)
# square(4)

# 1.  An environment is a sequence of frame
# 2. A name evalues to the value bound to that name in the earliest 
# frame of the current environment in which that name is found

#help(pressure)
def pressure(v, t, n=6.022e23):
    """Compute the pressure in pascals of an ideal gas.

    Applies the ideal gas law: http://en.wikipedia.org/wiki/Ideal_gas_law

    v -- volume of gas, in cubic meters
    t -- absolute temperature in degrees kelvin
    n -- particles of gas
    """
    k = 1.38e-23  # Boltzmann's constant
    return n * k * t / v

pressure(1, 273.15) # default used
pressure(1, 273.15, 3 * 6.022e23)