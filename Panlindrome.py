# try to fix this code first
'''
def palindrome_chain_length(n,loop=0):
    # parameter n is a positive integer
    # your function should return the number of steps
    if len(str(n)) < 3 :
        loop += 1
        return palindrome_chain_length(n + int(str(n)[::-1]),loop)
    else:
        if n == int(str(n)[::-1]) :
            return loop
        else:
            loop += 1
            return palindrome_chain_length(n + int(str(n)[::-1]),loop)
'''

#this cpde  is to splution task in codewars.com/
#this function to know the lenght of palindrome
"""
from sensi Task said :
    Write a method palindrome_chain_length which takes a positive number and returns the number of special steps needed to obtain a palindrome. The special step is: "reverse the digits, and add to the original number". If the resulting number is not a palindrome, repeat the procedure with the sum until the resulting number is a palindrome.

If the input number is already a palindrome, the number of steps is 0.

Input will always be a positive integer.
"""
def palindrome_chain_length(n):
    # parameter n is a positive integer
    # your function should return the number of steps
    loop = 0
    if n == int(str(n)[::-1]) :
        return 0
    while n != int(str(n)[::-1]): #or len(str(n)) < 3 :
        n = n + int(str(n)[::-1])
        loop += 1
    
    return loop
