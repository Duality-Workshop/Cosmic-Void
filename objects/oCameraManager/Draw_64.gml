//var w = camera_get_view_width(c_view);
var w = window_get_width();
//var h = camera_get_view_height(c_view);
//var h = window_get_height();
//draw_text(200, 200, "Zoom: " + string(zoom) + "\nScale: " + string(window_scale));
//draw_rectangle(0, 0, cur_c_w * window_scale-1, cur_c_h * window_scale-1, true);

var col = c_white;
var base_offset = 0.01 * w;
var offset = base_offset
var width = 0.15 * w;
var height = (.20 * w) / 1.681;
var sp_w = sprite_get_width(sprite_hexagon);
var hex_scale = .66;
var sp_scale = (width / sp_w) * hex_scale;

hexagon_x = offset + width / 2;
hexagon_y = (offset + width / 2) * hex_scale;

draw_sprite(sWeaponIcon, 0, hexagon_x, hexagon_y);
//draw_sprite_ext(sprite_hexagon, 0, offset + width / 2, (offset + width / 2) * hex_scale, sp_scale, sp_scale, 90, c_white, 1);
//draw_sprite_stretched(sprite_hexagon, 0, offset, offset, width, height);
//draw_rectangle_color(offset, offset, offset + width, height, col, col, col, col, false);

col = c_black;
offset = offset + width + offset;
width = 0.61 * w;
sp_scale = 2;
sp_w = sprite_get_width(sHealthContainer);

var _w = sp_w * sp_scale;
var _x = offset;
var _spr = sHealthContainer;
for (var i = 0; i < feryuu.max_hp; ++i) {
	_spr = i < feryuu.hp ? sHealthContainer : sHealthContainerEmpty;
    draw_sprite_ext(_spr, 0, _x, base_offset * 2, sp_scale, sp_scale, 0, c_white, 1);
	_x += _w + base_offset;
}

/*while (_x + _w < offset + width) {
    draw_sprite_ext(sHealthContainer, 0, _x, base_offset * 2, sp_scale, sp_scale, 0, c_white, 1);
	_x += _w + base_offset;
}*/

var x1 = offset;
var y1 = (base_offset * 2) + sp_w * sp_scale + base_offset;
var x2 = x1 + width;
var y2 = y1 + base_offset;
draw_rectangle_color(x1, y1, x2, y2, col, col, col, col, false);
col = c_blue;
draw_rectangle_color(x1, y1, x2, y2, col, col, col, col, false);
col = c_white;
draw_rectangle_color(x1, y1, x2, y2, col, col, col, col, true);
//draw_rectangle_color(offset, base_offset, offset + width, height, col, col, col, col, false);

col = c_dkgray;
offset = offset + width + base_offset;
width = 0.20 * w;
draw_rectangle_color(offset, base_offset, offset + width, height, col, col, col, col, false);
col = c_aqua;
draw_rectangle_color(offset, base_offset, offset + width, height, col, col, col, col, true);
