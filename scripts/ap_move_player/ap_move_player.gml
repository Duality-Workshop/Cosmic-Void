/// @description ap_move_player
/// @param {real} Control_Effectivness >=0
/// @param {real} Friction_Effectivness >=0
/// @param {real} Gravity_Effectivness >=0
/// @param {real} Acceleration >=0
var Control_Effectiveness = argument0;
var Friction_Effectiveness = 1 - argument1;
var Gravity_Effectiveness = argument2;
var Acceleration = speed_acceleration;

//show_debug_message("moving...");

#region // Horizontal
var moving_direction = (right[held] - left[held]);
var max_target_speed = moving_direction * move_max_speed * Friction_Effectiveness;
var target_speed_inc = Acceleration * Control_Effectiveness;

if (global.time_delta >= 1) { // this is a delta frame
    hspd = Approach(hspd, max_target_speed, target_speed_inc);
}

if(place_meeting(x+hspd * global.time_dilation,y,_solid_parent))
{
	while(!place_meeting(x+sign(hspd),y,_solid_parent))
	{
		x+=sign(hspd);
	}
	hspd = 0;
}

x += hspd * global.time_dilation;
#endregion

#region // Vertical collision
if (state = States.jump) {
	if (state_var[3] > 0) { // state3 = jump speed
		vspd -= state_var[3];
		state_var[3] -= jump_speed_dec;
	}
}

if (global.time_delta >= 1) { // this is a delta frame
    vspd = Approach(vspd, gravity_max, gravity_inc * Gravity_Effectiveness * Friction_Effectiveness);
}

if (place_meeting(x, y+vspd+sign(vspd), _solid_parent)) {
	// Braking system
	while (!place_meeting(x, y+sign(vspd), _solid_parent)) {
		y += sign(vspd);
	}
	
	vspd = 0;
}

y += vspd * global.time_dilation;
#endregion

against_wall[left_wall]=place_meeting(x-1, y, _solid_parent);
against_wall[right_wall]=place_meeting(x+1, y, _solid_parent);
against_wall[bottom_wall]=place_meeting(x, y+2, _solid_parent);
