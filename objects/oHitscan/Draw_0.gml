alpha -= 1 / lifetime;
draw_sprite_ext(sprite_index, 0, x, y, dist / sprite_get_width(sprite_index), 1, direction, c_white, alpha);
if (target != noone and !hit) {
	effect_create_above(ef_firework, x + lengthdir_x(dist, direction), y + lengthdir_y(dist, direction), .1, color);
	hit = true;
}

if (global.debug) {
    draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false);
}