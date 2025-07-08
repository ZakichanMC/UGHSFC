randomize();
show_debug_message(random_get_seed());
startingDeck = [];

playerDeck = [];
playerHand = [];

enemyDeck = [];
enemyHand = [];

draw_set_colour(c_red);
draw_set_font(font);

turn = "player"; //whose turn it is

//create original deck
for (var i = 0; i < 14; i++) {
	if i != 5 and i != 8 {
		array_push(startingDeck,string_format(i+1,2,0)+"0"); //Circle
		array_push(startingDeck,string_format(i+1,2,0)+"1"); //Square
		array_push(startingDeck,string_format(i+1,2,0)+"2"); //Triangle
		array_push(startingDeck,string_format(i+1,2,0)+"3"); //Cross

		
		if i < 8 {
			array_push(startingDeck,string_format(i+1,2,0)+"4"); //Star
		}
	}
}

playerDeck = array_shuffle(startingDeck); //length is 55
enemyDeck = array_shuffle(startingDeck);


//draw 5 to player and enemy
for (var i = 0; i < 5; i++) {
	CreateCard(playerDeck,playerHand,"player");
	CreateCard(enemyDeck,enemyHand,"enemy");
}


//start a default card in the center
var _centerCard = instance_create_layer(100,100,"Instances",oCenterCard);
_centerCard.value = playerDeck[irandom(array_length(playerDeck)-1)];
_centerCard.image_index = string_char_at(_centerCard.value,3);

show_debug_message(global.cardData[$ "5 of Squares"]);