if (!shot) {
    dist = 0;
	target = noone;

	while (dist < max_dist and target == noone) {
		target = collision_line(x, y, x + lengthdir_x(dist, direction), y + lengthdir_y(dist, direction), oWall, false, true);
		if (target == noone) {
			dist += 1;
		}
	}
	
	shot = true;
}