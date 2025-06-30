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