//actions if a card is a player's
if owner == "player" { 
	//if card clicked, drag it
	if checkCardClicked(oCard,"press") == id {
		dragged = true;
		relX = x - mouse_x;
		relY = y - mouse_y;
	}
	if dragged {
		x = mouse_x + relX;
		y = mouse_y + relY;
		
		//if card is released, selected flag is true
		if checkCardClicked(oCard,"release") == id {
			dragged = false;
			if (selected) selected = false;
			else if (!selected) selected = true;
		}
	}
	
	if (selected and not dragged) {
		y = origY - 10;
	}
	else if !selected and !dragged {
		y = origY;
	}
}
