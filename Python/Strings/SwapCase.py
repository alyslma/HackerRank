# https://www.hackerrank.com/challenges/swap-case/problem

# You are given a string and your task is to swap cases. In other words, convert all lowercase letters to uppercase letters and vice versa.
# Examples: Www.HackerRank.com → wWW.hACKERrANK.COM || Pythonist 2 → pYTHONIST 2  

################################################################
# Using the swapcase() function
def swap_case(s):
    return s.swapcase()

if __name__ == '__main__':
    s = input()
    result = swap_case(s)
    print(result)

# Not using the swapcase() function
def swap_case(s):
    result = ""
    for letter in s:
        if letter == letter.upper():
            result += letter.lower()
        else:
            result += letter.upper()
    return result
    
if __name__ == '__main__':
    s = input()
    result = swap_case(s)
    print(result)
