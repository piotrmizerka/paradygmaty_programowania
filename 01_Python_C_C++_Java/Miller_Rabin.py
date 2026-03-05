import random

class MillerRabin:
    def factor_two_power(self, n):
        s = 0
        while n % 2 == 0:
            s += 1
            n //= 2
        return s, n

    def power_modulo(self, a, n, mod):
        return pow(a, n, mod)

    def is_prime(self, n, k):
        if n == 3:
            return "prime"

        s, d = self.factor_two_power(n - 1)

        for _ in range(k):
            a = random.randint(2, n - 3)
            x = self.power_modulo(a, d, n)
            
            for _ in range(s):
                y = (x * x) % n
                if y == 1 and x != 1 and x != n - 1:
                    return "composite"
                x = y
            if x != 1:
                return "composite"
        
        return "probably prime"

if __name__ == "__main__":
    tester = MillerRabin()
    while True:
        n, k = map(int, input("Enter n and k: ").split())
        result = tester.is_prime(n, k)
        print(result)
