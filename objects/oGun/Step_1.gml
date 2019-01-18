x = oPlayer.x;
y = oPlayer.y;

if (oPlayer.has_control and !oPlayer.is_striking) {
	image_alpha = 1;
	if (oPlayer.controller == 0) {
		image_angle = point_direction(x, y, mouse_x, mouse_y);	
	} else {
		var controller_h = gamepad_axis_value(0, gp_axisrh);
		var controller_v = gamepad_axis_value(0, gp_axisrv);
	
		if (abs(controller_h) > 0.2 or abs(controller_v) > 0.2) {
			controller_angle = point_direction(0, 0, controller_h, controller_v);
		}
	
		image_angle = controller_angle;
		}

	firing_delay = max(-1, firing_delay - 1);
	recoil = max(0, recoil - 1);

	if ((mouse_check_button(mb_left) or gamepad_button_check(0, gp_shoulderrb)) and firing_delay < 0) {
		firing_delay = 10;
		recoil = 4;
		with (instance_create_layer(x, y, "Bullets", oBullet)) {
			ScreenShake(2, 10);
			speed = 25;
			direction = other.image_angle + random_range(-2, 2);
			image_angle = direction;
		}
	}

	x -= lengthdir_x(recoil, image_angle);
	y -= lengthdir_y(recoil, image_angle);

	if (image_angle > 90 and image_angle < 270) {
		image_yscale = -1;
	} else {
		image_yscale = 1;
	}
}
if (oPlayer.is_striking) {
	image_alpha = 0;
}