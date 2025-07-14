//randomize();
random_set_seed(3862881481)
show_debug_message(random_get_seed());

playerDeck = [];
playerHand = [];


enemyDeck = [];
enemyHand = [];


turn = "player"; //whose turn it is

//create original deck
playerDeck = array_shuffle(global.defaultDeck); //length is 55
enemyDeck = array_shuffle(global.defaultDeck);


//draw 5 to player and enemy
for (var i = 0; i < 5; i++) {
	CreateCard(playerDeck,playerHand,"player");
	CreateCard(enemyDeck,enemyHand,"enemy");
}


//start a default card in the center
var _centerCard = instance_create_layer(100,100,"Instances",oCenterCard);
_centerCard.value = playerDeck[irandom(array_length(playerDeck)-1)];
_centerCard.image_index = _centerCard.value.shape;


//starting player inventory for now; 3 bps 3 codes
playerBlueprints = [];
playerCodes = [];
for (var i = 0; i < 3; i++) {
	var _bp = instance_create_layer(9999,200,"Instances",oBlueprint);
	_bp.value = global.blueprints[$ "ShapeShifter"];
	array_push(playerBlueprints,_bp);
	var _code = instance_create_layer(9999,264,"Instances",oCode);
	
	var keys = struct_get_names(global.codes);
	_code.value = global.codes[$ keys[irandom(array_length(keys) - 1)]];
	array_push(playerCodes,_code);
}