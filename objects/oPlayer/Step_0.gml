#region // Input processing
if (has_control) {
    key_left = keyboard_check(vk_left) or keyboard_check(ord("Q")) or keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_space = keyboard_check_pressed(vk_space);
} else {
	key_left = 0;
	key_right = 0;
	key_space = 0;
}
#endregion

#region // Gamepad override
if (key_left or key_right or key_space) {
	controller = 0;
}

if (abs(gamepad_axis_value(0, gp_axislh)) > 0.2) {
	controller = 1;
	key_left = abs(min(gamepad_axis_value(0, gp_axislh),0));
	key_right = max(gamepad_axis_value(0, gp_axislh),0);
}

if (gamepad_button_check(0, gp_face1)) {
	key_space = 1;
}
#endregion

#region // Strike
if (strike_delay <= 0 and has_control and (mouse_check_button_pressed(mb_right) or gamepad_button_check(0, gp_face3))) {
	// oStrikeHitbox.image_alpha = 1;
	is_striking = true;
	alarm[3] = 5;
}
strike_delay--;
#endregion

#region // Calculate movement
if (invicibility_frames < blink_delay or !has_control) {
	var move = key_right - key_left;
	horizontal_speed = move * walk_speed;
}
vertical_speed += object_gravity;
#endregion

#region // Jump controller
if (place_meeting(x, y+1, oWall) and key_space) {
	vertical_speed = -7;
}
#endregion

#region // Horizontal collision
if (place_meeting(x+horizontal_speed, y, oWall)) {
	// Braking system; not satisfactory
	while (!place_meeting(x+sign(horizontal_speed), y, oWall)) {
		x += sign(horizontal_speed);
	}
	horizontal_speed = 0;
}

x += horizontal_speed;
#endregion

#region // Vertical collision
if (place_meeting(x, y+vertical_speed, oWall)) {
	// Braking system; not satisfactory
	while (!place_meeting(x, y+sign(vertical_speed), oWall)) {
		y += sign(vertical_speed);
	}
	vertical_speed = 0;
	
	var smoke_col = $A0A0A0;
	var step_effect = ef_smoke;
	var step_size = 0;
	var land_effect = ef_smoke;
	if (y > yprevious) {	// Landing particles
		effect_create_below(land_effect, x, y+24, .9, smoke_col);
		effect_create_above(land_effect, x+5, y+22, .9, smoke_col);
		effect_create_above(land_effect, x-5, y+22, .9, smoke_col);
	}
	
	if (x != xprevious and dust_delay <= 0) {	// Running particles
		effect_create_above(step_effect, x, y+24, step_size, smoke_col);
		dust_delay = dust_delay_base;
	}
	dust_delay--;
}

y += vertical_speed;
#endregion

#region // Animation
if (!place_meeting(x, y+1, oWall)) {
	if (y > yprevious) {
		// Fall
		sprite_index = sPlayerJump;
		image_index = 1;
	} else {
		// Jump
		sprite_index = sPlayerJump;
		image_index = 0;
	}
		image_speed = 0;
} else {
	if (x != xprevious) {
		// Run
		sprite_index = sPlayerRun;
	} else {
		// Stand
		sprite_index = sPlayer;
	}
		image_speed = 1;
}
if (is_striking) {
		sprite_index = sPlayerStrike;
	if (alarm[3] > 2) {
		image_index = 0;
	} else {
		image_index = 1;
	}
	image_speed = 0;
}

if (x > xprevious) {
	image_xscale = 1;
} else if (x < xprevious) {
	image_xscale = -1;
}

	#region // Dies
	if (hp == 0) {
		if (!dead) {
			ScreenShake(6, 25);
			effect_create_above(ef_explosion, x, y, .8, c_white);
			dead = true;
		}
		image_angle = 90;
		has_control = false;
	}
	#endregion

	#region // Blinks
	if (hit && alarm[0] <= 0) {
		alarm[0] = blink_delay;
	}
	#endregion
#endregion

#region // Update stats
 oPlayerStats.hp = hp;
#endregion