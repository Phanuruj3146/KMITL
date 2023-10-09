metrix = [ [ 1, 2, 3, 4, 5, 6],
  [ 2, 4, 6, 8, 10, 12],
  [ -3, -2, -1, 0, 1, 2] ]

num = []
for i in metrix:
    for j in i:
        if j not in num:
            num.append(j)
num.sort()
print('%d distinct elements' %len(num))
print('The transpose is')

for i in range(len(metrix[0])):
    for j in metrix:
        print(j[i], end=' ')
    print()