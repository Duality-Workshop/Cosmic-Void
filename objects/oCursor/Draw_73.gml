if (oGlobalConstants.input_mode == Input.keyboard) {
    x = mouse_x;
	y = mouse_y;
}
else {
    x = obj_ap_feryuu.x + (_h * gamepad_max_range);
	y = obj_ap_feryuu.y + (_v * gamepad_max_range);
}

image_angle += 0.1;
window_set_cursor(cr_none);
draw_self();