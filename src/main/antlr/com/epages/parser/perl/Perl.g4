grammar Perl;

@header {
package com.epages.parser.perl;
}



perlpackage : 'package' packagename ';' stmt* '1;' ;

packagename : (ID '::')* ID ;

stmt : COMMENT
     | extendstmt ';'
     | importstmt ';'
     | sub
     | assignment ';'
     | functioncall ';'
     | condition
     ;

expr : INT
     | ID
     | '\'' ID '\''
     | hash
     | varname
     | functioncall
     | expr '->' '{' expr '}'
     | '@_'
     | '(' expr ')'
     | expr operator expr
     ;

operator : '+'
         | '-'
         | '*'
         | '/'
         | '%'
         | '.'
         ;

extendstmt : 'use' 'base' packagename ;

importstmt : 'use' (ID '::')* ID
           | 'use' (ID '::')* ID quotedlist
           ;

quotedlist : 'qw' '(' ID+ ')' ;

sub : 'sub' ID '{' stmt* '}' ;

assignment : 'my' varname '=' expr ;



hash : '{' '}'
     | '{' keyvaluepair (',' keyvaluepair)* ','? '}'
     ;

keyvaluepair : '\'' ID '\'' '=>' expr ;

varname : varname_scalar
        | varname_array
        | varname_hash
        ;

varname_scalar : '$' ID ;
varname_array : '@' ID ;
varname_hash : '%' ID ;

functioncall : functionname
             | functionname '(' ')'
             | functionname '(' expr ( ',' expr )* ')'
             | functionname expr ( ',' expr )*
             ;

functionname : ID
             | builtinfunction
             ;

builtinfunction : 'shift'
                | 'bless'
                | 'defined'
                | 'return'
                ;

condition : 'if' '(' boolexpr ')' stmt
          | 'if' '(' boolexpr ')' '{' stmt* '}'
          | 'if' '(' boolexpr ')' '{' stmt* '}' 'else' '{' stmt* '}'
          ;

boolexpr : expr
         | compareexpr
         | '!' boolexpr
         | boolexpr '&&' boolexpr
         | boolexpr '||' boolexpr
         | '(' boolexpr ')'
         ;

compareexpr : expr '<' expr
            | expr '>' expr
            | expr '==' expr
            | expr 'eq' expr
            | expr '!=' expr
            ;



COMMENT : '#' [a-zA-Z0-9_-\!?${}=,;. ]* '\n' ;

INT : '-'? [0-9]+ ;

ID : [a-zA-Z][a-zA-Z0-9_]* ;

WHITESPACE : [ \r\t\n] -> skip ;
