if (keyboard_check_pressed(ord("P"))) {
    window_scale++;
	camera_set_size();
}
if (keyboard_check_pressed(ord("M"))) {
    window_scale--;
	camera_set_size();
}

if (keyboard_check_pressed(ord("O"))) {
    zoom++;
	camera_set_size();
}
if (keyboard_check_pressed(ord("L"))) {
    zoom--;
	camera_set_size();
}

if (keyboard_check_pressed(ord("I"))) {
    global.time_dilation += 0.1;
}
if (keyboard_check_pressed(ord("K"))) {
    global.time_dilation -= 0.1;
}