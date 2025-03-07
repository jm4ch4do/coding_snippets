function add(a: number, b: number, c?: number): number {
  return c? a + b + c : a + b;  // condition for optional parameter
}

console.log(add(2, 3))
console.log(add(2, 3, 5 ))

// Rest parameters
function add2(num1: number, num2:number, ...num3: number[]): number {
  return num1 + num2 + num3.reduce((a, b) => a + b, 0)
}

console.log(add2(2, 3, ...[5, 6, 7]))