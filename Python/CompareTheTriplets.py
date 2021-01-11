# https://www.hackerrank.com/challenges/compare-the-triplets/problem

def compareTriplets(a, b):
    alice = bob = 0
    for x, y in zip(a, b):
        if x > y:
            alice += 1
        elif x < y:
            bob += 1
    return alice, bob

a = list(map(int, input("Alice's challenge rating: ").rstrip().split()))
b = list(map(int, input("Bob's challenge rating: ").rstrip().split()))
result = compareTriplets(a, b)

# prints Alice's and Bob's comparison scores
print(' '.join(map(str, result)))
print('\n')

#####--------- Original submission: ---------#####
# def compareTriplets(a, b):
#     alice = 0
#     bob = 0
#     for x in range(len(a)):
#         if a[x] > b[x]:
#             alice += 1
#         elif a[x] < b[x]:
#             bob += 1
#     return alice, bob



### Sample input:
# 5 6 7
# 3 6 10

### Sample output:
# 1 1