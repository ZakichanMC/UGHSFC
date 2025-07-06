randomize();

playerDeck = [];
playerHand = [];

draw_set_colour(c_red);
draw_set_font(font);

turn = "player"; //whose turn it is

//create starting playerDeck
for (var i = 1; i < 15; i++) {
	if i != 6 and i != 9 {
		array_push(playerDeck,string_format(i,2,0)+"1"); //R
		array_push(playerDeck,string_format(i,2,0)+"2"); //G
		array_push(playerDeck,string_format(i,2,0)+"3"); //B
		array_push(playerDeck,string_format(i,2,0)+"4"); //P
		if i <= 8 {
			array_push(playerDeck,string_format(i,2,0)+"5"); //Y
		}
	}
}

playerDeck = array_shuffle(playerDeck);
//show_debug_message(playerDeck); //length is 55

//start a default card in the center
var _centerCard = instance_create_layer(100,100,"Instances",oCenterCard);
_centerCard.value = playerDeck[irandom(array_length(playerDeck)-1)];
_centerCard.image_index = string_char_at(_centerCard.value,3);

//draw 5 to player hand
for (var i = 0; i < 5; i++) {
	CreateCard();
}
