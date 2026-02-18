import java.math.BigInteger;
import java.util.Random;
import java.util.Scanner;

class Pair {
    int s;
    BigInteger d;

    Pair(int s, BigInteger d) {
        this.s = s;
        this.d = d;
    }
}

class MillerRabin {
    private final Random rand = new Random();

    private Pair factorTwoPower(BigInteger n) {
        int s = 0;
        while (n.mod(BigInteger.TWO).equals(BigInteger.ZERO)) {
            s++;
            n = n.divide(BigInteger.TWO);
        }
        return new Pair(s, n);
    }

    private BigInteger powerModulo(BigInteger a, BigInteger n, BigInteger mod) {
        return a.modPow(n, mod);
    }

    public String isPrime(BigInteger n, int k) {
        if (n.equals(BigInteger.valueOf(3))) return "prime";

        Pair twoFact = factorTwoPower(n.subtract(BigInteger.ONE));
        int s = twoFact.s;
        BigInteger d = twoFact.d;

        for (int i = 0; i < k; i++) {
            BigInteger a = BigInteger.TWO.add(BigInteger.valueOf(rand.nextInt()).mod(n.subtract(BigInteger.valueOf(3))));
            BigInteger x = powerModulo(a, d, n);
            BigInteger y;

            for (int j = 0; j < s; j++) {
                y = x.multiply(x).mod(n);
                if (y.equals(BigInteger.ONE) && !x.equals(BigInteger.ONE) && !x.equals(n.subtract(BigInteger.ONE))) {
                    return "composite";
                }
                x = y;
            }
            if (!x.equals(BigInteger.ONE)) {
                return "composite";
            }
        }
        return "probably prime";
    }
}

public class MillerRabinTest {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        MillerRabin tester = new MillerRabin();

        while (true) {
            System.out.print("Enter n and k: ");
            BigInteger n = scanner.nextBigInteger();
            int k = scanner.nextInt();

            String result = tester.isPrime(n, k);
            System.out.println(result);
        }
    }
}
