/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (global.debug) {
    truestate_draw_current(x - 90, y - 90);
	draw_text(x - 90, y - 120, "HP: " + string(hp) + " / " + string(max_hp));

	if (sight) {
	    draw_line_color(x, y-sprite_height/2, obj_ap_feryuu.x, obj_ap_feryuu.y-obj_ap_feryuu.sprite_height/2, c_red, c_red);
	}
	
	if(target_x != 0) {
		draw_circle_color(target_x, target_y, 10, c_orange, c_red, false);
		if (not sight) {
		    draw_line_color(x, y-sprite_height/2, target_x, target_y, c_red, c_yellow);
		}
	}
}