# https://www.hackerrank.com/challenges/python-tuples

# Given an integer, n, and n space-separated integers as input, create a tuple, t, of those n integers. Then compute and print the result of hash(t).
# Note: hash() is one of the functions in the __builtins__ module, so it need not be imported.

################################################################
n = int(input())
integer_list = map(int, input().split())
t = tuple(integer_list)
print(hash(t))



# Sample Input:
# 2
# 1 2

# Sample Output:
# 3713081631934410656