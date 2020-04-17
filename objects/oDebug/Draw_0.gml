var vc = view_camera[0];
var offset = 248;

var cx = camera_get_view_x(vc);
var cy = camera_get_view_y(vc);
var cw = camera_get_view_width(vc);

draw_set_colour($FF00CBE5 & $ffffff);
var l521086A9_0=($FF00CBE5 >> 24);
draw_set_alpha(l521086A9_0 / $ff);

draw_text(cx + cw - 256, cy + offset, string("dash_duration: ") + string(oPlayer.dash_duration));