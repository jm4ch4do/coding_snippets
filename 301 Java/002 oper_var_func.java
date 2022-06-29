"------------------------DATA TYPES-------------------------"
USED    SIZE        SIZE        PRIM/REF     VALUE  
*       boolean     1 bit       primitive    true or false   
        byte        1 byte      primitive    -128 to 127
        short       2 bytes     primitive    -32 768 to 32,767                 
*       int         4 bytes     primitive    -2 billion to 2 billion
        long        8 bytes     primitive    -9 quintillion to 9 quin.

        float       4 bytes     primitive    fractional number up to 6-7 digits
*       double      8 bytes     primitive    fractional number up to 15 digits

*       char        2 bytes     primitive    single character/letter/ASCII ex. 'f'           
*       String      varies      reference    a sequence of characters ex. "Hello"  
    
// reference data types store an address instead of data
// the can store more than 1 value
// but used more memory and are slower that primitive data types

long x = 123456678990045434L;  // assigning long number always with L at the end
float y = 3.14f;  // f at the end
double y = 3.14;  // this type is more common    
boolean z = false;
    
"------------------------VARIABLES-------------------------"
// dataType variableName
int x;        // declaration
x = 123;      // assignment
int x = 123;  // initialization


"------------------------OPERATORS-------------------------"
"My number is:" + x;  // string concat 
+ - * / %
>= <= && || == 
! // not
count++ count--
Math.min(x, y)  Math.max() Math.abs() Math.sqrt() .ceil() .round() .floor()
    
import java.util.Random;
int x = random.nextInt();
double x = random.nextDouble();
boolean z = random.nextBoolean()

    
"------------------------IF-------------------------"
public class Main {
    
    public static void main(String[] args){
        
    int age = 18;
        
    if(age>=18){
        System.out.println("You are and adult");        
    }
    else if(age>=75){
        System.out.println("Ok Boomer"); 
    }
    else{
        System.out.println("You are not an adult"); 
    }
        
    }
}


"------------------------SWITCH CASE-------------------------"
public class Main {
    
    public static void main(String[] args){
        
    String day = "Friday";
        
    switch(day){
        case "Sunday": System.out.println("It is Sunday!");
        break;
        case "Monday": System.out.println("It is Monday!");
        break;
        case "Friday": System.out.println("It is Monday!");
        break;
        default: System.out.println("That is not a day!")
        
    }
        
    }
}


"------------------------WHILE-------------------------"
// Keep asking for name until user types something
import java.util.Scanner;

public class Main {
    
    public static void main(String[] args){
        
        Scanner scanner = new Scanner(System.in);
        String name = "";
        
        while(name.isBlank()){
            System.out.print("Enter your name: ");
            name = scanner.nextLine();
        }
        
        System.out.println("Hello"+name);
    }
    
}

// do loop (always performs code at least once)
        do{
            System.out.print("Enter your name: ");
            name = scanner.nextLine();
        } while(name.isBlank());
    

"------------------------FOR-------------------------"
for(int i=10; i>=0; i--){    // i-=2 to decrement 2
    System.out.println(i);
}

System.out.println("Happy new year!");
    
    
    
    
    
    
    
    
