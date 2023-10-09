import turtle


def draw_clock():
    t = turtle.Turtle()
    t.speed(0)
    t.pensize(3)
    t.hideturtle()
    t.penup()
    t.goto(0, -200)
    t.pendown()
    t.circle(200)
    t.penup()
    t.left(90)
    t.goto(0, 0)
    for i in range(12):
        t.fd(180)
        t.pendown()
        t.fd(20)
        t.penup()
        t.goto(0, 0)
        t.right(360/12)

    for i in range(60):
        t.fd(190)
        t.pendown()
        t.fd(10)
        t.penup()
        t.goto(0, 0)
        t.right(360/60)


def draw_arm(h, m, s):
    t = turtle.Turtle()
    t.speed(0)
    t.pensize(3)
    t.hideturtle()

    # for hour arm
    t.setheading(90)
    t.pensize(10)
    t.right((h*30)+(m//2))
    t.pendown()
    t.fd(100)
    t.penup()
    t.home()
    t.setheading(90)

    # for minute arm
    t.right(m*6)
    t.pensize(5)
    t.pendown()
    t.fd(160)
    t.penup()
    t.home()
    t.setheading(90)

    # for second arm
    t.right(s * 6)
    t.pensize(4)
    t.color("red")
    t.pendown()
    t.fd(160)
    t.penup()
    t.home()
    t.setheading(90)
    turtle.done()


def main():
    try:
        arr = input("put the time by using this format 'HH:MM:SS' >>> ")
        time_list = arr.split(":")
        h = int(time_list[0])
        m = int(time_list[1])
        s = int(time_list[2])

        if len(time_list) > 3 or len(time_list) < 3:
            print("ERROR!! missing/too many input")
            return
        if h > 24 or h < 0:
            print("ERROR!! invalid hour input")
            return
        if m > 59 or m < 0 or s > 59 or s < 0:
            print("ERROR!! invalid minute/seconds input")
            return

    except ValueError:
        print("ERROR Invalid input!!")
        return

    draw_clock()
    draw_arm(h, m, s)


main()

# 2:30:45
# 17:45:25
# 25:04:24
# -5:05:22
# 5:-35:11
# 1:25:-2
# 4:69:100
# tds:d0:90
