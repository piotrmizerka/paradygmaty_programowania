// An implementation of the pseudocode from: https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

struct Pair
{
    int s;
    int d;
};

struct Pair factor_two_power(int n)
{
    struct Pair result;
    int s = 0;

    while(n%2 == 0)
    {
        s++;
        n /= 2;
    }

    result.s = s;
    result.d = n;

    return result;
}

int power_modulo(int a, int n, int mod)
{
    int result = 1;

    for(int i=0;i<n;i++)
    {
        result *= a;
        result %= mod;
    }

    return result;
}

const char* miller_rabin(int n, int k)
{
    if(n == 3) return "prime";

    int a, d, s, x, y;

    struct Pair two_fact = factor_two_power(n-1);
    s = two_fact.s;
    d = two_fact.d;

    srand(time(0));
    for(int i=0;i<k;i++)
    {
        a = 2+rand()%(n-3);
        x = power_modulo(a, d, n);
        for(int j=0;j<s;j++)
        {
            y = (x*x)%n;
            if(y == 1 && x != 1&& x != n-1)
            {
                return "composite";
            }
            x = y;
        }
        if(y != 1)
        {
            return "composite";
        }
    }

    return "probably prime";
}

int main() {
    printf("Enter n and k: ");

    int n, k;
    scanf("%d %d", &n, &k);

    const char* test_result = miller_rabin(n, k);
    printf("%s\n", test_result);

    return 0;
}
