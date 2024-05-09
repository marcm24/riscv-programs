#include <stdio.h>

// reference c program for greet algorithm

unsigned int greet(unsigned int n) {
    // Base case: If there's only one person or no one, no greetings occur.
    if (n <= 1) {
        return 0;
    } else {
        // Each person greets (n - 1) other people, and we recursively calculate the greetings for (n - 1) people.
        return (n - 1) + greet(n - 1);
    }
}

int main() {
    
}