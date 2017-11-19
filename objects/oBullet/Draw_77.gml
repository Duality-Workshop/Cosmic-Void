if (place_meeting(x, y, oWall)) {
	effect_create_above(ef_firework, x, y, .1, c_aqua);
	instance_destroy();
}