//make sure players never run out of cards
if array_length(playerDeck) == 0 playerDeck = array_shuffle(startingDeck);
if array_length(enemyDeck) == 0 enemyDeck = array_shuffle(startingDeck);

//add card to hand when draw button is clicked
if checkObjectClicked(oDrawButton) and turn == "player" {
	CreateCard(playerDeck,playerHand,"player");
	SwapTurn();
}

//change center card when play button is clicked
if checkObjectClicked(oPlayButton) and turn == "player" {
	//take all the selected cards and put their indexes in a list, adjusting for how many have already been selected
	var _checkingList = []; //checking for viability
	var _selectedList = []; //checking for deletion
	for (var i = 0; i < array_length(playerHand); i++) {
		if playerHand[i].selected {
			array_push(_checkingList,i);
			array_push(_selectedList,i-array_length(_selectedList));
			}
		}
	//go through selectedList and return false if the whole chain doesn't work
	var _viable = true;
	if array_length(_selectedList) == 0 _viable = false; //don't play if 0 cards

	//check cards against each other
	for (var k = 0; k < array_length(_checkingList); k++) {
		if k == 0 { //for the first card card, check against centercard
			if !CheckCardPlayable(playerHand,oCenterCard,_checkingList,k) {
				_viable = false;
				break;
			}
		}
		else { //for the rest of the cards, check against the previous card
			if !CheckCardPlayable(playerHand,playerHand[_checkingList[k-1]],_checkingList,k) {
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
	
		SwapTurn();
	}
}

if turn == "enemy" and alarm[0] < 0 {
	alarm[0] = fps;
}

//a function to sort cards by their x positions
array_sort(playerHand,function(a,b) {
	return a.x - b.x;
});


//make sure cards are always aligned properly
AlignCards(playerHand);
AlignCards(enemyHand);