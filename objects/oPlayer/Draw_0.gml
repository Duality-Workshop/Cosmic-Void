draw_self();
is_blinking = false;

if (is_regen) {
    shader_set(shAquaWave);
	shader_set_uniform_f(shader_wave, Wave(0.0, 1.0, 2.0, 0.0));

	draw_self();
	shader_reset();
} else if (invicibility_frames > 0) {
	if (hit or (alarm[1] <= 0) or (invicibility_frames > blink_delay)) {
		shader_set(shWhite);
		is_blinking = true;
	}

	draw_self();
	shader_reset();
}

// debug
if (global.debug)
{
	draw_text(x, y - 50, is_sliding);
	oGun.image_alpha = 0;
	/*draw_rectangle(x+horizontal_speed-8, y+vertical_speed-8, x+horizontal_speed+8, y+vertical_speed+8, true);
	draw_rectangle(x+horizontal_speed-1, y+vertical_speed-1, x+horizontal_speed+1, y+vertical_speed+1, true);
	draw_rectangle_color(x+horizontal_speed-8, y+vertical_speed-32, x+horizontal_speed+8, y+vertical_speed-16, c_red, c_red, c_red, c_red, true);
	draw_rectangle_color(x+horizontal_speed-1, y+vertical_speed-25, x+horizontal_speed+1, y+vertical_speed-23, c_red, c_red, c_red, c_red, true);*/
	draw_rectangle_color(x-1, y-1, x+1, y+1, c_lime, c_lime, c_lime, c_lime, false);
	if (debug_value != noone) {
	    var val = [debug_value.x, debug_value.y, debug_value.sprite_width, debug_value.sprite_height];
		var x1 = val[0];
		var y1 = val[1];
		var x2 = x1 + val[2];
		var y2 = y1 + val[3];
		draw_rectangle_color(x1, y1, x2, y2, c_red, c_red, c_red, c_red, true);
	}
}

// TODO: If injured
