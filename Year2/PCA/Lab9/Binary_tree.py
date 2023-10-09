<<<<<<< HEAD
f = open('C:\\Users\\ASUS\\Documents\\KMITL\\PCA\\Lab9\\users7.txt')
=======
f = open('users7.txt')
>>>>>>> a652a939b04461737892a877fa968e7f4ce7ec93
credentials = f.read()
creArr = credentials.split('\n')
for i in creArr:
    cret = i.split(" ")
<<<<<<< HEAD
    username = cret[0]
    password = cret[1]
    print(cret)
=======
    print(cret)
    username = cret[0]
    password = cret[1]

>>>>>>> a652a939b04461737892a877fa968e7f4ce7ec93
