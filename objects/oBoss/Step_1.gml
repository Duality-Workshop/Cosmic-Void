if(hp <= 0)
{
	for(var i = 0; i < 5; i++) {
		with(instance_create_layer(x, y, "Enemies", oEnemy)) {
			launch_direction = irandom_range(0, 180);
			horizontal_speed = lengthdir_x(10, launch_direction);
			vertical_speed = lengthdir_y(10, launch_direction);
			if (sign(horizontal_speed != 0)) {
				image_xscale = sign(horizontal_speed) * other.scale;
				image_yscale = other.scale;
			}
			depth = 11;
			max_hp = 2;
			hp = max_hp;
			scale = .5;
			image_xscale = scale;
			image_yscale = scale;
			running = true;
		}
	}
	with(instance_create_layer(x, y, layer, oEnemyDead)) {
		direction = other.hit_from;
		horizontal_speed = lengthdir_x(3, direction);
		vertical_speed = lengthdir_y(3, direction) - 2;
		if (sign(horizontal_speed != 0)) {
			image_xscale = sign(horizontal_speed) * other.scale;
			image_yscale = other.scale;
		}
	}

	instance_destroy();
}