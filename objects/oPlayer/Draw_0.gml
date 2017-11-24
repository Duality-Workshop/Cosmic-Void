draw_self();
is_blinking = false;

if (invicibility_frames > 0) {
	if (hit or (alarm[1] <= 0) or (invicibility_frames > blink_delay)) {
		shader_set(shWhite);
		is_blinking = true;
	}
	draw_self();
	shader_reset();
}

// TODO: If injured

// Draw Healthbar
cx = camera_get_view_x(vc);
cy = camera_get_view_y(vc);
	
var pc;
pc = (hp / max_hp) * 100;
draw_healthbar(cx + camera_width_spacer, cy + 16, cx + camera_width - camera_width_spacer, cy + 32, pc, c_black, c_red, c_lime, 0, false, false);
