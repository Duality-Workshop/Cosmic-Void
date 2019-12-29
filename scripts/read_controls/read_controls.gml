var _key = ord("X");
var _button = gp_face3;
attack[pressed] = keyboard_check_pressed(_key) or gamepad_button_check_pressed(0, _button);
attack[released] = keyboard_check_released(_key) or gamepad_button_check_released(0, _button);
if(keyboard_check(_key) or gamepad_button_check(0, _button))
	attack[held]++;
else
	attack[held]=0;

_key = vk_space;
_button = gp_face1;
jump[pressed] = keyboard_check_pressed(_key) or gamepad_button_check_pressed(0, _button);
jump[released] = keyboard_check_released(_key) or gamepad_button_check_released(0, _button);
if(keyboard_check(_key) or gamepad_button_check(0, _button))
	jump[held]++;
else
	jump[held]=0;

_key = vk_lshift;
_button = gp_shoulderlb;
dash[pressed] = keyboard_check_pressed(_key) or gamepad_button_check_pressed(0, _button);
dash[released] = keyboard_check_released(_key) or gamepad_button_check_released(0, _button);
if(keyboard_check(_key) or gamepad_button_check(0, _button))
	dash[held]++;
else
	dash[held]=0;
	
_key = ord("Q");
_button = gp_axislh;
left[pressed] = keyboard_check_pressed(_key) or abs(min(gamepad_axis_value(0, _button), 0));
left[released] = keyboard_check_released(_key) or abs(min(gamepad_axis_value(0, _button), 0));
left[held] = keyboard_check(_key) or abs(min(gamepad_axis_value(0, _button), 0));

_key = ord("D");
_button = gp_axislh;
right[pressed] = keyboard_check_pressed(_key) or max(gamepad_axis_value(0, _button), 0);
right[released] = keyboard_check_released(_key) or max(gamepad_axis_value(0, _button), 0);
right[held] = keyboard_check(_key) or max(gamepad_axis_value(0, _button), 0);

_key = ord("Z");
_button = gp_axislv;
up[pressed] = keyboard_check_pressed(_key) or abs(min(gamepad_axis_value(0, _button), 0));
up[released] = keyboard_check_released(_key) or abs(min(gamepad_axis_value(0, _button), 0));
up[held] = keyboard_check(_key) or abs(min(gamepad_axis_value(0, _button), 0));

_key = ord("S");
_button = gp_axislv;
down[pressed] = keyboard_check_pressed(_key) or max(gamepad_axis_value(0, _button), 0);
down[released] = keyboard_check_released(_key) or max(gamepad_axis_value(0, _button), 0);
down[held] = keyboard_check(_key) or max(gamepad_axis_value(0, _button), 0);

var _h = right[held]-left[held];
var _v = down[held]-up[held];
if(point_distance(0,0,_h,_v) > 0)
	dpad_dir=point_direction(0,0,_h,_v);
else
	dpad_dir=no_direction;
	
_key = mb_left;
_button = gp_face1;
confirm[pressed] = mouse_check_button_pressed(_key) or gamepad_button_check_pressed(0, _button);
confirm[released] = mouse_check_button_released(_key) or gamepad_button_check_released(0, _button);
if(mouse_check_button(_key) or gamepad_button_check(0, _button))
	confirm[held]++;
else
	confirm[held]=0;

/*key_left = keyboard_check(vk_left) or keyboard_check(ord("Q")) or keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_space = keyboard_check_direct(vk_space);
key_space_press = keyboard_check_pressed(vk_space);
key_dash = keyboard_check(vk_lshift);
key_action = keyboard_check_pressed(ord("E"));*/