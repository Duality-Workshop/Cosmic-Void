alpha -= 1 / lifetime
for (var i = 0; i < array_length_1d(dists); i++) {
	var dist = dists[i];
	var target = targets[i];
	var angle = direction + angles[i];
	
	draw_sprite_ext(sprite_index, 0, x, y, dist / sprite_get_width(sprite_index), 1, angle, c_white, alpha);
	if (target != noone and hit < nb_projectiles) {
		effect_create_above(ef_firework, x + lengthdir_x(dist, angle), y + lengthdir_y(dist, angle), .1, color);
		hit++;
	}
}
