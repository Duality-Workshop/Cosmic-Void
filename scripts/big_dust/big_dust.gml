/// @param {real} count
/// @param {real} speed

repeat(argument0)
{
	dust_create(x,y,1,180-random(15),argument1);
	dust_create(x,y,1,random(15),argument1);
}