global.ShapeNames = {
	circle: "Circle",
	square: "Square",
	triangle: "Triangle",
	cross: "Cross",
	star: "Star"
}

global.ShapeValues = {
	circle: 0,
	square: 1,
	triangle: 2,
	cross: 3,
	star: 4
}

global.cardData = {};
global.defaultDeck = [];

var _shapeNames = [global.ShapeNames.circle,global.ShapeNames.square,global.ShapeNames.triangle,global.ShapeNames.cross,global.ShapeNames.star];
var _shapeValues = [global.ShapeValues.circle,global.ShapeValues.square,global.ShapeValues.triangle,global.ShapeValues.cross,global.ShapeValues.star];

for (var i = 0; i < 14; i++) { //for each number
	for (var j = 0; j < array_length(_shapeNames); j++) {
		if (i != 5 and i != 8 and j != 4) or (i != 5 and i < 8 and j == 4) { //first 4 shapes go up to 14, stars go to 8
			//name of the card
			var _id = string(i+1) + " of " + _shapeNames[j] + "s";
			
			//actual card data
			var _card = {
				description: "The " + string(i+1) + " of " + _shapeNames[j] + "s",
				shape: _shapeValues[j],
				number: i+1,
				playedUnder: NORMAL, //what can be played on this card (same shape/number or shapeless/numberless card (shape/number = NONE))
				effect: noone //default, can change later
			}
			
			global.cardData[$ _id] = _card;
			array_push(global.defaultDeck,_card);
		}
		
	}
}

function HoldOnEffect() {
	turn = "player";
	oGame.alarm[0] = -1;
	return false; //returns whether to swap or not
}

//Hold on
global.cardData[$ "Hold On"] = {
	description: "Play any card on this card",
	shape: 5, //change later, for now this is technically "none"
	number: 1,
	playedUnder: ANY,
	effect: HoldOnEffect
}

