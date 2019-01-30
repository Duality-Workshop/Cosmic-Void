if (!shot) {
    dists = array_create(nb_projectiles, 0);
	targets = array_create(nb_projectiles, noone);

	for (var i = 0; i < array_length_1d(dists); i++) {
		var dist = dists[i];
		var angle = direction + angles[i];
	
	    while (dist < max_dist and targets[i] == noone) {
			targets[i] = collision_line(x, y, x + lengthdir_x(dist, angle), y + lengthdir_y(dist, angle), oWall, false, true);
			if (targets[i] == noone) {
				dists[i] += 1;
				dist = dists[i];
			}
		}
	}
	
	shot = true;
}