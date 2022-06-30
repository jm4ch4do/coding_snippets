"------------------------OBJECT EXAMPLE-------------------------"
// file Main.java
public class Main{

    public static void main(String[] args){

        Human human = new Human("Rick", 65, 70);
        Human human2 = new Human("Morty'", 16, 50);

        int value = human.age; // accessing property
        human.eat();  // executing method

        System.out.println(human.toString());  // string method
        int friends = Human.totalHumans;  // accessing static variable

        Worker worker = new Worker("Jose", 65, 70, 10); // child class
        System.out.println(worker.age);  // using property from parent class

    }
}


// ----- File Human.java
// Constructor method has the same name of the class
public class Human {

    // static variables are common to all objects
    static int totalHumans = 0;

    // same for static methods
    static void displayHumans(){
        System.out.println("You have "+totalHumans+" humans");
    }

    // global variables visible in every method of the class
    String name;
    String skinColor;
    int age;
    double weight;

    // Constructor
    Human(String name, int age, int weight){
        int localVar = 1;  // local variable to the constructor
        this.name = name;
        this.age = age;
        this.weight = weight;

    }

    // Overloading Constructor
    Human(String name, String skinColor){
        this.name = name;
        this.skinColor = skinColor;
        totalHumans++;
    }

    // ToStringMethod same as __str__ python method
    public String toString(){
        String myString = this.name;
        return "human: "+myString;
    }

    void eat(){
        System.out.println(this.name + " is eating");
    }
}


// ----- File Worker.java
public class Worker extends Human{

    int yearOfExperience;
    Worker(String name, int age, int weight, int yearOfExperience){
        super(name, age, weight);  // calling parent constructor
        this.yearOfExperience = yearOfExperience;
    }
    
    @Override  // this is recommended although it does nothing
    public String toString(){
        String myString = this.name;
        return "constructor: "+myString;
    }
}


"------------------------ABSTRACT CLASS-------------------------"
// Abstract classes cannot be instanciated but they can be extended
// So they are often used as a template for other objects
// Abstract class
abstract class Animal {
  public abstract void animalSound();   // Abstract method (does not have a body)
  // Regular method
  public void sleep() {
    System.out.println("Zzz");
  }
}

// Subclass (inherit from Animal)
class Pig extends Animal {
  public void animalSound() {
    // The body of animalSound() is provided here
    System.out.println("The pig says: wee wee");
  }
}

class Main {
  public static void main(String[] args) {
    Pig myPig = new Pig(); // Create a Pig object
    myPig.animalSound();
    myPig.sleep();
  }
}

"------------------------ACCESS MODIFIERS-------------------------"
MODIFIER        CLASS       PACKAGE     SUBCLASS        WORLD
Public          Y           Y           Y               Y
Protected       Y           Y           Y               N
No Modifier     Y           Y           N               N
Private         Y           N           N               N

public Class myClass{

    String defaultMessage = "Default Message"; // this value is not accessible outside the package
    public String publicMessage = "Public Message"; // this one is accessible from anywhere
    protected String protectedMessage = "Protected Message";  // accessible only the child classes
    private String privateMessage = "Private Message";  // accessible only to current class
}


"------------------------ENCAPSULATION-------------------------"
class Encapsulate {
    // private variables declared these can only be accessed by public methods of class
    private String Name;
    private int age;
 
    public int getAge() { return geekAge; }
 
    public String getName() { return geekName; }
 
    public void setAge(int newAge) { geekAge = newAge; }
 
    public void setName(String newName){ geekName = newName; }


public class Main {
    public static void main(String[] args)
    {
        Encapsulate obj = new Encapsulate();
        
        obj.setName("Harsh");
        obj.setAge(19);
        
        // Displaying values of the variables
        System.out.println("Geek's name: " + obj.getName());
        System.out.println("Geek's age: " + obj.getAge());
        
    }
}






    
