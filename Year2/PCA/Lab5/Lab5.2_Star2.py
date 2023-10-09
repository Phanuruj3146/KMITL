import turtle as t

t.speed(1)
t.penup()


def stars2(n, f):
    if n <= 0:
        return
    else:
        print("*" * f)
        stars2(n - 1, f + 1)
        print("*" * f)


def draw(n):
    for i in range(n):
        t.dot(5, "black")
        t.fd(10)


def tur_stars2(n):
    draw(n)
    y = -10 * n
    t.goto(0, y)
    if n < 5:
        tur_stars2(n + 1)
    y = 10 * n
    t.goto(0, y - 100)
    draw(n)


stars2(5, 1)
tur_stars2(1)
t.exitonclick()
