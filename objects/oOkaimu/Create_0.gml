// Inherit the parent event
event_inherited();

#region State Machine
//State machine is initialized in the inherited event.
//Define your states for this actor here.
truestate_create_state(EnemyStates.STAND,state_okaimu_stand, "Stand");
truestate_create_state(EnemyStates.IDLE,state_okaimu_idle, "Idle");
truestate_create_state(EnemyStates.APPROACH,state_okaimu_approach, "Approach");
truestate_create_state(EnemyStates.BACK,state_okaimu_back, "Back");
truestate_create_state(EnemyStates.JUMP,state_okaimu_jump, "Jump");
truestate_create_state(EnemyStates.FALL,state_okaimu_fall, "Fall");
truestate_create_state(EnemyStates.LAND,state_okaimu_land, "Land");
truestate_create_state(EnemyStates.ATTACK,state_okaimu_attack, "Attack");
truestate_create_state(EnemyStates.FLEE,state_okaimu_flee, "Flee");
truestate_create_state(EnemyStates.HIT,state_okaimu_hit, "Hit");
truestate_create_state(EnemyStates.DIE,state_okaimu_die, "Die");

//Set your default state. 
//This will be the state your object starts in, as well as the state that is defaulted
//to if you make a mistake and try switching to a state that doesn't exist.
truestate_set_default(EnemyStates.STAND);
#endregion

max_hp = 10;
hp = max_hp;

strength = 2;

walk_speed = 5 * Deviation(.2);
jump_strength = 10;
attack_speed = 20;

face_direction = 1;

idle_time = 500;
attack_time = 120;
attack_windup_time = 30;
land_time = 20;
flee_time = 30;

min_distance = 64;
max_distance = 128;
min_self_distance = 32;

horizontal_speed = 0;
vertical_speed = 0;

sight = false;

target_x = 0;
target_y = 0;

target_side = 0;
target_direction = 0;

has_attacked = false;
has_hit = false;
has_landed = false;
is_hit = false;

hit_direction = 0;

nearest_similar_distance = 0;