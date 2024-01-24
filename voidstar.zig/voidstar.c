#include <stdio.h>
#include <stdlib.h>

char* name_info;

void* set(const char* name) {
    name_info = name;
    return (void*)name_info;
}

struct names_info_t {
    const char** names;
    int howmany;
} names_info;

void* set_all(const char** names, int howmany) {
    names_info.names = names;
    names_info.howmany = howmany;
    return (void*)&names_info;
}

void hello(void* h) {
    printf("%s\n", (char*)h);
}

void hello_all(void* h) {
    struct names_info_t* ni = (struct names_info_t*)h;
    for (int i = 0; i < ni->howmany; i++) {
        printf("%s\n", ni->names[i]);
    }
}
