//enemy actions here

var _cardToPlay = false;
for (var i = 0; i < array_length(enemyHand); i++) {
	if string_char_at(oCenterCard.value,3) == string_char_at(enemyHand[i].value,3) or (string_char_at(oCenterCard.value,1) == string_char_at(enemyHand[i].value,1) and string_char_at(oCenterCard.value,2) == string_char_at(enemyHand[i].value,2)) {
		oCenterCard.value = enemyHand[i].value; //change the center card
		oCenterCard.image_index = string_char_at(oCenterCard.value,3);
		instance_destroy(enemyHand[i]); //destroy card
		array_delete(enemyHand,i,1); //remove from list
		_cardToPlay = true;
		break;
	}
}

if _cardToPlay SwapTurn();
else {
	CreateCard(enemyDeck,enemyHand,"enemy");
	SwapTurn();
}
alarm[0] = -1;