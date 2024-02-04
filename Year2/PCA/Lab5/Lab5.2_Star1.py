import turtle as t

t.speed(1)
t.penup()


def stars1(n):
    print("*" * n)
    if n > 1:
        stars1(n - 1)
    print("*" * n)


def draw(n):
    for i in range(n):
        t.dot(5, "black")
        t.fd(10)


def tur_stars1(n):
    y = 10 * n
    t.goto(0, y)
    draw(n)
    if n > 1:
        tur_stars1(n - 1)
    y = -10 * n
    t.goto(0, y+10)
    draw(n)



stars1(5)
tur_stars1(7)
t.exitonclick()
