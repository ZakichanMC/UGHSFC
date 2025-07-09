randomize();
show_debug_message(random_get_seed());

playerDeck = [];
playerHand = [];

enemyDeck = [];
enemyHand = [];

draw_set_colour(c_red);
draw_set_font(font);

turn = "player"; //whose turn it is

//create original deck
playerDeck = array_shuffle(global.defaultDeck); //length is 55
enemyDeck = array_shuffle(global.defaultDeck);


//draw 5 to player and enemy
for (var i = 0; i < 5; i++) {
	CreateCard(playerDeck,playerHand,"player");
	CreateCard(enemyDeck,enemyHand,"enemy");
}

//add hold on to playerHand (for testing)
var _holdon = instance_create_layer(9999,200,"Instances",oCard);
_holdon.value = global.cardData[$ "Hold On"];
show_debug_message(_holdon.value.playedUnder);
_holdon.image_index = _holdon.value.shape;
_holdon.owner = "player";
array_push(playerHand,_holdon);

//start a default card in the center
var _centerCard = instance_create_layer(100,100,"Instances",oCenterCard);
_centerCard.value = playerDeck[irandom(array_length(playerDeck)-1)];
_centerCard.image_index = _centerCard.value.shape;
