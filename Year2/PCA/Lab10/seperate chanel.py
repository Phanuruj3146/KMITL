
data_list = list()
with open("C:\\Users\\Phanuruj Sotthidat\\Desktop\\KMITL\\PCA\\Lab10\\small.txt") as f: 
    content = f.readlines()
    for line in content:
        data = line.rstrip()
        data_list = data.split()

class Node:
    def __init__(self, initdata):
        self.data = initdata
        self.next = None
        
    def get_data(self):
        return self.data
    
    def get_next(self):
        return self.next
    
    def change_data(self, new_data):
        self.data = new_data
        
    def change_next(self, new_next):
        self.next = new_next
        
    def __repr__(self):
        return str(self.data)
        
    def __str__(self):
        return str(self.data)

class linklist:
    def __init__(self):
        self.head = None
        self.size = 0
        
    def is_empty(self):
        if self.head == None:
            return True
        
        elif self.head != None:
            return False
        
    def insert_linklist(self, word):
        
        temp = Node(word)
        temp.change_next(None)
        if self.is_empty():
            self.head = temp
            
        elif not self.is_empty():
            current = self.head
            while current.get_next() != None:
                current = current.get_next()
                self.size += 1
                
            current.change_next(temp)
            
    def get_size(self):
        return self.size
    
    def __repr__(self):
        value = str()
        current = self.head
        while current != None:
            value = value + str(current) + ' => '
            current = current.next
        value = value + ' None '
        return value
    
    def __str__(self):
        value = str()
        current = self.head
        while current != None:
            value = value + str(current) + ' => '
            current = current.next
        value = value + ' None '
        return value
            
class myhash:
    def __init__(self):
        self.table = dict()
        self.total_word = 0
        self.size = 69
        self.prime_size = 2
        self.load = 0
        self.expansions = 0
        self.total_collison = 0
        
    def hash(self,str):
        h = 0
        for ch in str:
            h *= 37
            h += ord(ch)
        h %= self.size
        return h
        
    def insert_word_to_hash(self):
        for word in data_list:
            key = self.hash(word)
            if key not in self.table:
                if self.size == 0:
                    prime_num_size = self.fine_closest_prime(self.prime_size)
                    self.size = prime_num_size
                    # print(self.size)
                    self.prime_size = prime_num_size
                    
                self.load += 1
                self.size -= 1
                self.expansions += 1
                self.total_word += 1
                value = linklist()
                value.insert_linklist(word)
                self.table[key] = value
                
            elif key in self.table:
                if self.load/self.size >= 0.5:
                    # print(self.load/self.size)
                    while self.load/self.size >= 0.5:
                        prime_num_size = self.fine_closest_prime(2 * self.prime_size)
                        self.expansions += 1
                        self.size = prime_num_size
                        # print(self.size)
                        self.prime_size = prime_num_size
                self.load += 1
                self.total_collison += 1
                self.total_word += 1
                
                value = self.table[key]
                value.insert_linklist(word)
                # 
        # print(self.expansions)
        print(self.table)
        print(f'Total word in table : {self.total_word}')
        
    def max_collison(self):
        collison_list = list()
        for key in self.table.keys():
            collison_list.append(self.table[key].get_size())
        
        # print(collison_list)
        # print(self.table.keys())
        print(f'the max collison is {max(collison_list)}')
        return max(collison_list)
    
    def get_expansions(self):
        print(f'Total expansion : {self.expansions}')
        return self.expansions
    
    def get_total_collison(self):
        print(f'Total collison : {self.total_collison}')
        return self.total_collison
    
    def fine_closest_prime(self, num):
        count = 1
        while count < num:
            holder2 = num + count
            holder2_chk = self.chk_prime(holder2)
            if holder2_chk:
                # print(f"closest prime is {holder2}")
                return holder2
            else:
                count = count + 1
                
    def chk_prime(self, num):
        if num > 1:
            for i in range(2, num // 2+1):
                if num % i == 0:
                    return False
                    break
            else:
                return True
            
        else:
            return False
        
    def check_word(self, word, input):
        correctness = 0
        if len(word) == len(input):
            for i in range(len(input)):
                if word[i] != input[i]:
                    correctness += 1
                    if correctness > 1:
                        return False
                    
            return True
        
        else:
            return False
        
    def find_word(self, word):
        near_correct_word = list()
        for key in self.table.keys():
            value = self.table[key]
            current = value.head
            while current is not None:
                if self.check_word(current.data, word):
                    near_correct_word.append(current.data)
                
                current = current.next
                
        if word in near_correct_word:
            print(f"{word} is correctly spelled")
            
        else:
            print(f"{word} is not in the dictionary")
            print(f"Possible correction are : {str(near_correct_word)[1:-1]}")
                
hash1 = myhash()
hash1.insert_word_to_hash()
hash1.max_collison()
hash1.get_expansions()
hash1.get_total_collison()
hash1.find_word('bird')
hash1.find_word('wird')
