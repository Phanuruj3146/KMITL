f = open('C:\\Users\\ASUS\\Documents\\KMITL\\PCA\\Lab9\\users7.txt')
credentials = f.read()
creArr = credentials.split('\n')
for i in creArr:
    cret = i.split(" ")
    username = cret[0]
    password = cret[1]
    print(cret)