grammar Perl;

@header {
package com.epages.parser.perl;
}



perlpackage : 'package' (ID '::')* ID ';' stmts '1;';

stmts : (importstmt | extendstmt | sub)*;

importstmt : 'use' (ID '::')* ID ';'
           | 'use' (ID '::')* ID 'qw' '(' ID+ ')' ';'
           ;

extendstmt : 'use' 'base' (ID '::')* ID ';';

sub : 'sub' '{' cmds '}';

cmds : (assignment | functioncall | returnstmt)*;

assignment : 'my' varname '=' value ';';

returnstmt : 'return' value;

value : hash
      | varname
      | functioncall
      | hashrefvar
      | '@_'
      ;

hash : '{' hashkeyvalue (',' hashkeyvalue)* ','? '}';

hashkeyvalue : '\'' ID '\'' '=>' value;

hashrefvar : scalarvarname '->' '{' value '}';

values : value (',' value)*;

varname : scalarvarname
        | '@' ID
        | '%' ID
        ;

scalarvarname : '$' ID;

functioncall : functionname
             | functionname '(' values ')'
             | functionname values
             ;

functionname : ID
             | 'shift'
             | 'bless'
             | 'defined'
             ;

COMMENT : '#' [a-zA-Z0-9_-\!?${}=,;. ]* '\n';
ID : [a-zA-Z][a-zA-Z0-9_]*;
WHITESPACE : [ \r\n] -> skip;