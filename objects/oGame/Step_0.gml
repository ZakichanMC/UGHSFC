//add card to hand when draw button is clicked
if checkObjectClicked(oDrawButton) and turn == "player" {
	CreateCard();
	
	//SwapTurn();
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
				oCenterCard.image_index = string_char_at(oCenterCard.value,3);
				instance_destroy(playerHand[_selectedList[j]]); //destroy card
				array_delete(playerHand,_selectedList[j],1); //remove from list
			}
			else break; //if there's anything that doesn't work, stop play
		}
	
		//SwapTurn();
	}
}

//a function to sort cards by their x positions
array_sort(playerHand,function(a,b) {
	return a.x - b.x;
});

//make sure cards are always aligned properly
for (var i = 0; i < array_length(playerHand); i++) {
	//if the card is in hand, lock it in place
	if !playerHand[i].dragged {
		//to avoid division by 0
		if array_length(playerHand) > 1 {
			playerHand[i].x = 32 + i * (192 - 32) / (array_length(playerHand) - 1);
		}
		else playerHand[i].x = 32;
	}
	playerHand[i].depth = -playerHand[i].x;
}