"------------------------ARRAY-------------------------"
// IMPORTANT: Arrays are not resizable
 // Accesing a value
String[] cars = {"Camaro", "Corvette", "Tesla"};
cars[0]

// ini a value
String[] cars = new String[3];
car[0] = "Camaro";
car[1] = "Corvette";
car[2] = "Tesla";

// print an array
for(int i=0; i<cars.length; i++){
    System.out.println(cars[i]);
}

// you can create an array of any object you create, for ex.
Food[] refrigerator = new Food[3]


"------------------------2D ARRAY-------------------------"
String[][] cars = new String[2][2];
cars[0][0] = "Camaro";

//you can also create it this way

String[][] cars = {
    {"Camaro", "Corvette", "Silverado"},
    {"Mustang", "Ranger", "F-150"}
}

for(int j=0; j<cars[i].lenght; j++){
    System.out.print(cars[i][j]+"");
}


"---------------------STRING SLICING----------------------"
name.equals("anotherName");  //string comparison
char result = myText.charAt(0); // Get char from string
int result = myText.indexOf("B");  // position of B in text
boolean result = name.isEmpty();  // Empty string
string result = name.toUpperCase();
string result = name.toLowerCase();
String result = name.trim();
String result = name.replace(oldChar, newChar)
    

"------------------------ARRAY_LIST-------------------------"
// resizable array
// elements can be added and removed after compilation phase
// store reference data types
    
ArrayList<String> food = new ArrayList<String>();
food.add("pizza");
food.add("hambuger");
food.add("hotdog");

// looping arraylist
for(int i=0; i<food.size(); i++){
    System.out.println(food.get(i))
}

food.set(0, "sushi") // set value
food.remove(2);  // remove
food.clear(); // clear all


"------------------------2D ARRAY_LIST-------------------------"
// 2D ArrayList = a dynamic list of lists
// You can change the size of these lists during runtime
import java.util.*;
public class Main {

    public static void main(String[] args) {

        ArrayList<ArrayList<String>> groceryList = new ArrayList();

        ArrayList<String> bakeryList = new ArrayList();
        bakeryList.add("pasta");
        bakeryList.add("garlic bread");
        bakeryList.add("donuts");

        ArrayList<String> produceList = new ArrayList();
        produceList.add("tomatoes");
        produceList.add("zucchini");
        produceList.add("peppers");

        ArrayList<String> drinksList = new ArrayList();
        drinksList.add("soda");
        drinksList.add("coffee");

        groceryList.add(bakeryList);
        groceryList.add(produceList);
        groceryList.add(drinksList);

        // get elements
        System.out.println(groceryList);  // all
        groceryList.get(0).get(0) // first element, first list

    }
}