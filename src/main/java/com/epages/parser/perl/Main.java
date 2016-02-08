package com.epages.parser.perl;

import java.io.IOException;
import java.io.InputStream;

import org.antlr.v4.runtime.ANTLRInputStream;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;

import com.epages.parser.perl.PerlParser.PerlpackageContext;

public class Main {

    public static void main(String[] args) throws IOException {

        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        InputStream inputStream = classLoader.getResourceAsStream("perl/Package.perl");

        CharStream input = new ANTLRInputStream(inputStream);
        PerlLexer lexer = new PerlLexer(input);

        Token token;
        do {
            token = lexer.nextToken();
            System.out.println(token + " --- type: " + token.getType());
        }  while (token.getType() != Token.EOF);

        CommonTokenStream tokens = new CommonTokenStream(lexer);
        PerlParser parser = new PerlParser(tokens);

        //PerlpackageContext ctx = parser.perlpackage();
    }

}