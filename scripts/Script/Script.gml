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
	if turn == "player" turn = "enemy";
	else if turn == "enemy" turn = "player";
}

function CheckCardPlayable(hand,centercard,selected,index) {
	if centercard.value.shape == hand[selected[index]].value.shape or centercard.value.number == hand[selected[index]].value.number {
		return true;
	}
	else return false;
}

function CreateCard(deck,hand,_owner) {
	var _card = noone;
	if _owner == "player" {
		_card = instance_create_layer(9999,200,"Instances",oCard);
		_card.value = Draw(deck,hand,_card);
		_card.image_index = _card.value.shape;
	}
	else {
		_card = instance_create_layer(9999,32,"Instances",oCard);
		_card.value = Draw(deck,hand,_card);
		_card.image_index = _card.value.shape; //change back to 5 (the blank sprite)
	}
	_card.owner = _owner;
}

function AlignCards(hand) {
	for (var i = 0; i < array_length(hand); i++) {
		//if the card is in hand, lock it in place
		if !hand[i].dragged {
			//to avoid division by 0
			if array_length(hand) > 1 {
				hand[i].x = 32 + i * (192 - 32) / (array_length(hand) - 1);
			}
			else hand[i].x = 32;
		}
		hand[i].depth = -hand[i].x;
	}
}