vertical_speed += object_gravity;
jump_delay--;
player_x = oPlayer.x;

// Spawn mini mobs every 10th of max_hp
if (is_hit and ((hp / max_hp) mod .1) == 0) {
	effect_create_above(ef_firework, x, y, 2, col);
	with(instance_create_layer(x, y, "Enemies", oEnemy)) {
		launch_direction = irandom_range(0, 180);
		horizontal_speed = lengthdir_x(10, launch_direction);
		vertical_speed = lengthdir_y(10, launch_direction);
		if (sign(horizontal_speed != 0)) {
			image_xscale = sign(horizontal_speed) * other.scale;
			image_yscale = other.scale;
		}
		depth = 11;
		max_hp = 2;
		hp = max_hp;
		scale = .5;
		image_xscale = scale;
		image_yscale = scale;
		running = true;
	}
	
	is_hit = false;
}

// Spawn mini-mob randomly
if (shoot_delay > 0) {
	shoot_delay--;
} else {
	shooting = true;
}

if (shooting) {
	shoot_delay = shoot_delay_base;
	with(instance_create_layer(x, y, "Enemies", oEnemy)) {
		launch_direction = irandom_range(0, 180);
		horizontal_speed = lengthdir_x(10, launch_direction);
		vertical_speed = lengthdir_y(10, launch_direction);
		if (sign(horizontal_speed != 0)) {
			image_xscale = sign(horizontal_speed) * other.scale;
			image_yscale = other.scale;
		}
		depth = 11;
		max_hp = 2;
		hp = max_hp;
		scale = .5;
		image_xscale = scale;
		image_yscale = scale;
		running = true;
	}
	shooting = false;
}

// Run towards player
if (x > player_x) {
	if (horizontal_speed > 0) {
		horizontal_speed *= -1;
	}
} else {
	if (horizontal_speed < 0) {
		horizontal_speed *= -1;
	}
}

// Random jumps
if (place_meeting(x, y+1, oWall) and jump_delay <= 0) {
	vertical_speed = -jump_magnitude;
	jump_delay = random_range(0, 60 * 10);
}

// Wall detection (=> Jump!)
if (place_meeting(x, y+1, oWall) and place_meeting(x+horizontal_speed+(10*sign(horizontal_speed)), y, oWall) and !place_meeting(x+horizontal_speed+(15*sign(horizontal_speed)), y-50, oWall) and horizontal_speed != 0) {
	vertical_speed = -jump_magnitude;
}

// Horizontal collision
if (place_meeting(x+horizontal_speed, y, oWall)) {
	// Braking system; not satisfactory
	while (!place_meeting(x+sign(horizontal_speed), y, oWall)) {
		x += sign(horizontal_speed);
	}
	horizontal_speed = 0;
}

if (running) {
	x += horizontal_speed;
} else {
	idle_delay--;
}

if (idle_delay <= 0) {
	running = true;
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
		effect_create_below(effect, x, y+23*scale, size, col);
		effect_create_below(effect, x+20*scale, y+23*scale, size, col);
		effect_create_below(effect, x-20*scale, y+22*scale, size, col);
		ScreenShake(5, 20);
	}
}

y += vertical_speed;


#region // Animation
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
#endregion