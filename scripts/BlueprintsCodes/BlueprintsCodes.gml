//FOR THE LOVE OF GOD REMOVE THIS SECTION LATER
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


global.blueprints = {};
global.codes = {};

function CreateBlueprint(_name,_description,_effect) {
	global.blueprints[$ _name] = {
		description: _description,
		effect: _effect
	}
}

function CreateCode(_name,_value) {
	global.codes[$ _name] = { 
		value: _value
	}
}

//change shape blueprint
function changeShape(_nextCard,_code) {
	if _code != noone {
		_nextCard.value.shape = _code;
	}
}


//create all blueprints and codes
CreateBlueprint("ShapeShifter","Change the shape of the next card played","changeShape")

CreateCode(global.ShapeNames.circle, global.ShapeValues.circle)
CreateCode(global.ShapeNames.square, global.ShapeValues.square)
CreateCode(global.ShapeNames.triangle, global.ShapeValues.triangle)
CreateCode(global.ShapeNames.cross, global.ShapeValues.cross)
CreateCode(global.ShapeNames.star, global.ShapeValues.star)