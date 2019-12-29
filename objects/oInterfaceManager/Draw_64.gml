/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(vk_tab)) {
    current_radius = min(current_radius + circle_radius * 0.1, circle_radius);
	current_darkness = min(current_darkness + max_darkness * 0.1, max_darkness);
	key_released = false;
}

if (keyboard_check_released(vk_tab)) {
	key_released = true;
}

if (key_released) {
    current_radius = max(current_radius - circle_radius * 0.1, 0);
	current_darkness = max(current_darkness - max_darkness * 0.1, 0);
}

if (!key_released or current_darkness != 0) {
    var gui_width = display_get_gui_width();
	var gui_height = display_get_gui_height();
	var appPos = application_get_position();
	var feryuu_x = appPos[0] + ((obj_ap_feryuu.x - camera_get_view_x(c_view)) / oCameraManager.view_width) * gui_width + view_xport[0]; 
	var feryuu_y = appPos[1] + ((obj_ap_feryuu.y-30 - camera_get_view_y(c_view)) / oCameraManager.view_height) * gui_height + view_yport[0];
	
	draw_set_alpha(current_darkness);
	var col = c_black;
	draw_rectangle_color(0, 0, gui_width, gui_height, col, col, col, col, false);
	
	draw_circle(feryuu_x, feryuu_y, current_radius, false);
	
	draw_set_alpha(1);
}