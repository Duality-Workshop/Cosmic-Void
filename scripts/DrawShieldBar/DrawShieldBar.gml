/// @desc DrawShieldBar(x1, y1, x2, y2)
/// @arg x1 x position of bar (start)
/// @arg y1 y position of bar (start)
/// @arg x2 x position of bar (end)
/// @arg y2 y position of bar (end)

var x1 = argument0;
var y1 = argument1;
var x2 = argument2;
var y2 = argument3;

draw_rectangle_color(x1, y1, x2, y2, c_black, c_black, c_black, c_black, false);
draw_rectangle_color(x1, y1, x2, y2, c_blue, c_aqua, c_blue, c_aqua, true);

var shield_percent = oPlayerStats.shield / oPlayerStats.max_shield;

draw_rectangle_color(x1+1, y1+1, x1 + (shield_percent * (x2-x1)) - 1,  y2-1, c_aqua, c_aqua, c_blue, c_blue, false);
