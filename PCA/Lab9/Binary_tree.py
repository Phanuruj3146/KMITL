f = open('users7.txt')
credentials = f.read()
creArr = credentials.split('\n')
for i in creArr:
    cret = i.split(" ")
    print(cret)
    username = cret[0]
    password = cret[1]

