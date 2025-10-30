#include <stdio.h>

extern unsigned long long fact(unsigned long long n);

int main(void) {
    unsigned long long n = 10;
    unsigned long long f = fact(n);
    printf("%llu! = %llu\n", n, f);

    if (n > 20) {
        printf("Warning: result likely overflowed 64-bit for n > 20.\n");
    }
    return 0;
}