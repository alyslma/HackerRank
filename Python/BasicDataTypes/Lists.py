# https://www.hackerrank.com/challenges/python-lists

# Consider a list (list = []). You can perform the following commands:
# 1. insert i e: Insert integer e at position i.
# 2. print: Print the list.
# 3. remove e: Delete the first occurrence of integer e.
# 4. append e: Insert integer e at the end of the list.
# 5. sort: Sort the list.
# 6. pop: Pop the last element from the list.
# 7. reverse: Reverse the list.
# Initialize your list and read in the value of n followed by n lines of commands where each command will be of the 7 types listed above.
# Iterate through each command in order and perform the corresponding operation on your list.

################################################################
N = int(input())
l = []
for _ in range(N):
    user_input = input().strip().split(' ')
    cmd = user_input[0]
    if cmd == 'print':
        print(l)
    elif cmd == 'insert':
        l.insert(int(user_input[1]), int(user_input[2]))
    elif cmd == 'remove':
        l.remove(int(user_input[1]))
    elif cmd == 'append':
        l.append(int(user_input[1]))
    elif cmd == 'sort':
        l.sort()
    elif cmd == 'pop':
        l.pop()
    elif cmd == 'reverse':
        l.reverse()



# Sample Input:
# 12
# insert 0 5
# insert 1 10
# insert 0 6
# print
# remove 6
# append 9
# append 1
# sort
# print
# pop
# reverse
# print

# Sample Output:
# [6, 5, 10]
# [1, 5, 9, 10]
# [9, 5, 1]