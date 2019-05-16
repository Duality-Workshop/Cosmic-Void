#macro c_view view_camera[0]

camera_set_view_size(c_view, view_width, view_height);


var c_x = clamp(o_x - (view_width / 2), 0, room_width - view_width);
var c_y = clamp(o_y - (view_height / 2), 0, room_height - view_height);
	
var cur_c_x = camera_get_view_x(c_view);
var cur_c_y = camera_get_view_y(c_view);
var c_spd = .1;
	
camera_set_view_pos(
	c_view, 
	lerp(cur_c_x, c_x, c_spd), 
	lerp(cur_c_y, c_y, c_spd)
);