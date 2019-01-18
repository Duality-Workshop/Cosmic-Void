var vc = view_camera[0];

var cx = camera_get_view_x(vc);
var cy = camera_get_view_y(vc);
var cw = camera_get_view_width(vc);

draw_set_colour($FF00CBE5 & $ffffff);
var l521086A9_0=($FF00CBE5 >> 24);
draw_set_alpha(l521086A9_0 / $ff);

draw_set_font(oGlobalConstants.WEIHOLMIR_XL);
var scale = 2;

if(!(room == roomScore))
{
	draw_text_transformed(cx + cw - 256, cy + 48, string("TIME: ") + string(oGlobalStats.global_timer / 60), scale, scale, image_angle);

	draw_text_transformed(cx + cw - 256, cy + 72, string("SCORE: ") + string(oGlobalStats.global_score), scale, scale, image_angle);
}

else
{
	draw_text(cx + cw /2 - 256, cy + 256, string("SCORE: ") + string(oGlobalStats.global_score));
}