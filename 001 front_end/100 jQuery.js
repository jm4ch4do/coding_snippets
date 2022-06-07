" ------------------------- BASICS ------------------------- "
// include jQuery just before the </body> tag
<!-- Load the CDN first -->
<script src="//code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<!-- If CDN fails to load, serve up the local version -->
<script>window.jQuery || document.write('<script src="js/jquery-3.3.1.slim.min.js")<\/script>';</script>

<!-- Load your own scripts -->
<script src="js/script.js"></script>

// ---
// jQuery Scripts should start like this which is a function that only runs after the page if fully loaded
$(function(){
	// code here
})

// this is the javascript vanilla alternative
$(document).ready(function(){ /*code*/ }) 

" ----------------------- SELECTORS ------------------------ "
// basic syntax
$(selector).action();

var divs = $('div'); // tag selector (gets all div tags)
var mydivs = #('.mydivs'); // class selector (every element with class mydivs)
var mydiv = #('#mydiv'); // id selector

$('h1, h2, h3')    // selecting multiple elements
$('div#container') // selecting tag with id
$('p.lead')        // selecting tag with class
$('div em')		   // em tag within div tag (descendents)
$('div > p')       // p tag child of div (only if its first descentent i.e. child)
 
$('li:first') // first list
$('li:last') // last 
$('li:event') // even (2, 4, 6)
$('li:odd') // odd (1, 3, 5)

$(':header') // all headers (h1, h2, ... , h6)
$(':contains("mystring")') // all elements containing 'mystring'
$('p:contains("mystring")') // all parragraphs containing 'mystring'

$(this).attr("class"); // gets the class of the selected item
// in www.w3schools there is a live example with many more selectors

" ---------------------- CSS EDITION ----------------------- "
// css edition
var x = $('h1');
x.css('color','red');

// css edition of multiple properties
var newCSS = { // creating object(dictionary)
	'color':'white',
	'background':'blue',
	'border':'red'
};
x.css(newCss);

// or just like this
$('h1').css({
	'color':'white',
	'background':'blue',
	'border':'red'
});

" ----------------------- MODIFYING ------------------------ "
// get several tags and changing just one
var listItems = #('li');
listItems.css('color','blue'); // all list to blue
listItems.eq(0).css('color','orange'); // the first list to orange
listItems.eq(-1).css('color','orange'); // last list to orange

// changing text
$('h1').text("new text");
$('h2').html("<em>new html</em>");

//modifying atributtes
$('input').eq(1).attr('type','checkbox');

//modifying values
$('input').eq(0).val('new value!');

//adding and removing classes
$('h1').addClass('turnRed');
$('h1').removeClass('turnRed');
$('h1').toggleClass('turnBlue'); // gets (first time is called) and removes(second time) turnBlue

" ------------------------- EVENTS ------------------------- "
// mouse click
$('h1').click(function(){
	console.log('you made click');
	$(this).text('clicked'); // use this to refer to jQuery selection	
})

// keypress event
$('input').eq(0).keypress(function(){
	$('h3').togglesClass('turnBlue');
})

// using the 'on' syntax
$('h1').on('dblclick', function(){
	$(this).toggleClass('turnBlue');
})

// execute action on key 'enter'
$('input').eq(0).keypress(function(event){
	if(event.which === 13){
		$('h3').toggleClass('turnBlue');
	}
})

// execute a functions when hover in and another when hover out
$('box').hover(function(){
	$(this).text('you hovered in!');
}, function(){
	$(this).text('you hovered out!');
})

// other events
$('input').blur();    // when element losses focus
$('input').keydown(); // when key is pressed down

" --------------------- ADVANCED TRICKS -------------------- "
// CHAINING
// this is the same
$('#box1').fadeIn();
$('#box1').delay(2000);
$('#box1').css('background','red');
// than this
$('#box1').fadeIn().delay(2000).css('background','red');

" ------------------------- EFFECTS ------------------------ "
// turns to invisible within 3000 ms
$('input').eq(1).on('click', function(){
	$('.container').fadeOut(3000);
})

// more animations
$('#myId').hide(); 		// hide element
$('#myId').show(); 		// show element

$('#myId').fadeOut(); 	// hide slowly
$('#myId').fadeIn();  	// show slowly

$('#myId').fadeTo(2000, 0.5, function(){ // in 2000 ms fade to 50% opacity
	// leave it empty if no action is to be executed
});  

$('#myId').slideUp(); 	// hide moving up
$('#myId').slideDown(); // show moving down
$('#myId').slideToggle(); // switches between slideDown and slideUp











