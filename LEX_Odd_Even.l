/* C Declarations */ 
%{ 
    #include <stdio.h> 
    #include <stdlib.h> 
    #include <math.h> 
    #define YYSTYPE int 
%} 
 
/* Bison Declarations */ 
%start program  /* Define the start symbol */ 
%token INT FLOAT CHAR ID EVEN ODD  /* Define token types */ 
 
%% 
 
/* Simple Grammar Rules */ 
program: 
       | program declaration   
       ; 
 
/* Declaration Rules */ 
declaration: 
    TYPE ID1 ';' { 
        printf("\nValid Declaration\n"); 
    } 
    ; 
 
TYPE: 
    INT   { printf("\nIt's an integer\n"); } 
    | FLOAT { printf("\nIt's a float\n"); } 
    | CHAR  { printf("\nIt's a character\n"); } 
    ; 
 
ID1: 
    ID1 ',' ID { printf("\nMultiple identifiers\n"); } 
    | ID        { printf("\nSingle identifier\n"); } 
    ; 
 
/* Even-Odd Number Handling */ 
numeric: 
    NUMBER { 
        if ($1 % 2 == 0) { 
            printf("\nEven number detected: %d\n", $1); 
            return EVEN; 
        } else { 
            printf("\nOdd number detected: %d\n", $1); 
            return ODD; 
        } 
    } 
    ; 
 
%% 
 
/* User Subroutines */ 
int main(void) { 
    printf("\nEnter the number: "); 
    yyparse(); 
    return 0; 
} 
int yywrap(void) { 
    return 1; /* End of input */ 
} 
void yyerror(const char *s) { 
    fprintf(stderr, "Error: %s\n", s); 
}
