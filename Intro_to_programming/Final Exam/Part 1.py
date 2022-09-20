def encrypt(txt, num):
    ceasar = ""
    for i in txt:
        if i.isupper():
            posi = (ord(i) - 65 + num) % 26 + 65
            ceasar += chr(posi)
        elif i.islower():
            posi = (ord(i) - 97 + num) % 26 + 97
            ceasar += chr(posi)
        else:
            ceasar += i
    return ceasar

def decrypt(txt, num):
    ceasar = ""
    for i in txt:
        if i.isupper():
            posi = (ord(i) - 65 - num) % 26 + 65
            ceasar += chr(posi)
        elif i.islower():
            posi = (ord(i) - 97 - num) % 26 + 97
            ceasar += chr(posi)
        else:
            ceasar += i
    return ceasar
print(encrypt("abc", 3))
print(decrypt("abc", 3))