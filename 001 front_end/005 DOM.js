" ------------------------- BASICS ----------------------- "
// DOM is an object which is created by the browser having properties for every html tags
console.dir(document) //shows the DOM object

document.URL    // url of the web page
document.body   // complete body of html
document.head   // html header
document.links  // all the links in the page

document.getElementbyId("id_name");   		  // get the with id
document.getElementbyClassName("class_name"); // elements beloging to certain class
document.getElementbyTagName("li");   		  // tags like <h1>
document.querySelector();					  // first object maching the style selector
document.querySelectorAll();				  // all object maching the style selector

document.querySelectorAll("#id_name"); 	   // same as the first
document.querySelectorAll(".class_name");  // same as the second
document.querySelectorAll("li");		   // same as the third

" ------------------------ EXAMPLES ---------------------- "
// change css of h1
var myheader = document.query.Selector("h1");
myheader.style.color = 'red';

// change text of parragraph
var p = document.querySelector('p');
p.textContent = "new text" // for changing text
p.innerHTML = "<strong>new text</strong>"  // for writing html

// multiple selectors and changing attributes
var val = document.querySelector("#my_id "); //  gets plenty of html
var val2 = val.querySelector("a"); // gets <a> inside previous selection
var val3 = val2.getAttribute("href") // get the address inside the <a> tag
val2.setAttribute("href", "http://www.google.com") // changing the link


" ------------------------- EVENTS ----------------------- "
// set event on h1
// some events are (click, mouseover, mouseout, dblclick)
var head = document.querySelector('h1');
head.addEventListener("click", changeColor);
function changeColor(){
	item.style.color = 'red';
}


// change text when hover
var headOne = document.querySelector('#one');
headOne.addEventListener('mouseover', function(){
	headOne.textContent = "Mouse Currently Over";
	headOne.style.color = 'red';
})
headOne.addEventListener("mouseout", function(){
	headOne.textContent = "Original Text";
	headOne.style.color = 'black';
})