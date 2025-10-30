#include <stdio.h>
#include <stdlib.h>

// Function to compute factorial iteratively
unsigned long long factorial(unsigned int n) {
    if (n == 0) return 1ULL;
    unsigned long long result = 1ULL;
    for (unsigned int i = 1; i <= n; ++i) {
        result *= (unsigned long long)i;
    }
    return result;
}

// Main function to read input and display factorial
int main(void) {
    unsigned int n;
    printf("Enter a non-negative integer: ");
    if (scanf("%u", &n) != 1) {
        fprintf(stderr, "Invalid input\n");
        return 1;
    }
    unsigned long long f = factorial(n);
    printf("%u! = %llu\n", n, f);
    if (n > 20) {
        printf("Warning: result may overflow 64-bit integer for n > 20.\n");
    }
    return 0;
}