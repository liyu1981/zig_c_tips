typedef struct Op* Op_t;
Op_t new_op(const char* name);
Op_t new_op_all(const char** names, int len);
void free_op(Op_t op);
void hello(Op_t op);
void hello_all(Op_t op);
