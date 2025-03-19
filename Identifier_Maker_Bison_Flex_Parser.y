%{ 
    #include <stdio.h> 
    #include <math.h> 
    #define YYSTYPE int 
%} 
%start program  
%token INT FLOAT CHAR ID  
%% 
program: 
       | program declaration   
       ; 
 
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
    | ID        { printf("\nSingle identifier\n"); };
