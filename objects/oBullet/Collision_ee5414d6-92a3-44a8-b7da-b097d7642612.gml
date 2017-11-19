/// @DnDAction : YoYo Games.Common.Variable
/// @DnDVersion : 1
/// @DnDHash : 3E4179F4
/// @DnDInput : 4
/// @DnDApplyTo : other
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
/// @DnDArgument : "x" "other.x"
/// @DnDArgument : "y" "other.y"
/// @DnDArgument : "where" "1"
/// @DnDArgument : "color" "col"
with(other) effect_create_above(0, other.x, other.y, 0, col & $ffffff);

/// @DnDAction : YoYo Games.Instances.Destroy_Instance
/// @DnDVersion : 1
/// @DnDHash : 36EC947B
instance_destroy();