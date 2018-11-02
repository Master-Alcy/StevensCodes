# Numeric expressions
2018
2000 + 18
1 - 2 + 3 + 4 * ((5 // 6) + 7 * 8 * 9)
x,y,z = 10, True, "dragon"
x, y = x + 5, x + 10
height, width = 11, 22
height, width = width, height
fish = 'splash' * 2
d = "don't do it"
# x=10 and y=15 here
# Note we evaluate x+5 and x+10 first, then assign to x and y
# not evaluate y=x+5 first
# This is good for swap as shown with height and width
# * can apply int to string or char
# Note that True is 1, False is 0
# power: **, mod: % Floor divide: // (9//4 = 2)
def fifth(x):
    fib_0 = 0
    fib_1 = 1
    fib_5 = fib_1 + fib_0
    return fib_5
    #return nothere
# Can't bind a variable to a function, but 
# an arrow, or pointer


# Call expressions
max(3, 4.5)
pow(100, 2)
pow(2, 100)
max(1, -2, 3, -4)
max(pow(10, 2), pow(2, 10), 1010)

# Importing and arithmetic with call expressions
# Names also bound
from operator import add, mul
add(1, 2)
mul(4, 6)
mul(add(4, mul(4, 6)), add(3, 5))
add(2, mul(9, mul(add(4, mul(4, 6)), add(3, 5))))

# Objects
# Note: Download from http://composingprograms.com/shakespeare.txt
from urllib.request import urlopen
shakespeare = urlopen('http://composingprograms.com/shakespeare.txt')
wordsOfS = set(shakespeare.read().decode().split())

shakes = open('shakespeare.txt')
text = shakes.read().split()
len(text)
text[:25]
text.count('the')
text.count('thou')
text.count('you')
text.count('forsooth')
text.count(',')

# Sets
words = set(text)
'forsooth' in words #True
len(words)
max(words)
max(words, key=len)

# Reversals
'draw'[::-1] #'ward'
{w for w in words if w == w[::-1] and len(w)>4}
#{'madam', 'level', 'redder', 'minim', 'rever', 'refer'}
{w for w in words if w[::-1] in words and len(w) == 4}
# find the words has a opposite also in words
{w for w in words if w[::-1] in words and len(w) > 6}

print("Hello")

# def statement did two things: created a function and
# bound the f to a pointer at that function
def f():
    return 5
# f is pointing to the function. f() is calling that function
# Keep in mind the diff between the function and function call
g = f # both bind the pointer to f() [p = global]

def average(x,y,z):
    return (x+y+z)/3
