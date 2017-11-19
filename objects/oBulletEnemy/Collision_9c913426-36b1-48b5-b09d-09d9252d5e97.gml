/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 002D557F
/// @DnDApplyTo : b0300ab5-8063-483b-a2cf-8d61b6afc96b
/// @DnDArgument : "var" "invicibility_frames"
with(oPlayer) var l002D557F_0 = invicibility_frames == 0;
if(l002D557F_0)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 6D473C10
	/// @DnDInput : 5
	/// @DnDApplyTo : b0300ab5-8063-483b-a2cf-8d61b6afc96b
	/// @DnDParent : 002D557F
	/// @DnDArgument : "expr" "invicibility_frames_base"
	/// @DnDArgument : "expr_1" "-1"
	/// @DnDArgument : "expr_relative_1" "1"
	/// @DnDArgument : "expr_2" "point_direction(other.x, other.y, x, y)"
	/// @DnDArgument : "expr_3" "true"
	/// @DnDArgument : "expr_4" "true"
	/// @DnDArgument : "var" "invicibility_frames"
	/// @DnDArgument : "var_1" "hp"
	/// @DnDArgument : "var_2" "hit_from"
	/// @DnDArgument : "var_3" "knockback"
	/// @DnDArgument : "var_4" "hit"
	with(oPlayer) {
	invicibility_frames = invicibility_frames_base;
	hp += -1;
	hit_from = point_direction(other.x, other.y, x, y);
	knockback = true;
	hit = true;
	
	}

	/// @DnDAction : YoYo Games.Particles.Effect
	/// @DnDVersion : 1
	/// @DnDHash : 41D97152
	/// @DnDParent : 002D557F
	/// @DnDArgument : "x_relative" "1"
	/// @DnDArgument : "y_relative" "1"
	/// @DnDArgument : "where" "1"
	/// @DnDArgument : "color" "$FF0000FF"
	effect_create_above(0, x + 0, y + 0, 0, $FF0000FF & $ffffff);

	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 36EC947B
	/// @DnDParent : 002D557F
	instance_destroy();
}