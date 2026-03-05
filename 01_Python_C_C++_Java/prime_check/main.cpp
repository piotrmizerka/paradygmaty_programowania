#include <iostream>

using namespace std;

bool isPrime(long long n) {
    if (n <= 1)
        return false;

    if (n == 2)
        return true;

    if (n % 2 == 0)
        return false;

    for (long long i = 3; i * i <= n; i += 2) {
        if (n % i == 0)
            return false;
    }

    return true;
}

int main() {
    long long number;

    cout << "Enter an integer: ";
    cin >> number;

    if (isPrime(number))
        cout << number << " is a prime number." << endl;
    else
        cout << number << " is not a prime number." << endl;

    return 0;
}
