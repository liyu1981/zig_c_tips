#ifndef __HELLO_H__
#define __HELLO_H__

#include <stddef.h>
#include <stdint.h>


// translate-c provide-begin: /#define\s(?<tk>\S+)\s.+/
#define CONST_A 'a'
#define CONST_ONE 1
// translate-c provide-end: /#define\s(?<tk>\S+)\s.+/

// translate-c provide: RegexMatchResult
typedef struct {
    size_t start;
    size_t len;
} Loc;

// translate-c provide: get_last_error_message
void get_last_error_message(Loc* loc);
// translate-c provide: my_create_a_hello_string
int my_create_a_hello_string(char** buf);

#endif
