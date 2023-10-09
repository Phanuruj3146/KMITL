import random


class stack:
    def __init__(self):
        self.stack = []

    def push(self, element):
        self.stack.append(element)

    def pop(self):
        popElement = self.stack[-1]
        self.stack.pop(-1)
        return popElement

    def peek(self):
        return self.stack[-1]

    def is_empty(self):
        if len(self.stack.append) == 0:
            return True
        else:
            return False

    def size(self):
        return len(self.stack)

    def contain(self, element):
        if element in self.stack:
            return True
        else:
            return False

    def returnLs(self):
        return self.stack


class parking:
    def __init__(self):
        self.parkingLot = stack()

    def returnStack(self):
        return self.parkingLot

    def park(self, car):
        self.parkingLot.push(car)

    def backOut(self, car, stackB):
        carList = stackB.returnStack()
        if self.parkingLot.contain(car):
            origiSize = carList.size()
            for i in range(self.parkingLot.size()):
                if car == self.parkingLot.peek():
                    self.parkingLot.pop()
                    print(f"Removing car number {car}...")
                    print(f"Soi 1: {self.parkingLot.returnLs()}")
                    print(f"Soi 2: {carList.returnLs()} \n")
                    break
                else:
                    np = self.parkingLot.pop()
                    carList.push(np)
                    print(f"moving {np} to Soi 2...")
                    if carList.size() > 5:
                        print("Soi Full!!!")
                        exit()
                    else:
                        print(f"Soi 1: {self.parkingLot.returnLs()}")
                        print(f"Soi 2: {carList.returnLs()} \n")
            newSize = carList.size()
            print("Getting the cars back to it's soi... \n")
            for j in range(newSize - origiSize):
                self.parkingLot.push(carList.pop())
                print(f"Soi 1: {self.parkingLot.returnLs()}")
                print(f"Soi 2: {carList.returnLs()} \n")
        elif carList.contain(car):
            origiSize = self.parkingLot.size()
            for i in range(carList.size()):
                if car == carList.peek():
                    carList.pop()
                    print(f"Removing car number {car}...")
                    print(f"Soi 1: {self.parkingLot.returnLs()}")
                    print(f"Soi 2: {carList.returnLs()} \n")
                    break
                else:
                    np = carList.pop()
                    self.parkingLot.push(np)
                    if self.parkingLot.size() > 5:
                        print("Soi Full!!!")
                        exit()
                    else:
                        print(f"moving {np} to Soi 2...")
                        print(f"Soi 1: {self.parkingLot.returnLs()}")
                        print(f"Soi 2: {carList.returnLs()} \n")
            newSize = self.parkingLot.size()
            print("Getting the cars back to it's soi... \n")
            for j in range(newSize - origiSize):
                carList.push(self.parkingLot.pop())
                print(f"Soi 1: {self.parkingLot.returnLs()}")
                print(f"Soi 2: {carList.returnLs()} \n")


def initialize():
    print("\n")
    soiArr = []
    for i in range(2):
        soiArr.append(parking())
    for i in soiArr:
        carNum = random.randint(2, 4)
        for j in range(carNum):
            carPlate = random.randint(1, 1000)
            while i.returnStack().contain(carPlate):
                carPlate = random.randint(1, 1000)
            i.park(carPlate)
        print(i.returnStack().returnLs())
    print("\n")
    return soiArr


def inputMode(soiArr):
    modeInput = int(input("1. parking, 2. backout: "))
    print("\n")
    if modeInput == 1:
        carNumber = int(input("Enter car licence plate number: "))
        soiNum = int(input("Enter the number of soi you want to park: ")) - 1
        soiArr[soiNum].park(carNumber)
        print(f"Your car with the number {carNumber} has been parked! \n")
        for j in soiArr:
            print(j.returnStack().returnLs())
    elif modeInput == 2:
        carPlate = int(input("Enter the car number you want to backout: "))
        print("\n")
        for i in range(2):
            soiArr[0].backOut(carPlate, soiArr[1])
            print(soiArr[i].returnStack().returnLs())
        print(f"Your car with the number {carPlate} has been backed out! \n")
    else:
        print("Enter the correct input!!!")
        inputMode

    inputMode(soiArr)


def start():
    soiArr = initialize()
    inputMode(soiArr)


start()