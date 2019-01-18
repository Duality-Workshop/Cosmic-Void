#region // Input processing
if (has_control) {
    key_left = keyboard_check(vk_left) or keyboard_check(ord("Q")) or keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	key_space = keyboard_check_direct(vk_space);
	key_space_press = keyboard_check_pressed(vk_space);
	key_dash = keyboard_check(vk_lshift);
	key_action = keyboard_check_pressed(ord("E"));
} else {
	key_left = 0;
	key_right = 0;
	key_space = 0;
	key_dash = 0;
	key_action = false;
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
var move = key_right - key_left;
if (has_control) {
	if (move != 0) {
		is_running = true;
	}

	if (key_dash != 0 and dash_delay <= 0 and move != 0) {
		horizontal_speed = move * dash_speed * key_dash;
		dash_delay = dash_delay_base;
		alarm[4] = dash_duration_base;
	} else {
		var acceleration;
		if (move == 0) {
		    if (is_on_ground) {
			    acceleration = stop_acceleration_ground;
			}
			else {
			    acceleration = stop_acceleration_air;
			}
		} else {
		    acceleration = speed_acceleration;
		}
		horizontal_speed = Approach(horizontal_speed, move * walk_speed, acceleration);
		is_dashing = false;
	}
} else {
	is_running = false;
	move = 0;

	horizontal_speed = Approach(horizontal_speed, move * walk_speed, .01);
}
dash_delay--;

#region // Wall jump
if (place_meeting(x+move, y, oWall)) {
	slide_wall_dir = sign(move);
}
if (!is_on_ground and (place_meeting(x+move, y, oWall) or (is_sliding and move == 0 and place_meeting(x+slide_wall_dir, y, oWall)))) {
	is_sliding = true;
	is_jumping = false;
} else {
	is_sliding = false;
}

if (is_sliding) {
    if (vertical_speed < 0) {
	    vertical_speed = Approach(vertical_speed, 0,  wall_friction_up);
	}
	else {
	    vertical_speed -= object_gravity * wall_friction_down;
	}
}

if (is_ledge_grab) {
    vertical_speed = 0;
	horizontal_speed = 0;
	if (key_space_press) {
		is_ledge_grab = false;
		is_sliding = false;
	    is_jumping = true;
		has_overjumped = false;
		jump_duration =  jump_duration_max / 2;
		horizontal_speed = wall_jump_magnitude_h * slide_wall_dir / 2 * -1;
	}
}
#endregion
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
	has_overjumped = false;
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
		has_overjumped = true;
	}
}

if (!is_jumping and !is_ledge_grab) {
	vertical_speed += object_gravity;
}

// Double jump
if ((!is_jumping or has_overjumped) and key_space_press and !has_double_jumped and !is_sliding) {
    has_double_jumped = true
	vertical_speed = double_jump_magnitude;
	
	var pd_dir = 270; // pointing the right direction
	var pd_width = 15; // maximum angle deviation
	var xd = x;
	var yd = y;
	
	part_type_direction(global.pt_dash_thruster, pd_dir-pd_width, pd_dir+pd_width, 0, 0);
	part_emitter_region(global.ps, global.pe_dash_thruster, xd-8, xd+8, yd-8, yd+8, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(global.ps, global.pe_dash_thruster, global.pt_dash_thruster, 15);
}

// Wall jump
if (is_sliding and key_space_press) {
    vertical_speed = wall_jump_magnitude_v;
    horizontal_speed = wall_jump_magnitude_h * slide_wall_dir * -1;
	is_sliding = false;
	dash_delay = dash_delay_base;
}
#endregion

#region // Horizontal collision
if (place_meeting(x+horizontal_speed, y, oWall)) {
	// Braking system
	var h_speed_sign = sign(horizontal_speed);
	while (!place_meeting(x+h_speed_sign, y, oWall)) {
		x += h_speed_sign;
	}
	if (is_sliding and !place_meeting(x+horizontal_speed, y-32, oWall)) {
	    is_ledge_grab = true;
		is_sliding = false;
		var wall_tile = instance_place(x+horizontal_speed, y, oWall);
		//debug_value = wall_tile;
		//x = wall_tile.x + wall_tile.sprite_width / 2;
		y = wall_tile.y + 8;
	}
	horizontal_speed = 0;
}

x += horizontal_speed;
#endregion

#region // Vertical collision
if (place_meeting(x, y+vertical_speed, oWall)) {
	is_on_ground = true;
	
	// Braking system
	while (!place_meeting(x, y+sign(vertical_speed), oWall)) {
		y += sign(vertical_speed);
	}
	
	if (vertical_speed > 0) {
		has_double_jumped = false;
	
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
	
	vertical_speed = 0;
} else {
	is_on_ground = false;
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
		sprite_index = sFeryuuJump;
		image_index = 1;
	} else {
		// Jump
		sprite_index = sFeryuuJump;
		image_index = 0;
	}
		image_speed = 0;
} else {
	if (x != xprevious and !dead) {
		// Run
		sprite_index = sFeryuuRun;
	} else {
		// Stand
		sprite_index = sFeryuu;
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

if (is_sliding or is_ledge_grab) {
	sprite_index = sFeryuuWall;
	oGun.image_alpha = 0;
	
	if (!is_ledge_grab) {
	    //Adjusting Emitter position.
		var xp, yp;
		xp = x + 16 * slide_wall_dir;
		yp = y;
		part_emitter_region(global.ps, global.pe_Slide_flakes, xp-1, xp+1, yp-12, yp+12, ps_shape_rectangle, ps_distr_linear);
	
		// Starting Emitter Stream.
		part_emitter_stream(global.ps, global.pe_Slide_flakes, global.pt_Slide_flakes, 1);
	} else {
		// Clearing Emitter Stream.
		part_emitter_clear(global.ps, global.pe_Slide_flakes);
	}
} else {
	oGun.image_alpha = 1;
	
	// Clearing Emitter Stream.
	part_emitter_clear(global.ps, global.pe_Slide_flakes);
}

#region // Dies
if (hp <= 0) {
	hp = 0;
	if (!dead) {
		ScreenShake(6, 25);
		effect_create_above(ef_explosion, x, y, .8, c_white);
		dead = true;
	}
	image_angle = 90;
	image_speed = 0;
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
 if (!dead and shield < max_shield) {
     if (shield_regen_delay > 0) {
	     shield_regen_delay--;
		 is_regen = false;
	 }
	 else
	 {
		 if (shield < max_shield) {
		     shield += shield_regen;
			 is_regen = true;
		 }
	 }
 } else {
	 is_regen = false;
 }
 
 if (hp > max_hp) {
	 hp = max_hp;
 }
 if (shield > max_shield) {
	 shield = max_shield;
 }
 
 oPlayerStats.hp = hp;
 oPlayerStats.shield = shield;
#endregion