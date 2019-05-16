/// @description Initialize State Machine and misc
event_inherited();

#region State Machine
//Every actor uses the state machine
truestate_system_init();
#endregion

#region movement properties
face_direction=south;
move_speed=1.25;
#endregion

#region Controls
up = [0,0,0];
down = [0,0,0];
left = [0,0,0];
right = [0,0,0];
dpad_dir = no_direction;
attack = [0,0,0];
run= [0,0,0];
jump= [0,0,0];
ai_script=noone;
//ai_vars=[0,AiActions.stand,1,no_direction];
#endregion

state_history = ds_list_create();
ds_list_add(state_history,"Stand");