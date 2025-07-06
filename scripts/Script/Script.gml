function Draw(deck,hand,obj) {
	var _card = array_shift(deck);
	array_push(hand, obj);
	return _card
}

function checkObjectClicked(obj) {
	if mouse_check_button_released(1) and position_meeting(mouse_x,mouse_y,obj) {
		return true;
	}
	else return false;
}

function checkCardClicked(cards,type) {
	var _lowest = 9999;
	var _clicked = noone;
	with (cards) {
		if type == "press" {
			if (mouse_check_button_pressed(1) and position_meeting(mouse_x,mouse_y,id) and (depth < _lowest)) {
			    _lowest = depth;
			    _clicked = id;
			}
		}
		else if type == "release" {
			if (mouse_check_button_released(1) and position_meeting(mouse_x,mouse_y,id) and id.dragged) {
				_clicked = id;
			}
		}
	}
	return _clicked
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

function CreateCard() {
	var _card = instance_create_layer(40,200,"Instances",oCard);
	_card.x = 9999;
	_card.value = Draw(playerDeck,playerHand,_card);
	_card.image_index = string_char_at(_card.value,3);
	_card.owner = "player";
}