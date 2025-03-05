// An implementation of the pseudocode from: https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int a, d, k, n, s = 0, x, y;

int a_d_mod_n()
{
    int result = 1;

    for(int i=0;i<d;i++)
    {
        result *= a;
        result %= n;
    }

    return result;
}

void miller_rabin()
{
    if(n == 3)
    {
        printf("prime\n");
        goto label;
    }

    d = n-1;
    while(d%2 == 0)
    {
        s++;
        d /= 2;
    }

    srand(time(0));
    for(int i=0;i<k;i++)
    {
        a = 2+rand()%(n-3);
        x = a_d_mod_n();
        for(int j=0;j<s;j++)
        {
            y = (x*x)%n;
            if(y == 1 && x != 1&& x != n-1)
            {
                printf("composite\n");
                goto label;
            }
            x = y;
        }
        if(y != 1)
        {
            printf("composite\n");
            goto label;
        }
    }

    printf("probably prime\n");
    label:
}

int main() {
    printf("Enter n and k: ");

    scanf("%d %d", &n, &k);

    miller_rabin(n, k);

    return 0;
}
