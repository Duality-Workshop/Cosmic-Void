if(knockback)
{
	ScreenShake(3, 10)
	direction = hit_from;
	horizontal_speed = lengthdir_x(knockback_factor, direction);
	vertical_speed = lengthdir_y(knockback_factor, direction) - 3;
	if (sign(horizontal_speed != 0)) {
		image_xscale = sign(horizontal_speed);
	}
	
	knockback = false;
}