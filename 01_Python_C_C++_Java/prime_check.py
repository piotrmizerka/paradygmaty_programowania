def is_prime(n: int) -> bool:
    # Numbers less than or equal to 1 are not prime
    if n <= 1:
        return False

    # Check divisibility from 2 up to √n
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0:
            return False

    return True

# Read input from the user
num = int(input("Enter a number: "))

# Check and output result
if is_prime(num):
    print(f"{num} is a prime number.")
else:
    print(f"{num} is not a prime number.")