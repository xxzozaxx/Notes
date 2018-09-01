import time
from functools import reduce

# # function to factor a given positive integer n
# def factors(n):
#     factors = []
#     # remove any factors of 2 first
#     while n % 2 == 0:
#         factors.append(2)
#         n = n/2
#     # now look for odd factors
#     p = 3
#     while n != 1:
#         while n % p == 0:
#             factors.append(p)
#             n = n/p
#         p += 2
#     return factors

# # merge two lists of factors based on maximum multiplicities
# def factor_append(factors,new):
#     if len(factors) == 0: return new
#     for i in range(len(new)):
#         if i > 0 and new[i] == new[i-1]: continue
#         new_count = new.count(new[i])
#         old_count = factors.count(new[i])
#         if new_count > old_count:
#             for j in range(new_count - old_count): factors.append(new[i])
#     factors.sort()
#     return factors

# # find the smallest positive evenly divisible number for a positive integer n
# def smallest_evenly_divisible(num):
#     F = []
#     for i in range(1,num + 1):
#         F = factor_append(F,factors(i))
#     product = 1
#     for i in F: product *= i
#     return product
def primes(n):
    """ Returns  a list of primes < n """
    sieve = [True] * n
    for i in xrange(3,int(n**0.5)+1,2):
        if sieve[i]:
            sieve[i*i::2*i]=[False]*((n-i*i-1)/(2*i)+1)
    return [2] + [i for i in xrange(3,n,2) if sieve[i]]

def smallest_evenly_divisible(num) :
    def generate_ans(start, num):
        if num == 1:
            return start
        elif start % num == 0 :
            return generate_ans(start, num-1)
        else :
            if num % 2 == 0 :
                return generate_ans(start*2, num)
            elif num % 3 == 0:
                return generate_ans(start*3, num)
            else:
                return generate_ans(start*num, num)

    generate_ans(reduce(lambda x, y: x*y, primes(num)), num)


start = time.time()
product = smallest_evenly_divisible(20)
elapsed = (time.time() - start)

print "result %s returned in %s seconds." % (product,elapsed)
