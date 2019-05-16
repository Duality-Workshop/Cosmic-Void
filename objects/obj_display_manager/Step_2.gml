/// @description Insert description here
// You can write your code in this editor
var _vw= g.view_w;
var _vh= g.view_h;
camera_set_view_size(view_camera[0],_vw,_vh);

var _round = _vw/surface_get_width(application_surface);
camera_set_view_pos(view_camera[0],round_n(g.view_x,_round),round_n(g.view_y,_round));