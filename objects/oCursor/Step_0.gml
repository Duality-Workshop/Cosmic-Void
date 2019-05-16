/// @description Insert description here
// You can write your code in this editor
if (gamepad_button_check_pressed(0, gp_stickr)) {
    gamepad_lock = !gamepad_lock;
}

if (!gamepad_lock) {
    _h = gamepad_axis_value(0, gp_axisrh);
	_v = gamepad_axis_value(0, gp_axisrv);
}