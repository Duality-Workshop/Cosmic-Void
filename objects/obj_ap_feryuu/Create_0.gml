event_inherited();

#region State Machine
//State machine is initialized in the inherited event.
//Define your states for this actor here.
truestate_create_state(States.stand,state_ap_feryuu_stand, "Stand");
truestate_create_state(States.jump,state_ap_feryuu_jump, "Jump");
truestate_create_state(States.dash,state_ap_feryuu_dash, "Dash");
truestate_create_state(States.fall,state_ap_feryuu_fall, "Fall");
//truestate_create_state(States.high_fall,state_ap_feryuu_high_fall, "High Fall");
truestate_create_state(States.land,state_ap_feryuu_land, "Land");
//truestate_create_state(States.crash,state_ap_feryuu_crash, "Crash");
truestate_create_state(States.run,state_ap_feryuu_run, "Run");
//truestate_create_state(States.slide,state_ap_feryuu_slide, "Slide");
//truestate_create_state(States.shoot,state_ap_feryuu_shoot, "Shoot");
//truestate_create_state(States.strike,state_ap_feryuu_strike, "Strike");
truestate_create_state(States.wall_slide,state_ap_feryuu_wall_slide, "Wall Slide");
truestate_create_state(States.wall_jump,state_ap_feryuu_wall_jump, "Wall Jump");
//truestate_create_state(States.ledge_grab,state_ap_feryuu_ledge_grab, "Ledge Grab");
//truestate_create_state(States.hit,state_ap_feryuu_hit, "Hit");
//truestate_create_state(States.die,state_ap_feryuu_die, "Die");
//truestate_create_state(States.hover,state_ap_feryuu_hover, "Hover");
//truestate_create_state(States.rc,state_ap_feryuu_rc, "RC");
truestate_create_state(States.sprint,state_ap_feryuu_sprint, "Sprint");
//truestate_create_state(States.chalk,state_ap_feryuu_chalk, "Chalk");

//Set your default state. 
//This will be the state your object starts in, as well as the state that is defaulted
//to if you make a mistake and try switching to a state that doesn't exist.
truestate_set_default(States.stand);
#endregion

hspd = 0;
prev_hspd = hspd;
next_hspd = hspd;
hspd_target = 0;
vspd = 0;
gravity_inc = .3;
gravity_max = 46;
move_max_speed = 4;

speed_acceleration = 0.3;

grace_frames = 0;

controller = 0;

has_control = true;

is_striking = false;

jump_speed = 5.0;
jump_speed_dec = 1.5;

wall_jump_magnitude_v = -7;
wall_jump_magnitude_h = 7;

let_go_delay = 15;

booster_speed = 1.5;
booster_plus_speed = 1.75;
booster_max_speed = 2;

dash_speed = move_max_speed * booster_speed;
has_dashed = false;

max_hp = oPlayerStats.max_hp;
hp = oPlayerStats.hp;

max_shield = oPlayerStats.max_shield;
shield = oPlayerStats.shield;
shield_regen = oPlayerStats.shield_regen;
shield_regen_delay_base = oPlayerStats.shield_regen_delay;
shield_regen_delay = shield_regen_delay_base;

is_regenerating = false;

_uwave = shader_get_uniform(shAquaWave, "u_wave");


invicibility_frames_base = 60;

blink_delay = invicibility_frames_base * .5;
blink_speed = 4; // in frames
is_blinking = false;


dust_delay_base = 20;

hit = false;
hit_from = 0;

dead = false;
#region Movement Properties

#endregion

face_direction=1; //1 right, -1 left.
against_wall=[0,0,0];
bbox_w = bbox_right + 1 - bbox_left;
bbox_h = bbox_bottom + 1 - bbox_top;

#region // Input processing
	key_left = 0;
	key_right = 0;
	key_space = 0;
	key_dash = 0;
	key_action = false;
#endregion

debug = undefined;
e_step = 0;
e_step_end = 1;
e_draw = 2;
e_draw_gui = 3;
events = [0,0,0,0];

SetupFeryuuParticles();