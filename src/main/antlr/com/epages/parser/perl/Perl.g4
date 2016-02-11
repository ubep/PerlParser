grammar Perl;

@header {
package com.epages.parser.perl;
}



perlpackage : 'package' packagename ';' stmt* '1;';

packagename : (ID '::')* ID;

stmt : COMMENT
     | extendstmt ';'
     | importstmt ';'
     | sub
     | assignment ';'
     | functioncall ';'
     ;

expr : hash
     | varname
     | ID
     | '\'' ID '\''
     | functioncall
     | expr '->' '{' expr '}'
     | '@_'
     ;

extendstmt : 'use' 'base' packagename;

importstmt : 'use' (ID '::')* ID
           | 'use' (ID '::')* ID quotedlist
           ;

quotedlist : 'qw' '(' ID+ ')';

sub : 'sub' ID '{' stmt* '}';

assignment : 'my' varname '=' expr;



hash : '{' '}'
     | '{' keyvaluepair (',' keyvaluepair)* ','? '}'
     ;

keyvaluepair : '\'' ID '\'' '=>' expr;

values : ;

varname : varname_scalar
        | varname_array
        | varname_hash
        ;

varname_scalar : '$' ID;
varname_array : '@' ID;
varname_hash : '%' ID;

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


COMMENT : '#' [a-zA-Z0-9_-\!?${}=,;. ]* '\n';
ID : [a-zA-Z][a-zA-Z0-9_]*;
WHITESPACE : [ \r\n] -> skip;
