/// @description truestate_draw_current
/// @arg {real} x
/// @arg {real} y

/// Useful debug script that draws the current state name to the screen 
/// as well as the current state timer value.

var _str = state_names[? state] + " ("+string(state_timer)+")";
draw_text(argument0,argument1,_str);