def myfunction():
    print("Inside my_funtion()")
    x = range(5,50,2)
    for n in x:
        print(n,end="-")
        
    print("Out of the function")



print("Out of the function")
myfunction()
print("\nOther operations")
myfunction()
print("\nEnd of the program")

def myfunctionB(colors):
    for x in colors:
        print(x)

my_colors=["blue", "red", "green", "yellow"]

myfunctionB(my_colors)

def my_function3(fname):
    print(fname + "Studen")
    
my_function3("Luis")
my_function3("Gina")
my_function3("Carlos")
my_function3("Diana")

def my_function4(fname, quarter):
    if quarter>6:
        print(fname+"is going to be an engineer")
    else:
        print(fname+"is going to be a teachnician")
my_function4("Luis",4)
my_function4("Gina",8)
my_function4("Carlos",10)
my_function4("Diana",3)

def my_function5(student1,student2,student3):
    print("They youngest child is "+ student3)
    
my_function5(student3="Gaby",student1="Alberto",student2="Angel")

def my_function6(lenguage="python"):
    print("im programin in " + lenguage)
    
my_function6("java")
my_function6()

def my_function7(x=1):
    return 5*x

variable1=my_function7(3)
variable2=my_function7(7)

print(variable1, variable2, my_function7(9))