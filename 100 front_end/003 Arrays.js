" ------------------------- BASICS ------------------------- "
var myArray = ["John", 23] // simple array

// nested array, multidimensional arrays
var bigArray = [["the universe", 42], ["everything"], 101010];

" ---------------------- EXTRACT MODIFY -------------------- "
// array starts at 0
myArray[0]
myArray[1] = 45
myArray[1][5]

myArray.push("newValue") // add element at the end
last = myArray.pop() // extracts element at the end
first = myArray.shift() // extracts first element

myArray.shift() // removes the first element
myArray.unshift() // adds element at the start

myArray.foreach(alert); //executes alert() for every element of myArray