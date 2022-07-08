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


"------------------------PRINTS-------------------------"
System.out.print("Hello");  // print in the same line
System.out.println("Hello");  // print new line
System.out.printf("format string %d", 123);  // 123 goes to %d

// %b boolean   %c char     %s String   %d int      %f double  


"------------------------GET USER INPUT-------------------------"
import java.util.Scanner;

public class Main{
    
    public static void main(String[] args) {
        
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("What is your name? ");
        String name = scanner.nextLine();
        System.out.println("Hello "+name);
        
        System.out.println("How old are you? ");
        int age= scanner.nextInt();
        System.out.println("You are "+age+" years old");
                
        
    }
}
    

"------------------------BASIC USER INTERFACE-------------------------"
import javax.swing.JOptionPane;

public class Main {
    public static void main(String[] args){
        
        String name = JOptionPane.showInputDialog("Enter your name");
        JOptionPane.showMessageDialog(null, "Hello"+name);
        
        int age = Integer.parseDouble(JOptionPane.showInputDialog("Enter your age"));
        JOptionPane.showMessageDialog(null, "You are "+age+" years old");
        
        double height = Double.parseInt(JOptionPane.showInputDialog("Enter your age"));
        JOptionPane.showMessageDialog(null, "You are "+height+" cm tall")
        
    }
}
    
    
    
    
    
