if (death_done == 0) {
	vertical_speed += object_gravity;

	// Horizontal collision
	if (place_meeting(x+horizontal_speed, y, oWall)) {
		// Braking system; not satisfactory
		while (!place_meeting(x+sign(horizontal_speed), y, oWall)) {
			x += sign(horizontal_speed);
		}
		horizontal_speed = 0;
	}

	x += horizontal_speed;

	// Vertical collision
	if (place_meeting(x, y+vertical_speed, oWall)) {
		if (vertical_speed > 0) {
			death_done = 1;
			image_index = 1;
		}
		
		// Braking system; not satisfactory
		while (!place_meeting(x, y+sign(vertical_speed), oWall)) {
			y += sign(vertical_speed);
		}
		vertical_speed = 0;
	}

	y += vertical_speed;
}