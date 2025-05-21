# Hello world
println("Hello world!")

# Assignments
a = 1
b = "qwerty"
c = 1.99
d = 1//4
e = [1,2,3]
f = (1,2,3)
g = Set(e)

# Checking the types
typeof(a)
typeof(b)
typeof(c)
typeof(d)
typeof(e)
typeof(f)
typeof(g)

# Loops
for i in 1:10
    println(i)
end
i = 1
while i <= 10
    println(i)
    i += 1
end
a = [i for i in 1:10]
b = [(i,j) for i in 1:10, j in 1:10]

# Comparisons
1 == 1
2 == 1
typeof(2) == typeof(1)
"1" == 1
typeof("1") == typeof(1)
a == [i for i in 1:10]
b == [(i,j) for i in 1:10, j in 1:10]
a == b

# Conditionals
a = 1
b = 1
if a == b
    println("a equals b")
else
    println("a not equal to b")
end
a = 2
c = 2
if a == b
    println("a equals b")
elseif a == c
    println("a not equal to b but a equals c")
else
    println("a not equal to b and not equal to c either")
end
d = (a == b ? "option of true" : "option if false")

# Functions
function hello_world()
    println("Hello world!")
end
hello_world()
function sum(a, b)
    return a+b
end
sum(8,9)
sum(8.0,9.0)
function sum_integers(a::Integer, b::Integer)
    return a+b
end
sum_integers(8, 9)
sum_integers(8.0, 9.0)
function sum_integers(a::Float64, b::Float64)
    return a+b
end
sum_integers(8.0, 9.0)

# Built-in operators
2+3
2-3
2*3
2^3
2/3
2//3
20%3
div(20, 3)
"2"*"3"

# Your task: write a function to check if a number is prime or not
function is_prime(n::Integer)
    # TODO
end

# Your task: implement Sieve of Eratosthenes
function sieve_eratosthenes(n::Integer)
    # TODO
end

# Your task: write a function which computes the nth Fibonacci number;
# Do it using the recursion via the function itself only and without calling the function itself
function fibonacci_function_recursion(n::Integer)
    # TODO
end
function fibonacci_no_function_recursion(n::Integer)
    # TODO - hint - instantiate an appropriate array
end
@time fibonacci_function_recursion(20)
@time fibonacci_no_function_recursion(20)
