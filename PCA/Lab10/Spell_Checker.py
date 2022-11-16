def hash(str): 
    h = 0 
    for ch in str: 
        h *= 37 
        h += ord(ch) 
    return h 