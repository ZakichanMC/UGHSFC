//actions if a card is a player's
if owner == "player" { 
	//if card is clicked, selected flag is true
	if checkObjectClicked(id) {
		if (selected) selected = false;
		else if (!selected) selected = true;
	}
	
	//if card is selected, move it up slightly
	if (selected) y = origY - 10;
	else y = origY;
}
