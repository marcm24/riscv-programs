#include <stdio.h>

// reference c program for finding the greatest common denominator

int gcd(unsigned int a, unsigned int b) {
    while (b != 0) {
        unsigned int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

int main() {
    gcd(71, 9); // 1
    gcd(25, 15); // 5
    gcd(64, 96); // 32
}
