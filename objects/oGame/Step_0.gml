//add card to hand when draw button is clicked
if checkObjectClicked(oDrawButton) and turn == "player" {
	var _card = instance_create_layer(40,200,"Instances",oCard);
	_card.value = Draw(playerDeck,playerHand,_card);
	_card.owner = "player";
	_card.x = 40+40*array_length(playerHand);
	
	SwapTurn();
}

//change center card when play button is clicked
if checkObjectClicked(oPlayButton) and turn == "player" {
	//take all the selected cards and put their indexes in a list, adjusting for how many have already been selected
	var _selectedList = [];
	for (var i = 0; i < array_length(playerHand); i++) {
		if playerHand[i].selected {
			array_push(_selectedList,i-array_length(_selectedList));
			}
		}
		
	//go through selectedList and return false if the whole chain doesn't work
	var _viable = true;
	

	//check cards against each other
	for (var k = 0; k < array_length(_selectedList); k++) {
		if k == 0 { //for the first card card, check against centercard
			if !CheckCardPlayable(playerHand,oCenterCard,_selectedList,k) {
				_viable = false;
				break;
			}
		}
		else { //for the rest of the cards, check against the previous card
			if !CheckCardPlayable(playerHand,playerHand[_selectedList[k-1]],_selectedList,k) {
				_viable = false;
				break;
			}
		}
	}
		
	
	//go through playerHand and delete the values if viable
	if _viable {
		for (var j = 0; j < array_length(_selectedList); j++) {
			//if shape or number match
			if CheckCardPlayable(playerHand,oCenterCard,_selectedList,j) {
				oCenterCard.value = playerHand[_selectedList[j]].value; //change the center card
				instance_destroy(playerHand[_selectedList[j]]); //destroy card
				array_delete(playerHand,_selectedList[j],1); //remove from list
			}
			else break; //if there's anything that doesn't work, stop play
		}
	
		SwapTurn();
	}
}

//make sure cards are always aligned properly
for (var i = 0; i < array_length(playerHand); i++) {
	playerHand[i].x = 40+40*i;
}