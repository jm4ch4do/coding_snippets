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

"----------------------FOR EACH-----------------------"
// simpler but less flexible
String[] animals = {"cat", "dog", "rat", "bird"}

for(String i : animals){
    System.out.println(i);
}
    
    