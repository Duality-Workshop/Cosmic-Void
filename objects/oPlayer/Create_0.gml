horizontal_speed = 0;
vertical_speed = 0;
object_gravity = .3;
walk_speed = 4;

controller = 0;

has_control = true;
is_running = false;
is_striking = false;

max_hp = oPlayerStats.max_hp;
hp = oPlayerStats.hp;

invicibility_frames_base = 60;
invicibility_frames = 0;

blink_delay = invicibility_frames_base * .5;
blink_speed = 4; // in frames
is_blinking = false;

strike_delay_base = 30;
strike_delay = strike_delay_base;

dust_delay_base = 6;
dust_delay = dust_delay_base;

knockback = false;
knockback_factor = 1;

hit = false;
hit_from = 0;

dead = false;

vc = view_camera[0];
camera_width = camera_get_view_width(vc);
camera_height = camera_get_view_height(vc);
camera_width_spacer = camera_width * .2;
