/// @description ap_move_player
/// @param {real} Control_Effectivness >=0
/// @param {real} Friction_Effectivness >=0
/// @param {real} Gravity_Effectivness >=0
/// @param {real} Acceleration >=0
var Control_Effectiveness = argument0;
var Friction_Effectiveness = 1 - argument1;
var Gravity_Effectiveness = argument2;
var Acceleration = speed_acceleration;

//Horizontal
var moving_direction = (right[held] - left[held]);

hspd = Approach(hspd, moving_direction * move_max_speed * Friction_Effectiveness, Acceleration * Control_Effectiveness);

//show_debug_message("moving...");

#region // Horizontal collision
if(place_meeting(x+hspd,y,_solid_parent))
{
	while(!place_meeting(x+sign(hspd),y,_solid_parent))
	{
		x+=sign(hspd);
	}
	hspd = 0;
}

x += hspd;
#endregion

#region // Vertical collision
vspd = Approach(vspd, gravity_max, gravity_inc * Gravity_Effectiveness * Friction_Effectiveness);

if (place_meeting(x, y+vspd+sign(vspd), _solid_parent)) {
	// Braking system
	while (!place_meeting(x, y+sign(vspd), _solid_parent)) {
		y += sign(vspd);
	}
	
	vspd = 0;
}

y += vspd;
#endregion

against_wall[left_wall]=place_meeting(x-1, y, _solid_parent);
against_wall[right_wall]=place_meeting(x+1, y, _solid_parent);
against_wall[bottom_wall]=place_meeting(x, y+2, _solid_parent);


/*hspd += (right[held]-left[held])*(move_accel*Control_Effectivness);

hspd=clamp(hspd,-move_max_speed,move_max_speed);
if(place_meeting(round(x)+ceil_signed(hspd),round(y),_solid_parent))
{
	round_position();
	while(!place_meeting(x+sign(hspd),y,_solid_parent))
		x+=sign(hspd);
	against_wall[0]=sign(hspd);
	hspd=0;
}

x+=hspd;
hspd=approach(hspd,0,move_friction*Friction_Effectivness);
	
//vertical
vspd=min(vspd+gravity_inc*Gravity_Effectivness,gravity_max);
if(place_meeting(round(x),round(y)+ceil_signed(vspd),_solid_parent))
{
	round_position();
	while(!place_meeting(x,y+sign(vspd),_solid_parent))
		y+=sign(vspd);	
	against_wall[1]=sign(vspd);
	vspd=0;
	grace_frames=max_grace_frames;
}
else
	grace_frames -= grace_frames > 0;
y+=vspd;*/

//wall_escape(_solid_parent);