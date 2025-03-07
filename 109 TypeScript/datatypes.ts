import { TupleType } from "typescript";

let lname : string = 'John'
let newname = lname.toUpperCase();
console.log(newname)

let empList = ["name1", "name2", "name3"]
let numList : Array<number>;
numList = [1,2,3,4,5]
let results = numList.filter((num)=> num>2)
let num = numList.find((num)=> num === 2)
console.log(results)
console.log(num)

const enum Color {
  Red,
  Green,
  Blue
}

let c: Color = Color.Red
console.log(c)

function swapNumbers(num1:number, num2:number){
  return [num2, num1]  // this is a tuple, not a list
}

let swapNumbs = swapNumbers(10,20)
console.log(swapNumbs[0])
console.log(swapNumbs[1])

let department: any;  // use of any is discouraged
department = "IT"
department = 10;