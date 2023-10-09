def factorial(n):
    return 1 if (n==1 or n==0) else n * factorial(n - 1);

n = int(input())
if n > 0:
    for i in range(n):
        for j in range(i + 1):
            print(factorial(i)//(factorial(j)*factorial(i-j)), end=' ')
        print()