#include "ptr.h"

int main() {
    char* str = "world";
    hello((uint8_t*)str, 5);

    char* msgs[] = {"hello", "world"};
    hello_all((const uint8_t**)msgs, 2);
    return 0;
}
