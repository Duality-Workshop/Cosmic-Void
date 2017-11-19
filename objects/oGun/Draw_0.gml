draw_self();


if (oPlayer.hit and oPlayer.has_control) {
	shader_set(shWhite);
	draw_self();
	shader_reset();
}