if (oGlobalConstants.input_mode == Input.keyboard) {
    var hor = right[held] - left[held];
	var ver = down[held] - up[held];
}
else {
    var hor = gamepad_axis_value(0, gp_axislh);
	var ver = gamepad_axis_value(0, gp_axislv);
}

return [hor, ver];