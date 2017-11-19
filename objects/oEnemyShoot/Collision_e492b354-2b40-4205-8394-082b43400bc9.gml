/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 1F1D6905
/// @DnDApplyTo : b0300ab5-8063-483b-a2cf-8d61b6afc96b
/// @DnDArgument : "var" "invicibility_frames"
with(oPlayer) var l1F1D6905_0 = invicibility_frames == 0;
if(l1F1D6905_0)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 5AD714FD
	/// @DnDInput : 5
	/// @DnDApplyTo : b0300ab5-8063-483b-a2cf-8d61b6afc96b
	/// @DnDParent : 1F1D6905
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
}