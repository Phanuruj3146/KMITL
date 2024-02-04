import turtle as t
import random


class SimTurtle:
    def __init__(self, color, spacing_x):
        self.color = color
        self.spacing_x = spacing_x
        self.turtle = t.Turtle()
        self.turtle.speed(0)
        self.turtle.left(90)
        self.turtle.color(self.color)
        self.turtle.shape("turtle")
        self.turtle.turtlesize(2)
        self.turtle.pensize(2)
        self.turtle.penup()
        self.turtle.speed(6)

    def set_tur(self, i):
        self.turtle.setpos((-WIDTH // 2 + (i + 1) * self.spacing_x), -HEIGHT // 2 + 20)
        self.turtle.pendown()

    def get_color(self):
        return self.color

    def get_pos(self):
        return self.turtle.pos()

    def get_turtle(self):
        return self.turtle

    def walk(self):
        choice_move = random.randint(1, 2)
        distance = random.randrange(1, 20)
        if choice_move == 1:
            self.turtle.fd(distance + (distance//1.3))
        else:
            self.turtle.back(distance)


class TurtleFPO(SimTurtle):
    def __init__(self, color, spacing_x, energy):
        super().__init__(color, spacing_x)
        self.energy = energy

    def walk(self):
        choice_move = random.randint(1, 2)
        distance = random.randrange(1, 20)
        angle = random.randrange(45, 135)
        if self.energy > 0:
            self.turtle.setheading(angle)
            if choice_move == 1:
                self.turtle.fd(distance + distance)
            else:
                self.turtle.back(distance)
            self.energy -= distance
        else:
            self.energy = 0
            return self.energy
        print(f"{self.color} energy is at {self.energy}")


def set_start(num_racer):
    racer_list = []
    fpo_list = []
    create_canvas(WIDTH, HEIGHT)
    random.shuffle(COLORS)
    colors = COLORS[:num_racer]
    spacing_x = WIDTH // (len(colors) + 1)
    for c in colors:
        choice = random.randint(1, 2)
        energy_random = random.randint(1000, 1500)
        if choice == 1:
            simple_tur = SimTurtle(c, spacing_x)
            racer_list.append(simple_tur)
        if choice == 2:
            robot_tur = TurtleFPO(c, spacing_x, energy_random)
            racer_list.append(robot_tur)
            fpo_list.append(robot_tur)

    i = 0
    for turtle in racer_list:
        turtle.set_tur(i)
        i += 1

    ran_out_energy = 0

    if len(fpo_list) == len(racer_list):
        while True:
            for racer in racer_list:
                racer.walk()

                x, y = racer.get_pos()
                if y >= HEIGHT // 2 - 10:
                    return 2, racer.color
                if racer.energy <= 0:
                    print(f"{racer.color} last energy is at {racer.energy}")
                    ran_out_energy += 1
                    print(ran_out_energy)
                    if ran_out_energy == len(fpo_list):
                        return 1, racer.color
    else:
        while True:
            for racer in racer_list:
                racer.walk()

                x, y = racer.get_pos()
                if y >= HEIGHT // 2 - 10:
                    return 2, racer.color


def get_number():
    while True:
        turtle_racer = input('Enter the number of racers (2 - 10): ')
        if turtle_racer.isdigit():
            turtle_racer = int(turtle_racer)
        else:
            print('Input is not numeric... Try Again!')
            continue

        if 2 <= turtle_racer <= 10:
            return turtle_racer
        else:
            print('Number not in range 2-10. Try Again!')


def create_canvas(w, h):
    screen = t.Screen()
    screen.setup(w, 720)
    screen.title('Turtle Racing!')
    t.speed(0)
    t.ht()
    t.pensize(5)
    t.penup()
    t.setposition(-w//2, -h//2 + 20)
    t.pendown()
    t.fd(700)
    t.penup()
    t.setposition(-10, -330)
    t.pendown()
    t.write("START", font=("Verdana", 15, "bold"))
    t.penup()
    t.setposition(-w//2, (h//2))
    t.pendown()
    t.fd(700)
    t.penup()
    t.setposition(-10, 320)
    t.pendown()
    t.color("red")
    t.write("END", font=("Verdana", 15, "bold"))
    t.penup()


WIDTH, HEIGHT = 700, 600
COLORS = ['red', 'green', 'blue', 'orange', 'yellow', 'black', 'purple', 'pink', 'brown', 'cyan']

if __name__ == '__main__':
    user_input = int(get_number())
    num, winner = set_start(user_input)
    if num == 1:
        t.penup()
        t.setposition(-150, 0)
        t.pendown()
        t.color("black")
        t.write("NO ONE WIN!?", font=("Verdana", 30, "bold"))
        t.ht()
    else:
        t.penup()
        t.setposition(-220, 0)
        t.pendown()
        t.color(winner)
        t.write(winner + " is the winner!!", font=("Verdana", 30, "bold"))
        t.ht()
        print("The Winner is!! " + winner)
    t.exitonclick()


# 1
# 2
# 5
# 10
# 23
# Love
# if the racers have only the abnormal turtle and the energy of each turtle is running out
