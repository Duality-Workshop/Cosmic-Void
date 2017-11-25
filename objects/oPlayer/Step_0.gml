#region // Input processing
if (has_control) {
    key_left = keyboard_check(vk_left) or keyboard_check(ord("Q")) or keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_space = keyboard_check_direct(vk_space);
	key_dash = keyboard_check(vk_lshift);
} else {
	key_left = 0;
	key_right = 0;
	key_space = 0;
	key_dash = 0;
}
// running = ((key_right - key_left) != 0);
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

if (gamepad_button_check(0, gp_face2)) {
	key_dash = 1;
}
#endregion

#region // Strike
if (strike_delay <= 0 and has_control and (mouse_check_button_pressed(mb_right) or gamepad_button_check_pressed(0, gp_face3))) {
	// oStrikeHitbox.image_alpha = 1;
	is_striking = true;
	alarm[3] = 5;
}
strike_delay--;
#endregion

#region // Calculate movement
if (has_control) {
	var move = key_right - key_left;
	if (move != 0) {
		is_running = true;
	}

	if (key_dash != 0 and dash_delay <= 0 and move != 0) {
		horizontal_speed = move * dash_speed * key_dash;
		dash_delay = dash_delay_base;
		alarm[4] = dash_duration_base;
	} else {
		horizontal_speed = Approach(horizontal_speed, move * walk_speed, .3);
		is_dashing = false;
	}
} else {
	is_running = false;
	var move = 0;

	horizontal_speed = Approach(horizontal_speed, move * walk_speed, .01);
}
dash_delay--;
#endregion

#region // Dash particles
if (alarm[4] > 0) {
	var pb_dir = 90 + 90 * move; // pointing the right direction
	var pb_width = 15; // maximum angle deviation
	var xp = x;
	var yp = y;
	
	part_type_direction(global.pt_dash_thruster, pb_dir-pb_width, pb_dir+pb_width, 0, 0);
	part_emitter_region(global.ps, global.pe_dash_thruster, xp-8, xp+8, yp-8, yp+8, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(global.ps, global.pe_dash_thruster, global.pt_dash_thruster, 5);
}
#endregion

#region // Jump controller
if (place_meeting(x, y+1, oWall) and key_space) {
	is_jumping = true;
	vertical_speed = jump_magnitude;
	jump_duration = 0;
}
if (is_jumping and !key_space) {
	is_jumping = false;
}
if (is_jumping and key_space) {
	vertical_speed = Approach(vertical_speed, jump_speed_max, jump_speed);
	jump_duration++;
	if (jump_duration >= jump_duration_max) {
		is_jumping = false;
	}
}

if (!is_jumping) {
	vertical_speed += object_gravity;
}
#endregion

#region // Horizontal collision
if (place_meeting(x+horizontal_speed, y, oWall)) {
	// Braking system
	while (!place_meeting(x+sign(horizontal_speed), y, oWall)) {
		x += sign(horizontal_speed);
	}
	horizontal_speed = 0;
}

x += horizontal_speed;
#endregion

#region // Vertical collision
if (place_meeting(x, y+vertical_speed, oWall)) {
	// Braking system
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

has_control = (invicibility_frames < blink_delay) and !dead;
if (invicibility_frames > 0) {
	invicibility_frames--;
}

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
	if (x != xprevious and !dead) {
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
	if (hp <= 0) {
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