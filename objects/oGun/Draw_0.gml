draw_self();


if (oPlayer.is_blinking) {
	shader_set(shWhite);
	draw_self();
	shader_reset();
}