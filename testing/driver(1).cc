#include <iostream>
#include <string>
#include "tokens.h"


extern
int yylex ();


const char * token_names[] = {
  "A", "B", "(AB)+", "A(A|B)+", "(AA|BB)+", "a+b+(ab|ba)", NULL,
};

int main ()
{
  int next;
  while ((next = yylex ()) != T_EOF) {
    printf ("token = %d [%s]\n", next, token_names[next-T_A]);
  }

  return 0;
}
