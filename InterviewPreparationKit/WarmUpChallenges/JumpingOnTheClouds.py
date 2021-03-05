# https://www.hackerrank.com/challenges/jumping-on-the-clouds/problem

# There is a new mobile game that starts with consecutively numbered clouds. 
# Some of the clouds are thunderheads and others are cumulus. 
# The player can jump on any cumulus cloud having a number that is equal to the number of the current cloud plus 1 or 2. 
# The player must avoid the thunderheads. 
# Determine the minimum number of jumps it will take to jump from the starting postion to the last cloud. 
# It is always possible to win the game.

# For each game, you will get an array of clouds numbered 0 if they are safe or 1 if they must be avoided.


# Assuming a two-space jump each time unless cloud expected to land on is unsafe, then only add 1 to index to represent jumping one space after the fact.
# In other words, landing on 1 from two spaces away means that a single-space jump came first then a two-space jump.
# The function here assumes a two-space jump then takes into account the single-space jump after the fact if applicable.
def jumpingOnClouds(n, c):
    x = 0
    count = 0
    while x < n-1:
        if c[x] == 0:
            x += 1 # if cloud two spaces away is safe, add an additional 1 to index to represent completed jump to safe cloud
        x += 1 # add 1 to index to represent at least moving one space (if expected to land on an unsafe cloud, only add 1 to index to start from the safe cloud right after the unsafe one)
        count += 1 # assuming two space jump each time
    return count

n = int(input("Total number of clouds: "))
c = list(map(int, input("Describe the clouds: ").rstrip().split()))
result = jumpingOnClouds(n, c)

print(f"Minimum number of jumps needed to win the game: {result}\n")




### Sample input:
# 6
# 0 0 0 0 1 0

### Sample output:
# 3