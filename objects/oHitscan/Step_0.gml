if (!shot) {
    dist = 0;
	target = noone;
	is_target_enemy = false;

	while (dist < max_dist and target == noone) {
		target = collision_line(x, y, x + lengthdir_x(dist, direction), y + lengthdir_y(dist, direction), _enemy, false, true);
		
		if (target == noone) { // enemy hit?
			target = collision_line(x, y, x + lengthdir_x(dist, direction), y + lengthdir_y(dist, direction), _solid_parent, false, true);
			
			if (target == noone) { // wall hit?
				dist += 1;
			}
		} else {
			is_target_enemy = true;
		}
	}
	
	shot = true;
	
	if (is_target_enemy) {
		target.is_hit = true;
		target.hit_direction = direction;
	    Damage(target, damage);
	}
}