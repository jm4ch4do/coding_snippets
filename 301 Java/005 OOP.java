"------------------------CONSTRUCTOR-------------------------"
// file Main.java
public class Main{

    public static void main(String[] args){

        Human human = new Human("Rick", 65, 70);
        Human human2 = new Human("Morty'", 16, 50);

        int value = human.age; // accessing property
        human.eat();  // executing method

    }
}


// file Human.java
// Constructor method has the same name of the class
public class Human {
    
    String name;
    int age;
    double weight;
    
    Human(String name, int age, double weight){
        this.name = name;
        this.age = age;
        this.weight = weight;
    }
    
    void eatO(){
        System.out.println(this.name + " is eating");
    }
}