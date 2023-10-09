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
        while current != None:
            next = current.getNext()
            if next != None:
                if current.getData() == next.getData():
                    current.setNext(next.getNext())
                else:
                    print(self.getList())
                    current = next
            else:
                print("mylist", self.getList())
                break

    def dble(self):
        current = self.head
        while current != None:
            dtemp = Node(current.getData())
            dtemp.setNext(current.getNext())
            current.setNext(dtemp)
            current = dtemp.getNext()


    def getList(self):
        current = self.head
        sList = []
        while current != None:
            sList.append(current.getData())
            current = current.getNext()
        # sList.reverse()
        return sList


def main():
    list1 = [0, 0, 0, 0, 1, 1, 0, 0, 0, 3, 3, 3, 1, 1, 0]
    list2 = [3, 7, 4, 2, 2]
    mylist = UnorderedList()
    # for i in list1:
    #     mylist.add(i)
    # mylist.squish()
    for i in list2:
        mylist.add(i)
    mylist.dble()
    print(mylist.getList())


main()
