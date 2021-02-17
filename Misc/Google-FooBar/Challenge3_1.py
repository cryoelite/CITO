"""
The Grandest Staircase Of Them All
==================================
With her LAMBCHOP doomsday device finished, Commander Lambda is preparing for her debut on the galactic stage - but in order to make a grand entrance, she needs a grand staircase! As her personal assistant,
 you've been tasked with figuring out how to build the best staircase EVER. 
Lambda has given you an overview of the types of bricks available, plus a budget. You can buy different amounts of the different types of bricks (for example, 3 little pink bricks, or 5 blue lace bricks). 
Commander Lambda wants to know how many different types of staircases can be built with each amount of bricks, so she can pick the one with the most options. 
Each type of staircase should consist of 2 or more steps.  No two steps are allowed to be at the same height - each step must be lower than the previous one. All steps must contain at least one brick. A step's 
height is classified as the total amount of bricks that make up that step.
For example, when N = 3, you have only 1 choice of how to build the staircase, with the first step having a height of 2 and the second step having a height of 1: (# indicates a brick)
#
##
21
When N = 4, you still only have 1 staircase choice:
#
#
##
31
 
But when N = 5, there are two ways you can build a staircase from the given bricks. The two staircases can have heights (4, 1) or (3, 2), as shown below:
#
#
#
##
41
#
##
##
32
Write a function called answer(n) that takes a positive integer n and returns the number of different staircases that can be built from exactly n bricks. n will always be at least 3 (so you can have a staircase at all), but no more than 200, because Commander Lambda's not made of money!
Languages
=========
To provide a Python solution, edit solution.py
To provide a Java solution, edit solution.java
Test cases
==========
Inputs:
    (int) n = 3
Output:
    (int) 1
Inputs:
    (int) n = 200
Output:
    (int) 487067745
Use verify [file] to test your solution and see how it does. When you are finished editing your code, use submit [file] to submit your answer. If your solution passes the test cases, it will be removed from your home folder.
"""

Solution:

import unittest


class GSOTA(unittest.TestCase):
    def test_1(self):
        test_input = 3
        self.assertEqual(answer(test_input), 1)

    def test_2(self):
        test_input = 200
        self.assertEqual(answer(test_input), 487067745)


def solution(n):
    """
    :param n: Integer to partition into distinct integer sums
    :return: Number of partitions of at least 2 parts i.e. excluding trivial
    Calculates partitions from 0 to n quickly and in place.
    """
    arr = [0]*(n+1)
    arr[0] = 1
    for i in range(1, n):
        for c in range(n, i-1, -1):
            arr[c] += arr[c-i]

    return arr[n]


def mult_poly(p1, p2):
    """
    :param p1: List of coefficients with indices as powers of x. i.e [0] = x^0
    :param p2: List of coefficients with indices as powers of x. i.e [0] = x^0
    :return: List of coefficients with indices as powers of x. i.e [0] = x^0
    Multiplies all terms of polynomials p1 and p2
    """
    prod = [0]*(len(p1)+len(p2)-1)  # Length is sum of highest degree + 1
    for deg1, coef1 in enumerate(p1):
        for deg2, coef2 in enumerate(p2):
            # Multiplies coefficients and places them in the index related to
            # the sum of the degrees of x
            prod[deg1+deg2] += coef1*coef2
    return prod


def partitionQ(n):
    """
    :param n: Number to partition into distinct integer sums
    :return: Number of partitions including trivial partition, n
    Calculates all partitions for all terms of degree 0 to n^2
    """
    res = [1]
    for i in xrange(0, n+1):
        next_poly = [0] * (i + 1)  # Creates the next (1 + x^i) for product
        next_poly[0] = 1  # Sets the x^0 coefficient
        next_poly[i] = 1  # Sets the x^i power coefficient
        res = mult_poly(res, next_poly)
    return res[n]


def fastpoly(p1, p2, nth_deg):
    """
    :param p1: List of coefficients with indices as powers of x. i.e [0] = x^0
    :param p2: List of coefficients with indices as powers of x. i.e [0] = x^0
    :param nth_deg: Int of maximum degree to calculate coefficient for
    :return: List of coefficients with indices as powers of x. i.e [0] = x^0
    Multiplies polynomials p1 and p2 up to terms of degree n
    """
    prod = [0] * (nth_deg + 1)
    for coef1, deg1 in enumerate(p1):
        for coef2, deg2 in enumerate(p2):
            if (coef1 + coef2) <= nth_deg:
                prod[coef1 + coef2] += deg1 * deg2
            else:
                break
    return prod


def fast_partitionQ(n):
    """
    :param n: Integer to partition into distinct integer sums
    :return: Number of partitions including trivial partition, n
    Utilizes fast_mult_poly() to calculate partitions from 0 to n quickly
    """
    res = [1]
    for i in xrange(0, n+1):
        next_poly = [0] * (i + 1)  # Creates the next (1 + x^i) for product
        next_poly[0] = 1  # Sets the x^0 coefficient
        next_poly[i] = 1  # Sets the x^i power coefficient
        res = fastpoly(res, next_poly, n)
    return res[n]