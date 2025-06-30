//add card to hand when draw button is clicked
if checkObjectClicked(oDrawButton) {
	var _card = instance_create_layer(40,200,"Instances",oCard);
	_card.value = Draw(playerDeck,playerHand,_card);
	_card.owner = "player";
	_card.x = 40+40*array_length(playerHand);
}

//change center card when play button is clicked
if checkObjectClicked(oPlayButton) {
	//take all the selected cards and put their indexes in a list, adjusting for how many have already been selected
	var _selectedList = [];
	for (var i = 0; i < array_length(playerHand); i++) {
		if playerHand[i].selected {
			array_push(_selectedList,i-array_length(_selectedList));
			}
		}
	//go through playerHand and delete the values
	for (var j = 0; j < array_length(_selectedList); j++) {
		//if shape or number match
		if string_char_at(oCenterCard.value,3) == string_char_at(playerHand[_selectedList[j]].value,3) or (string_char_at(oCenterCard.value,1) == string_char_at(playerHand[_selectedList[j]].value,1) and string_char_at(oCenterCard.value,2) == string_char_at(playerHand[_selectedList[j]].value,2)) {
			oCenterCard.value = playerHand[_selectedList[j]].value; //change the center card
			instance_destroy(playerHand[_selectedList[j]]); //destroy card
			array_delete(playerHand,_selectedList[j],1); //remove from list
		}
	}
			
}

//make sure cards are always aligned properly
for (var i = 0; i < array_length(playerHand); i++) {
	playerHand[i].x = 40+40*i;
}