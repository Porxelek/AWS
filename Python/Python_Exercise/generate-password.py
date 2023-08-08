import random
import string

while True :
    name = input("Please enter your full name : ").lower()
    if " " in list(name) :
        print("Please enter your name without any spaces!")
        continue  
    else :
        letter = [random.choice(name) for i in range(3)]
        digit = [random.choice(string.digits) for i in range(3)]  # digit = [str(random.randint(0,10)) for i in range(3)]
        print("".join(letter + digit))
        break
