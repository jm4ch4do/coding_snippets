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

// Wrapper data types extend the primitive datatypes to be reference
// and have new useful methods

// primitive    wrapper
// boolean      Boolean
// char         Character
// int          Integer
// double       Double
    
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
    
// Final keyword means it can never be changed
final double pi = 3.14159
    
    
"------------------------METHODS-------------------------"
// always need the Main method which serves as EntryPoint
public class Main{
    
    public class void main(String[] args){
        hello("Bro" ,18);
    }
    
    static void hello(String name, int age){
        System.out.println("Hello " +name + "You are "+age);
        return age++
    }
}


"-----METHOD OVERLOADING-----"
// having two methods with the same name but different parameter definition
static int add(int a, int b){
    return a + b;
}

static int add(int a, int b, int c){
    return a + b + c ;
}

    
    
    
    
    
    
