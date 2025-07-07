draw_self();
if owner == "player" or owner == "enemy" {
	draw_sprite(sNumbers,real(string_char_at(value,1)+string_char_at(value,2)),x,y);
}