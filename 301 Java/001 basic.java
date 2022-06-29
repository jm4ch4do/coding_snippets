"------------------------BASIC-------------------------"
// Top 3 languages
// Flexible

    
"------------------------COMPILING-------------------------"
// Compiling transform source code into machine code
// If you compile on PC the code will only work on PC
// Java's solution for this is an intermediate step called byte code
// That has the .class extension and is cross-platform
// JVM handles the transformation of the byte code to machine code
JDK - Java Development Kit
    JRE - Java Runtime Env
    JVM - Java Virtual Machine
    
    
"------------------------SIMPLE APP-------------------------"
// You always need a Main class and a main Method within
public class Main {
    public static void main(String[] args) {
        System.out.println("Hello world!\\");
        System.out.print("\tHello \"world\"!\n");
        
        // Single line notes
        
        /* 
            Multi-line Comments
        */
    }
}


"------------------------GET USER INPUT-------------------------"
import java.util.Scanner;

public class Main{
    
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("What is your name? ");
        String name = scanner.nextLine();
        
        System.out.println("Hello "+name);
        
    }
}
    
    
    
    
    
    
    
