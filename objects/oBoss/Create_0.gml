walk_speed = .5;
jump_magnitude = 8;
horizontal_speed = walk_speed;
vertical_speed = 0;
object_gravity = .3;

col = $3FC78D;

max_hp = 20;
hp = max_hp;
flash_delay = 0;
jump_delay = random_range(60 * 3, 60 * 10);
run_delay_base = random_range(60 * 1, 60 * 10);
run_delay = run_delay_base;
idle_delay_base = random_range(60 * 0, 60 * 5);
idle_delay = idle_delay_base;
running = false;
shoot = 0;
shoot_delay_base = random_range(60 * 1, 60 * 5);
shoot_delay = shoot_delay_base;
idle_delay_base = random_range(60 * 0, 60 * 10);
idle_delay = idle_delay_base;
shooting = false;
charging = false;
fire_direction = 0;

scale = 4;
image_xscale = scale;
image_yscale = scale;

hit_from = 0;
is_hit = false;

player_x = oPlayer.x;

value = 15 * scale;