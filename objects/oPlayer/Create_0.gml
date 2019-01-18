horizontal_speed = 0;
vertical_speed = 0;
object_gravity = .3;
walk_speed = 4;

speed_acceleration = 0.3;
stop_acceleration_ground = 0.2;
stop_acceleration_air = 0.08;

controller = 0;

has_control = true;
is_running = false;
is_jumping = false;
is_striking = false;
is_dashing = false;
is_sliding = false;

jump_magnitude = -3;
jump_speed = 1;
jump_speed_max = -7;
jump_duration_max = 15; // in frames
jump_duration = 0;

double_jump_magnitude = -7;
wall_jump_magnitude_v = -5;
wall_jump_magnitude_h = 5;

wall_friction_up = 0.2; // The higher, the more slippery walls will be (kinda)
wall_friction_down = .75; // The higher, the LESS slippery walls will be (kinda)
slide_length = 0;

is_ledge_grab = false;

is_on_ground = false;

has_double_jumped = false;
has_overjumped = false;

has_wall_jumped = false;

dash_delay_base = 30; // in frames. Represents the window for double tapping.
dash_delay = 0;
dash_speed = walk_speed * 2;
dash_duration_base = 5; // in frames
dash_duration = "no";

max_hp = oPlayerStats.max_hp;
hp = oPlayerStats.hp;

max_shield = oPlayerStats.max_shield;
shield = oPlayerStats.shield;
shield_regen = oPlayerStats.shield_regen;
shield_regen_delay_base = oPlayerStats.shield_regen_delay;
shield_regen_delay = shield_regen_delay_base;

is_regen = false;

invicibility_frames_base = 60;
invicibility_frames = 0;

blink_delay = invicibility_frames_base * .5;
blink_speed = 4; // in frames
is_blinking = false;

strike_delay_base = 30;
strike_delay = strike_delay_base;

dust_delay_base = 20;
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

if (global.debug) {
    debug_value = noone;
}

// Shader uniforms
shader_wave = shader_get_uniform(shAquaWave, "u_wave");

// Creating Emitters
// Thrusters
	global.pe_dash_thruster = part_emitter_create(global.ps);

#region // Sliding flakes
	//Creating Particle System
	global.ps = part_system_create();
	part_system_depth(global.ps, -1);

	//Creating Particle Types
	//Slide_flakes
	global.pt_Slide_flakes = part_type_create();
	part_type_shape(global.pt_Slide_flakes, pt_shape_square);
	part_type_sprite(global.pt_Slide_flakes, spr_pt_shape_square_new, 0, 0, 0);
	part_type_size(global.pt_Slide_flakes, 1, 1, 0, 0);
	part_type_scale(global.pt_Slide_flakes, 0.05, 0.05);
	part_type_orientation(global.pt_Slide_flakes, 0, 360, 0, 0, 1);
	part_type_color3(global.pt_Slide_flakes, 16777215, 12632256, 0);
	part_type_alpha3(global.pt_Slide_flakes, 1, 0.52, 0);
	part_type_blend(global.pt_Slide_flakes, 0);
	part_type_life(global.pt_Slide_flakes, 20, 50);
	part_type_speed(global.pt_Slide_flakes, 0, 2, 0, 0);
	part_type_direction(global.pt_Slide_flakes, -43, 59, 0, 0);
	part_type_gravity(global.pt_Slide_flakes, 0.20, 272);

	//Creating Emitters
	global.pe_Slide_flakes = part_emitter_create(global.ps);
#endregion