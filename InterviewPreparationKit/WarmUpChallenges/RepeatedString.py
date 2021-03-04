# https://www.hackerrank.com/challenges/repeated-string

# There is a string s of lowercase English letters that is repeated infinitely many times. 
# Given an integer n, find and print the number of letter a's in the first n letters of the infinite string.

s = input()
n = int(input())

def repeatedString(s, n):
    count_a = n // len(s) * s.count('a')
    string = s[: n % len(s)]
    count_a += string.count('a')
    
    return count_a

result = repeatedString(s, n)
print(result)