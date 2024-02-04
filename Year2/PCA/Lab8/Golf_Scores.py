class Node:
    def __init__(self, initdata):
        self.data = initdata
        self.next = None

    def getData(self):
        return self.data

    def getNext(self):
        return self.next

    def setData(self, newdata):
        self.data = newdata

    def setNext(self, newnext):
        self.next = newnext


class UnorderedList:
    def __init__(self):
        self.head = None

    def isEmpty(self):
        return self.head == None

    def add(self, item):
        temp = Node(item)
        temp.setNext(self.head)
        self.head = temp

    def size(self):
        current = self.head
        count = 0
        while current != None:
            count = count + 1
            current = current.getNext()

        return count

    def search(self, item):
        current = self.head
        found = False
        while current != None and not found:
            if current.getData() == item:
                found = True
            else:
                current = current.getNext()

        return found

    def remove(self, item):
        current = self.head
        previous = None
        found = False
        while not found:
            if current.getData() == item:
                found = True
            else:
                previous = current
                current = current.getNext()

        if previous == None:
            self.head = current.getNext()
        else:
            previous.setNext(current.getNext())

    def remove_own(self, item):
        current = self.head
        if item == current.getData():
            self.head = current.next
        current = self.head
        while current.next is not None:
            if item == current.next.getData():
                break
            current = current.next
        if current.next is None:
            print("Node is not present!")
        else:
            current.next = current.next.next


    def squish(self):
        current = self.head
        next = current.getNext()

        while current != None:
            print(current.getData())
            if current.getData() == next.getData():
                print("remove", next.getData())
                self.remove_own(next.getData())
            else:
                current = next


def main():
    list1 = [0, 0, 0, 0, 1, 1, 0, 0, 0, 3, 3, 3, 1, 1, 0]
    mylist = UnorderedList()
    for i in list1:
        mylist.add(i)
    mylist.squish()


main()
