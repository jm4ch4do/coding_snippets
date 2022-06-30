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
    
    public String toString(){
        String myString = this.name;
        return "constructor: "+myString;
    }
}