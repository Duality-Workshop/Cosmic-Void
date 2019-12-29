x = player.x;
y = player.y-30;

direction = point_direction(x, y, mouse_x, mouse_y);
if (direction > 90 and direction < 270) {
	image_yscale = -0.5;
} else {
	image_yscale = 0.5;
}
image_xscale = 0.5;

image_angle = direction;

var fire_button;
if (automatic) {
	fire_button = mouse_check_button(mb_left);
} else {
	fire_button = mouse_check_button_pressed(mb_left);
}

if (fire_button) {
	if (current_cd == 0) {
		current_cd = cooldown;
		current_delay = startup;
	}
}

if (current_delay == 0 and projectile != noone) {
    with (instance_create_layer(
		x + lengthdir_x(length, direction),
		y + lengthdir_y(length, direction),
		"Projectiles",
		projectile
		))
	{
	    direction = other.direction;
		speed = other.bulletspeed;
		image_angle = direction;
		ScreenShake(other.recoil, 10);
	}
	
	current_recoil = recoil;
	
	audio_play_sound(Shoot, 10, false);
}

current_delay = max(-1, current_delay - 1);
if (current_delay == -1) {
    current_cd = max(0, current_cd - 1);
}
current_recoil = max(0, floor(current_recoil * .8));

depth = player.depth - 1;