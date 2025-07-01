function Draw(deck,hand,obj) {
	var _card = array_shift(deck);
	array_push(hand, obj);
	return _card
}

function checkObjectClicked(obj) {
	if mouse_check_button_released(1) and obj.x <= mouse_x and mouse_x <= obj.x+obj.sprite_width and obj.y <= mouse_y and mouse_y <= obj.y+obj.sprite_height {
		return true;
	}
	else return false;
}

function SwapTurn() {
	if turn == "player" turn = "opponent";
	else if turn == "opponent" turn = "player";
}

function CheckCardPlayable(hand,centercard,selected,index) {
	if string_char_at(centercard.value,3) == string_char_at(hand[selected[index]].value,3) or (string_char_at(centercard.value,1) == string_char_at(hand[selected[index]].value,1) and string_char_at(centercard.value,2) == string_char_at(hand[selected[index]].value,2)) {
		return true;
	}
	else return false;
}