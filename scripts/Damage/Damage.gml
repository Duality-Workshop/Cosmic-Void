/// @desc Damage(target, amount)
/// @arg target Who receives the damage
/// @arg amount The amount of damage

var target = argument0;
var amount = argument1;

if (variable_instance_exists(target, "is_blinking"))
{
	if (target.is_blinking) { // no damage on invicibility frames
		exit;
	}
}

if (variable_instance_exists(target, "shield"))
{
	if (target.shield > 0)
	{
		target.shield = Approach(target.shield, 0, amount);
		
		target.shield_regen_delay = target.shield_regen_delay_base;
		
		if (target.shield == 0) {
		    var pb_dir = 90; // pointing up
			var pb_width = 360; // maximum angle deviation
			var xp = target.x;
			var yp = target.y;
	
			part_type_direction(global.pt_Thruster, pb_dir-pb_width, pb_dir+pb_width, 0, 0);
			part_emitter_region(global.ps, global.pe_Thruster, xp-16, xp+16, yp-16, yp+16, ps_shape_ellipse, ps_distr_linear);
			part_emitter_burst(global.ps, global.pe_Thruster, global.pt_Thruster, 75);
		}
		
		exit;
	}
}

target.hp -= amount;