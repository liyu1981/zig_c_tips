#include <stdio.h>

void hello_c(const char* str) {
    printf("%s\n", str);
}

void hello_all_c(const char* msgs[], int howmany) {
    for (int i = 0; i < howmany; i++) {
        printf("%s\n", msgs[i]);
    }
}
