class Line:
    def __init__(self, line):
        self.line = line

    def join_extend(self, new_line):
        self.line.extend(new_line)

    def join_manual(self, new_line):
        pass

    def zigzag1(self, new_line):
        pass

    def zigzag2(self, new_line):
        pass

    def get_line(self):
        return self.line

    # def __str__(self):
    #     return "(%s,%s)" % (self.x, self.y)


def main():
    pass

main()
