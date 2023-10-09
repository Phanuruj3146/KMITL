import csv
file = open('confirmed-cases.csv',encoding="utf8")
onset = {}
for i in csv.reader(file) :
    if i[9] in onset :
        onset[i[9]] += 1
    else :
        onset[i[9]] = 1

sort = sorted(onset.items(), key=lambda x: x[1], reverse=True)

for i in range(10) :
    print(sort[i+2])