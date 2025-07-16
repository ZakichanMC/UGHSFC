draw_self();
if owner == "player" or owner == "enemy" {
	draw_sprite(sNumbers,real(value.number),x,y);
}
if value.blueprint != noone {
	draw_sprite(sBlueprintOutline,0,x,y);
}
//if value.code != noone {
//	show_debug_message(instance_exists(value.code));
//	show_debug_message(value.code.sprite_index);
//	draw_sprite(sCodeOutline,value.code.image_index,x,y);
//}