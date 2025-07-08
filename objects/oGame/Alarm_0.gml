//enemy actions here

var _cardToPlay = false;
for (var i = 0; i < array_length(enemyHand); i++) {
	if oCenterCard.value.number == enemyHand[i].value.number or oCenterCard.value.shape == enemyHand[i].value.number {
		oCenterCard.value = enemyHand[i].value; //change the center card
		oCenterCard.image_index = oCenterCard.value.shape;
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