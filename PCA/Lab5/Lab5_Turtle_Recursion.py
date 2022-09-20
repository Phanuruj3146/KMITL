import turtle as t

t.speed(6)


def branch(branch_len):
    # if branch_len > 10:
    angle = 30
    t.forward(branch_len)
    t.left(angle)
    branch(branch_len * 0.3)
    t.right(angle * 2)
    branch(branch_len * 0.2)
    t.left(angle)
    t.backward(branch_len)


branch(100)
