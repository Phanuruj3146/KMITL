import random
import turtle


# Class point from Lab 4
class Point:
    def __init__(self, x_init, y_init):
        self.x = x_init
        self.y = y_init

    def get_x(self):
        return self.x

    def get_y(self):
        return self.y

    def __repr__(self):
        return "".join(["(", str(self.x), ",", str(self.y), ")"])

    def __str__(self):
        return "(%s, %s)" % (self.x, self.y)


class Line():
    def __init__(self, pointLs, t):
        self.pointLs = pointLs
        self.turtle = t

    def __str__(self):
        return self.pointLs

    def getPts(self):
        return self.pointLs

    def draw(self):
        for i in range(len(self.pointLs)):
            self.turtle.penup()
            x, y = self.pointLs[i].get_x(), self.pointLs[i].get_y()
            self.turtle.goto(x, y)
            self.turtle.dot()
            self.turtle.write("P" + str(i))
            try:
                self.turtle.pendown()
                self.turtle.goto(self.pointLs[i + 1].get_x(), self.pointLs[i + 1].get_y())
                self.turtle.penup()
            except:
                continue

    def dot(self):
        for i in range(len(self.pointLs)):
            self.turtle.penup()
            x, y = self.pointLs[i].get_x(), self.pointLs[i].get_y()
            self.turtle.goto(x, y)
            self.turtle.dot()
            self.turtle.write("P" + str(i))

    def join(self, line2):
        x = self.pointLs
        y = line2.getPts()

        for i in range(1, len(self.pointLs)):
            x.pop(0)

        for i in range(1, len(line2.getPts())):
            y.pop(1)

        x.extend(y)

        for i in range(len(x)):
            if i % 4 == 0:
                self.turtle.penup()
                self.turtle.goto(x[i].get_x(), x[i].get_y())
                self.turtle.pendown()
                self.turtle.goto(x[i - 1].get_x(), x[i - 1].get_y())
                self.turtle.penup()
            else:
                continue
        return y

    def joinOwn(self, line2):
        lastPoint = self.pointLs[-1]
        firstPoint = line2.getPts()
        self.turtle.penup()
        self.turtle.goto(firstPoint[0].get_x(), firstPoint[0].get_y())
        self.turtle.pendown()
        self.turtle.goto(lastPoint.get_x(), lastPoint.get_y())
        self.turtle.penup()

    def zigzag1(self, line):
        ptsList = line.getPts()
        line3 = []
        if len(self.pointLs) >= len(ptsList):
            length = len(self.pointLs)
        else:
            length = len(ptsList)
        for i in range(length):
            try:
                line3.append(self.pointLs[0])
                self.pointLs.pop(0)
                line3.append(ptsList[0])
                ptsList.pop(0)
            except:
                try:
                    line3.append(ptsList[0])
                    ptsList.pop(0)
                except:
                    ptsList.pop(0)
                    continue

        for i in range(len(line3)):
            try:
                self.turtle.penup()
                self.turtle.goto(line3[i].get_x(), line3[i].get_y())
                self.turtle.pendown()
                self.turtle.goto(line3[i + 1].get_x(), line3[i + 1].get_y())
                self.turtle.penup()
            except:
                continue
        return self.pointLs, ptsList

    def zigzag2(self, line1):
        ptList = line1.getPts()
        if len(self.pointLs) >= len(ptList):
            length = len(self.pointLs)
        else:
            length = len(ptList)
        for i in range(length * 2):
            if i % 2 == 0:
                self.pointLs.insert(i, ptList[int(round(i / 2, 0))])
            else:
                continue

        for i in range(len(self.pointLs)):
            try:
                self.turtle.penup()
                self.turtle.goto(self.pointLs[0].get_x(), self.pointLs[0].get_y())
                self.turtle.pendown()
                self.turtle.goto(self.pointLs[1].get_x(), self.pointLs[1].get_y())
                self.turtle.penup()
                self.pointLs.pop(0)
            except:
                self.pointLs.pop(0)
                continue
        return self.pointLs


class line_tester():
    def __init__(self, t):
        self.t = t

    def joinLineTester(self, noLine):
        lineLs = []
        for j in range(noLine):
            pointLs = []
            noPts = int(input("Enter amount of point: "))
            for i in range(noPts):
                x, y = random.randint(-200, 200), random.randint(-200, 200)
                pointLs.append(Point(x, y))
            lineLs.append(Line(pointLs, self.t))
        for i in lineLs:
            i.draw()
        return lineLs

    def zigzag1Tester(self):
        lineLs = []
        for i in range(2):
            noPts = int(input("Enter the amount of points: "))
            pointLs = []
            for j in range(noPts):
                x, y = random.randint(-200, 200), random.randint(-200, 200)
                pointLs.append(Point(x, y))
            lineLs.append(Line(pointLs, self.t))

        for i in lineLs:
            i.dot()

        return lineLs


def start():
    t = turtle.Turtle()
    t.speed(1)
    turtle.screensize(canvwidth=500, canvheight=500)
    userInput = int(input("Enter question No: "))

    if userInput == 1:
        tester = line_tester(t)
        noLine = int(input('Enter number of lines: '))
        inputMode = int(input("Enter mode: "))
        linels = tester.joinLineTester(noLine)
        if inputMode == 1:
            for i in range(len(linels)):
                try:
                    linels[i].join(linels[i + 1])
                except:
                    continue

        elif inputMode == 2:
            for i in range(len(linels)):
                try:
                    linels[i].joinOwn(linels[i + 1])
                except:
                    continue

    elif userInput == 2:
        tester = line_tester(t)
        lineLs = tester.zigzag1Tester()
        line3 = lineLs[0].zigzag1(lineLs[1])
        print(f"The length of line 1 is: {len(line3[0])}")
        print(f"The length of line 2 is: {len(line3[1])}")

    elif userInput == 3:
        tester = line_tester(t)
        lineLs = tester.zigzag1Tester()
        print(f"The length of line 2 is: {len(lineLs[0].zigzag2(lineLs[1]))}")


start()
turtle.exitonclick()