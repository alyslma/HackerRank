# https://www.hackerrank.com/challenges/counting-valleys/problem

def countingValleys(steps, path):
    position = 0
    valley = 0
    
    for x in path:
        if x == "U":
            position += 1
            if position == 0:
                valley += 1
        else:
            position -= 1
            
    return valley        

steps = int(input("Number of steps on the hike: ").strip())
path = input("Describe the path: ")
result = countingValleys(steps, path)

print(f"Number of valleys traversed: {result}\n")

#####--------- Original submission: ---------#####
# At first I thought that I would have to explicitly differentiate between the position changing to 0 from a negative number and a positive number with a boolean.
# However, after further thought, knowing that the position equals to 0 after adding 1 implies that it was previously a negative number.
# So to modify my original code, I added a condition underneath "position += 1" to take the above into account and add one to valley.

# def countingValleys(steps, path):
#     position = 0
#     valley = 0
#     negative = False

#     for x in path:
#         if x == "U":
#             position += 1
#         else:
#             position -= 1

#         if position < 0:
#             negative = True
#         elif position > 0:
#             negative = False

#         if position == 0 and negative == True:
#             valley += 1 

#     return valley 



### Sample input:
# 8
# UDDDUDUU

### Sample output:
# 1