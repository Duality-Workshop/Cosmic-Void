/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 0F839371
/// @DnDApplyTo : b0300ab5-8063-483b-a2cf-8d61b6afc96b
/// @DnDArgument : "var" "is_striking"
/// @DnDArgument : "value" "true"
with(oPlayer) var l0F839371_0 = is_striking == true;
if(l0F839371_0)
{
	/// @DnDAction : YoYo Games.Common.Variable
	/// @DnDVersion : 1
	/// @DnDHash : 3E4179F4
	/// @DnDInput : 4
	/// @DnDApplyTo : other
	/// @DnDParent : 0F839371
	/// @DnDArgument : "expr" "-1"
	/// @DnDArgument : "expr_relative" "1"
	/// @DnDArgument : "expr_1" "3"
	/// @DnDArgument : "expr_2" "other.direction"
	/// @DnDArgument : "expr_3" "true"
	/// @DnDArgument : "var" "hp"
	/// @DnDArgument : "var_1" "flash_delay"
	/// @DnDArgument : "var_2" "hit_from"
	/// @DnDArgument : "var_3" "is_hit"
	with(other) {
	hp += -1;
	flash_delay = 3;
	hit_from = other.direction;
	is_hit = true;
	
	}

	/// @DnDAction : YoYo Games.Particles.Effect
	/// @DnDVersion : 1
	/// @DnDHash : 41D97152
	/// @DnDApplyTo : other
	/// @DnDParent : 0F839371
	/// @DnDArgument : "x" "other.x"
	/// @DnDArgument : "y" "other.y"
	/// @DnDArgument : "type" "7"
	/// @DnDArgument : "where" "1"
	/// @DnDArgument : "color" "col"
	with(other) effect_create_above(7, other.x, other.y, 0, col & $ffffff);
}