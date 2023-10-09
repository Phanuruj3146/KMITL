import turtle as t

t.speed(1)


def branch(length, angle):
    if length > 10:
        t.forward(length)
        t.left(angle)
        branch(length - 20, angle)
        t.right(angle*2)
        branch(length - 20, angle)
        t.left(angle)
        t.backward(length)


branch(100, 30)
