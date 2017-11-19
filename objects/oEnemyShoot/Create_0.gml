walk_speed = 0;
horizontal_speed = walk_speed;
vertical_speed = 0;
object_gravity = .3;

col = $C99040;

max_hp = 4;
hp = max_hp;
flash_delay = 0;
jump_delay = random_range(60 * 3, 60 * 10);
shoot_delay_base = random_range(60 * 0, 60 * 5);
shoot_delay = shoot_delay_base;
idle_delay_base = random_range(60 * 0, 60 * 10);
idle_delay = idle_delay_base;
shooting = false;
charging = false;
fire_direction = 0;

scale = 1;

hit_from = 0;
is_hit = false;

// random horizontal orientation
if (irandom_range(0, 1) == 1) {
	horizontal_speed *= -1;
}

value = 10 * scale;