data_list = list()
with open("C:\\Users\\Phanuruj Sotthidat\\Desktop\\KMITL\\PCA\\Lab10\\full.txt") as f: 
    content = f.readlines()
    for line in content:
        data = line.rstrip()
        data_list = data.split()

class myhash:
    def __init__(self):
        self.table = dict()
        self.total_word = 0
        self.size = 69
        self.prime_size = 2
        self.load = 0
        self.expansions = 0
        self.total_collison = 0
        self.max_collison = 0
        self.total_word = 0
        
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
                value = word
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
                
                collison = 0
                while key in self.table.keys():
                    collison += 1
                    self.total_collison += 1
                    key += 1
                
                self.total_word += 1
                self.load += 1
                self.table[key] = word
                
                if collison > self.max_collison:
                    self.max_collison = collison
                
        # print(self.expansions)
        print(self.table)
        print(f'Total word in table : {self.total_word}')
        
    def get_max_collison(self):
        print(f'Max collison : {self.max_collison}')
        return self.max_collison
    
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
            if self.check_word(value, word):
                near_correct_word.append(value)
            
                
        if word in near_correct_word:
            print(f"{word} is correctly spelled")
            
        else:
            print(f"{word} is not in the dictionary")
            print(f"Possible correction are : {str(near_correct_word)[1:-1]}")
                
hash1 = myhash()
hash1.insert_word_to_hash()
hash1.get_max_collison()
hash1.get_expansions()
hash1.get_total_collison()
hash1.find_word('bird')
hash1.find_word('wird')