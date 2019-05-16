/// @description create a dust particle
/// @param {real} x
/// @param {real} y
/// @param {real} count
/// @param {real} direction
/// @param {real} speed

repeat(argument2)
{
	with(instance_create_depth(argument0,argument1,depth,obj_dust))
	{
		direction = argument3;
		speed = argument4;
	}
}