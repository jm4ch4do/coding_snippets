"use strict";
function add(a, b, c) {
    return c ? a + b + c : a + b; // condition for optional parameter
}
console.log(add(2, 3));
console.log(add(2, 3, 5));
// Rest parameters
function add2(num1, num2, ...num3) {
    return num1 + num2 + num3.reduce((a, b) => a + b, 0);
}
console.log(add2(2, 3, ...[5, 6, 7]));
