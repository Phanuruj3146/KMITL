x = []
x2 = []
for i in range(20):
    n = int(input())
    x2.append(n)
    if n not in x:
        x.append(n)
x.sort()
print(x[1])
print(x[-2])
print(sum(x2)/20)

n = len(x2)
x2.sort()

median1 = x2[n // 2]
median2 = x2[n // 2 - 1]
median = (median1 + median2) / 2

print(median)