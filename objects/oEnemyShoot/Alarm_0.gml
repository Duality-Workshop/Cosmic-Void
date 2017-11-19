with (instance_create_layer(x, y, "Bullets", oBulletEnemy)) {
	speed = 15;
	direction = point_direction(other.x, other.y, oPlayer.x, oPlayer.y) + random_range(-2, 2);
	image_angle = direction;
	
	other.shooting = false;
	other.charging = false;
}