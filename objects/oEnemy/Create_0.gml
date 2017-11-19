walk_speed = irandom_range(1, 2);
horizontal_speed = walk_speed;
vertical_speed = 0;
object_gravity = .3;

col = $3FC78D;

max_hp = 4;
hp = max_hp;
flash_delay = 0;
jump_delay = random_range(60 * 3, 60 * 10);
run_delay_base = random_range(60 * 1, 60 * 10);
run_delay = run_delay_base;
idle_delay_base = random_range(60 * 0, 60 * 10);
idle_delay = idle_delay_base;
running = false;
scale = 1;
image_xscale = scale;
image_yscale = scale;

hit_from = 0;
is_hit = false;

// random horizontal orientation
if (irandom_range(0, 1) == 1) {
	horizontal_speed *= -1;
}

value = 5 * scale;