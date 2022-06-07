" ------------------------- BASICS ------------------------- "
alert("Hello World!"); // printing function in browser
clear(); // clear console
console.log("I'm in console"); // print in the console
prompt("Enter your age: "); // asking for input
var deposit = prompt("how much"); // input stored in deposit

var myVar = "can be used anywere";
let newVar = "used within the scope";
const pi = 3.14; // value can't be changed

myVar = 1; // you can reassign without var

/*
multi-line comment
*/

var bankAccount = 100;

" ------------------------ DataTypes ----------------------- "
Number 1 2 3; // int or float are both Numbers
String "mystring"
Boolean true false
undefined // created but never defined with a value
null // never existed

typeof myVar == "undefined" // checking types

" ----------------------- OPERATIONS ----------------------- "
+ - * / ** %(remainder) < > >= <= == !=
&& || !(not)
num += 1 	num++	num -= 1 	num--	a*=5	a/=12

"2" == 2   // returns true
"2" === 2  // returns false
5 !== "5"  // returns true
5 != "5"   // returns false

true == 1 // true
true === 1 // false
false == 0 // true
false ===0 // false

null == undefined  // true
null === undefined // flase
NaN == NaN // false

" -------------------------- FOR IF ------------------------ "
if (condition){
	// code here
}else if(condition two){
	// more code
}else{
	// more code
}

switch(val){
	case 1: // if val === 1
		answer = "alpha";
		break; // avoids running all states
	case 2:  // both cases have the same code
	case 3:
		answer = "beta"
		break;
	default:
		answers = "alphabet"
}

while(condition){
	// code here
	break
}

do{
	// do this at least once
	i++;
} while (i<5) // before checking the condition

for(execute before,break condition, increment){
	// code here
}

for(var i = 0, i < 5, i++){
	// code here
}

" ------------------------- FUNCTION ----------------------- "
var myGlobal // has global scope even inside functions
function myFunction(_par1="default_value", _par2){
	// code here
	varInsideFunction = "global" // global variable
	var localVar = "local" // local variable

	return localVar
}



