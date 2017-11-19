vertical_speed += object_gravity;
jump_delay--;

// Random jumps
if (place_meeting(x, y+1, oWall) and jump_delay <= 0) {
	vertical_speed = -5;
	jump_delay = random_range(0, 60 * 10);
}

// Wall detection (=> Jump!)
if (place_meeting(x, y+1, oWall) and place_meeting(x+horizontal_speed+(20*sign(horizontal_speed)), y, oWall) and !place_meeting(x+horizontal_speed+(20*sign(horizontal_speed)), y-33, oWall) and horizontal_speed != 0) {
	vertical_speed = -5;
}

if (horizontal_speed != walk_speed and horizontal_speed != 0) {
	horizontal_speed -= (horizontal_speed - (walk_speed * sign(horizontal_speed))) / 10;	
}

// Horizontal collision
if (place_meeting(x+horizontal_speed, y, oWall)) {
	// Braking system; not satisfactory
	while (!place_meeting(x+sign(horizontal_speed), y, oWall)) {
		x += sign(horizontal_speed);
	}
	horizontal_speed *= -1;
}

if (running and run_delay > 0) {
	x += horizontal_speed;
	run_delay--;
} else {
	running = false;
}

if (!running) {
	idle_delay--;
}

if (idle_delay <= 0) {
	running = true;
	run_delay = run_delay_base;
	idle_delay = idle_delay_base;
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
		sprite_index = sEnemyJump;
		image_index = 1;
	} else {
		// Jump
		sprite_index = sEnemyJump;
		image_index = 0;
	}
		image_speed = 0;
} else {
	if (x != xprevious) {
		// Run
		sprite_index = sEnemyRun;
	} else {
		// Stand
		sprite_index = sEnemy;
	}
		image_speed = 1;
}

if (x > xprevious) {
	image_xscale = scale;
} else if (x < xprevious) {
	image_xscale = -scale;
}