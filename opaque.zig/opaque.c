#include "opaque.h"

#include <stdio.h>
#include <stdlib.h>

typedef struct Op {
    char *name;
    char **names;
    int howmany;
} *Op_t;

Op_t new_op(const char *name) {
    Op_t op = malloc(sizeof(struct Op));
    if (op != NULL) {
        op->name = name;
    }
    return op;
}

Op_t new_op_all(const char **names, int howmany) {
    Op_t op = malloc(sizeof(struct Op));
    if (op != NULL) {
        op->names = names;
        op->howmany = howmany;
    }
    return op;
}

void free_op(Op_t op) {
    free(op);
}

void hello(Op_t op) {
    printf("%s\n", op->name);
}

void hello_all(Op_t op) {
    for (int i = 0; i < op->howmany; i++) {
        printf("%s\n", op->names[i]);
    }
}
