# https://www.hackerrank.com/challenges/nested-list

# Given the names and grades for each student in a class of N students, store them in a nested list and print the name(s) of any student(s) having the second lowest grade.
# Note: If there are multiple students with the second lowest grade, order their names alphabetically and print each name on a new line.

################################################################
name_score_list = []
for _ in range(int(input())):
    name = input()
    score = float(input())
    name_score_list.append([name, score]) 
second_lowest = sorted(set(score for name, score in name_score_list))[1]
print("\n".join([name for name, score in sorted(name_score_list) if score == second_lowest]))



# Sample Input:
# 5
# Harry
# 37.21
# Berry
# 37.21
# Tina
# 37.2
# Akriti
# 41
# Harsh
# 39

# Sample Output:
# Berry
# Harry


##### print(name_score_list)
# [['Harry', 37.21], ['Berry', 37.21], ['Tina', 37.2], ['Akriti', 41.0], ['Harsh', 39.0]]
##### print(second_lowest)
# 37.21