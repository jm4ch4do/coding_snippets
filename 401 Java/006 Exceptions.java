"------------------------EXCEPTIONS-------------------------"
import java.util.Scanner;

public class Main {
    
    public static void main(String[] args){

        try{
            Scanner scanner = new Scanner(System.in);

            System.out.println("Enter a whole number to divide: ");
            int x = scanner.nextInt();
            
            System.out.println("Enter a whole number to divide by: ");
            int y = scanner.nextInt();
            
            int z = x/y;
            
            System.out.println("result: ");
            System.out.println("result: " + z);
            System.out.println("result: " + z);
            
        }
        catch(ArithmeticException e){
            System.out.println("You can't divide by zero");
        }
        catch(InputMismatchException e){
            System.out.println("Please enter a number");
        }
        catch(Exception e){
            System.out.println("Something went wrong");
        }
        finally{
            System.out.println("This will always print");
            
            // you usually close the file here or in this case the scanner
            scanner.close();
        }
    }
    
    
}