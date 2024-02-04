def from_decimal(d, b):
    if d == 0:
        print("0")
        return
    if d < 0:
        print("ERROR! negative integer")
        return
    if b <= 0 or b > 36:
        print("ERROR! invalid base")
        return
    remain_list = []
    while d != 0:
        s = d//b
        r = d % b
        if r <= 9:
            remain_list.append(r)
        else:
            remain_list.append(chr(r + 55))
        d = s
    remain_list.reverse()
    print("convert from decimal to number base " +
          str(b) + " = " + "".join(map(str, remain_list)))


def to_decimal(s, b):
    if b <= 0 or b > 36:
        print("ERROR! invalid base")
        return
    s_list = [*str(s)]
    s_list.reverse()
    n = len(s)
    ans = 0
    for i in range(n):
        e = s_list[i]
        if e.isalnum():
            if e.isalpha():
                e = e.capitalize()
                e = ord(e) - 55
            if int(e) > b:
                print("ERROR!! invalid number")
                return
            add = int(e) * (b ** i)
            ans += add
        else:
            print("ERROR!! Invalid character")
            return
    print("convert number base " + str(b) + " to decimal = " + str(ans))


if __name__ == '__main__':
    while True:
        select = input("1 - Convert from Decimal to Other Base\n"
                       "2 - Convert from Other Base to Decimal\n"
                       "3 - Exit\n>> ")
        print("-" * 50)
        if select == "1":
            try:
                decimal_input = int(input("Put your decimal number here: "))
                base_input = int(input("Put your base number here: "))
                from_decimal(decimal_input, base_input)
            except ValueError:
                print("ERROR Invalid input!!")
        elif select == "2":
            try:
                number_input = input("Put your number: ")
                base_input = int(input("Put your base number here: "))
                to_decimal(number_input, base_input)
            except ValueError:
                print("ERROR Invalid input!!")
        elif select == "3":
            exit(0)
        else:
            print("Invalid Input!! please put only '1' or '2' or '3'")
        print("-" * 50)
        print()