import math
from mpmath import mp
from fractions import Fraction

base = mp.e                                                                        # The Euler's Number correct to (mp.dps) decimal places
a = float(input("Enter first denominator term -> "))                               # The first term at the denominator of the HP
n = float(input("Enter the number of terms for which the sum has to be found -> "))# The sum of how many terms
d = float(input("Enter the common difference in the denominator -> "))             # the common difference in the denominators
x = (((2*a)+((2*n)-1)*d)/((2*a)-d))                                                # Section of the formula for which we have to find the natural logarithm

Sum = (1/d)*(math.log(x,base)) # Applying Logarithms, finding the sum

print(f"The Sum is: {Sum} (Approximately)")
print(f"In Fractions: {Fraction(str(Sum)).limit_denominator(10000)} (Approximately)")