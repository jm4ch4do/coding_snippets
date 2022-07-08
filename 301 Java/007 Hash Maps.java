"------------------------HASH MAPS-------------------------"
import java.util.HashMap;
    
public class Maps {
    public static void main(String[] args){
        
        // a map where keys are the ids and values are the numbers
        HashMap<Integer, String> employees = new HashMap<>();
        
        // add a key,value pair
        employees.put(1, "John" );
        employees.put(2, "Carl" );
        employees.put(3, "Jerry" );
        
        // modify
        employees.put(1, "Mike" );  // update or create old value
        employees.replace(4, "Mike" );  // update only if existed
        employees.putIfAbsent(3, "Jerry");  // add if it didn't existed
        
        // remove
        employees.remove(1);  // delete a key, value pair
        
        // operations
        emp1 = employees.get(1);  // get value using key
        isIdIn = employees.containsKey(3);  // check if key exists
        isValueIn = employees.containsValue("Jerry"); // check if value exists
        
    }
}

"------------------------COUNTING HASH MAP-------------------------"
// count characters in a map
HashMap<Character, Integer> charCountMap
        = new HashMap<Character, Integer>();
 
    // Converting given string to char array
    char[] strArray = inputString.toCharArray();
 
    // checking each char of strArray
    for (char c : strArray) {
        if (charCountMap.containsKey(c)) {
            charCountMap.put(c, charCountMap.get(c) + 1);
        }
        else {
            charCountMap.put(c, 1);
    }
}
 
    // Driver Code
    public static void main(String[] args)
    {
        String str = "Ajit";
        characterCount(str);
    }
}


"------------------------ITERATE HASHMAP-------------------------"
Map<String, String> foodTable
    = new HashMap<String, String>();

// Inserting elements to the adobe HashMap
// Elements- Key value pairs using put() method
foodTable.put("A", "Angular");
foodTable.put("J", "Java");
foodTable.put("P", "Python");
foodTable.put("H", "Hibernate");

// Iterating HashMap through for loop
for (Map.Entry<String, String> set :
     foodTable.entrySet()) {

    // Printing all elements of a Map
    System.out.println(set.getKey() + " = " 
                       + set.getValue());
}












