# https://www.hackerrank.com/challenges/sock-merchant/problem

from collections import Counter

def sockMerchant(n, ar):
    pairs = 0
    ar_dict = Counter(ar)
    values = ar_dict.values()
    for x in values:
        pairs += x//2
    return pairs

n = int(input("Total number of socks: "))
ar = list(map(int, input("Colors of each sock: ").rstrip().split()))
result = sockMerchant(n, ar)

print(f"Total number of matching pairs of socks: {result}\n")


### Sample input:
# 9
# 10 20 20 10 10 30 50 10 20

### Sample output:
# 3