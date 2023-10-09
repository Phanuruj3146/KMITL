source = input()
code = input()
st = []
similar = []
for i in range(len(source)):
    if i+len(code) <= len(source):
        st.append(source[i:i+len(code)])
for i in st:
    cnt = 0
    for j in range(len(code)):
        if i[j] == code[j]:
            cnt += 1
    if cnt >= len(code)-1:
        similar.append(i)
for i in similar:
    if i in st:
        print('%d %s' %(st.index(i), i))
        st[st.index(i)] = '0000'