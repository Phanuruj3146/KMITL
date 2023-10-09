def fib_re(n):
    if n == 0:
        return 0
    if n == 1 or n == 2:
        return 1
    else:
        return fib_re(n-1) + fib_re(n-2)
    
def fib_ite(n):
    if n == 0:
        return 0
    if n == 1 or n == 2:
        return 1
    else:
        x = 0
        y = 1
        for i in range(1, n):
            z = (x + y)
            x = y
            y = z
        return y


print(fib_re(int(input())))
