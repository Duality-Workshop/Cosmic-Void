// Inherit the parent event
event_inherited();

// DEBUG
bbox_w = bbox_right + 1 - bbox_left;
bbox_h = bbox_bottom + 1 - bbox_top;

events[e_draw] ++;


if (is_regenerating) {
    shader_set(shAquaWave);
	shader_set_uniform_f(_uwave, Wave(0, 1, 1, 0));
	draw_self_facing();
	shader_reset();
} else {
	draw_self_facing();
}


if (global.debug) {
	truestate_draw_current(x, y - 75);
	draw_text(x, y-130, "Strike state: " + string(strike_state));
	draw_text(x, y-100, 
		"Speed: " + string(image_speed) + 
		", Index: " + string(image_index) + 
		", Number: " + string(image_number));
    /*draw_text(x, y-130, "HP: " + string(hp) + " / " + string(max_hp));
    draw_text(x, y-100, "Shield: " + string(shield) + " / " + string(max_shield));*/
}

//draw_text(x, y-75, string(display_get_gui_width()) + "x" + string(display_get_gui_height()))
/*
draw_text(x, y - 100, [global.time_dilation, global.time_delta]);
draw_text(x, y - 125, [hspd, x - xprevious]);
draw_circle_color(x+(bbox_w/2)+1, y, 1, noone, c_lime, true);
draw_circle_color(x-(bbox_w/2)-1, y, 1, noone, c_lime, true);
draw_circle_color(x, y+2, 1, noone, c_lime, true);
draw_rectangle(x-(bbox_w/2),y-bbox_h, x+(bbox_w/2),y, true);

draw_circle_color(x, y, 1, noone, c_blue, true);

draw_circle_color(round(x)+ceil_signed(hspd), y, 1, noone, c_aqua, true);*/