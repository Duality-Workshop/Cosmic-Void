/// @description Insert description here
// You can write your code in this editor

if (global.debug) {
    draw_text(200, 200, ds_list_size(attack_list));
	draw_text(200, 230, ds_list_tostring(attack_list));
	
    draw_text(400, 200, ds_list_size(sight_list));
	draw_text(400, 230, ds_list_tostring(sight_list));
}
