import csv
with open('confirmed-cases.csv',encoding="utf8") as file :
    provinceOnset = {}
    day = ['1/7/2021', '2/7/2021', '3/7/2021']
    for line in csv.reader(file) :
        if line[1][2] == '7' and int(line[1][0]) in range(1, 8) :
            if line[9] in provinceOnset :
                provinceOnset[line[9]] += 1
            else :
                provinceOnset[line[9]] = 1

    sortedProvince = sorted(provinceOnset.items(), key=lambda x: x[1], reverse=True)

for i in range(10) :
    print(sortedProvince[i])