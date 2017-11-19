vertical_speed += object_gravity;
jump_delay--;

fire_direction = point_direction(x, y, oPlayer.x, oPlayer.y);

if (place_meeting(x, y+1, oWall) and jump_delay <= 0) {
	vertical_speed = -5;
	jump_delay = random_range(0, 60 * 10);
}

// Wall detection
if (place_meeting(x, y+1, oWall) and place_meeting(x+horizontal_speed+(20*sign(horizontal_speed)), y, oWall)) {
	vertical_speed = -5;
}

// Horizontal collision
if (place_meeting(x+horizontal_speed, y, oWall)) {
	// Braking system; not satisfactory
	while (!place_meeting(x+sign(horizontal_speed), y, oWall)) {
		x += sign(horizontal_speed);
	}
	horizontal_speed *= -1;
}

if (shoot_delay > 0) {
	shoot_delay--;
} else {
	shooting = true;
}

if (shooting) {
	shoot_delay = shoot_delay_base;
	if (!charging) {
		alarm[0] = 60;
		charging = true;
	}
	
	var fire_distance = 32;
	
	effect_create_above(ef_smokeup, x + lengthdir_x(fire_distance, fire_direction), y + lengthdir_y(fire_distance, fire_direction), 0, c_red);
}

// Vertical collision
if (place_meeting(x, y+vertical_speed, oWall)) {
	// Braking system; not satisfactory
	while (!place_meeting(x, y+sign(vertical_speed), oWall)) {
		y += sign(vertical_speed);
	}
	vertical_speed = 0;
	
	if (y > yprevious) {
		var effect = ef_firework;
		var size = 0;
		effect_create_below(effect, x, y+23, size, col);
		effect_create_below(effect, x+20, y+23, size, col);
		effect_create_below(effect, x-20, y+22, size, col);
	}
}

y += vertical_speed;


// Animation
if (!place_meeting(x, y+1, oWall)) {
	if (y > yprevious) {
		// Fall
		sprite_index = sEnemyShootJump;
		image_index = 1;
	} else {
		// Jump
		sprite_index = sEnemyShootJump;
		image_index = 0;
	}
		image_speed = 0;
} else {
	// Stand
	sprite_index = sEnemyShoot;
	image_speed = 1;
}

if (fire_direction < 90 or fire_direction > 270) {
	image_xscale = scale;
} else {
	image_xscale = -scale;
}