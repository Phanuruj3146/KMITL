income = float(input("Taxable Income: "))
taxrate = 0
if income > 150000 and income <= 300000:
    taxrate = 5/100
elif income > 300000 and income <= 500000:
    taxrate = 10/100
elif income > 500000 and income <= 750000:
    taxrate = 15/100
elif income > 750000 and income <= 1000000:
    taxrate = 20/100
elif income > 1000000  and income <= 2000000:
    taxrate = 25/100
elif income > 2000000  and income <= 4000000:
    taxrate = 30/100
elif income > 4000000:
    taxrate = 35/100

if taxrate == 0:
    print("Exempt")
else:
    print(income * taxrate)