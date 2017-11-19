draw_self();

if (flash_delay > 0) {
	flash_delay--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}

// If injured
if(hp < max_hp)
{
	// Draw Healthbar
	var pc;
	pc = (hp / max_hp) * 100;
	draw_healthbar(x - (sprite_width * .5), y - (sprite_height * .5) - 8, x + (sprite_width * .5), y - (sprite_height * .5) - 4, pc, c_black, c_red, c_lime, 0, false, false)
}