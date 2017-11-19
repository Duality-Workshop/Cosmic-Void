draw_self();


if (invicibility_frames > 0 and has_control) {
	invicibility_frames--;
	if (hit or (alarm[1] <= 0)) {
		shader_set(shWhite);
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
