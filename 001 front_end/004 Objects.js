" ------------------------- BASICS ----------------------- "
// objects are like python dictionaries
var ourDog = {
	"name": "Camper",
	"legs": 4,
	"tails": 1,
	"friends": "everyone",
	"likes dislikes": []
};

name = ourDog.name;
val = ourDog["likes dislikes"];

key = "name";
name = ourDog[key];

// changing property
ourDog.name = "doggy";

// add property to object
ourDog.bark = "bow-wow"

// delete property 
delete myDog.tails

// check if objetc has property
ourDog.hasOwnProperty("tails")

//nested objects
var myStorage = {
	"car":{
		"inside":{
			"passengers" = 2
		}
	}
};

val = myStoreage.car.inside.passengers;

// functions inside objects
var carInfo = {
	make: "Toyota",
	year: 1990,
	model: "Camry"
	carAlert: function(){
		alert("A have a "+ this.make + " " + this.model);
	}
};
