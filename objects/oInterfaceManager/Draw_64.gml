/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(vk_tab)) {
    current_radius = min(current_radius + circle_radius * 0.1, circle_radius);
	current_darkness = min(current_darkness + max_darkness * 0.1, max_darkness);
	key_released = false;
	global.time_dilation = 0.5;
}

if (keyboard_check_released(vk_tab)) {
	key_released = true;
	global.time_dilation = 1;
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
	
	#region Circle and darkness
	    draw_set_alpha(current_darkness);
		var col = c_black;
		draw_rectangle_color(0, 0, gui_width, gui_height, col, col, col, col, false);
	
		draw_circle(feryuu_x, feryuu_y, current_radius, false);
	
		draw_set_alpha(1);
	#endregion
	
	
	#region Arrow
		var cursor_angle = point_direction(feryuu_x, feryuu_y, window_mouse_get_x(), window_mouse_get_y()); // TODO: Adapt this to gamepad
	
		/*var cursor_end_x = feryuu_x + lengthdir_x(current_radius, cursor_angle);
		var cursor_end_y = feryuu_y + lengthdir_y(current_radius, cursor_angle);*/
	
		draw_sprite_ext(sWeaponwheelArrow, 0, feryuu_x, feryuu_y, 1, 1, cursor_angle, c_white, 1);
	#endregion
	
	
	#region Icons
		var inventory_size = 0;
		for (var k = ds_map_find_first(oPlayerStats.inventory_weapons); !is_undefined(k); k = ds_map_find_next(oPlayerStats.inventory_weapons, k)) {
			var v = oPlayerStats.inventory_weapons[? k];
			if (k != WeaponType.SWORD and v != noone) {
				//show_debug_message("Weapon type: " + string(k) + " (" + v[? "name"] + ")");
			    inventory_size++;
			}
		}
		
		if (oPlayerStats.inventory_weapons[? WeaponType.SWORD] != noone) {
		    inventory_size--;
		}
		var angle = 360 / inventory_size;
		var selected_weapon = noone;
		
		var i = 0;
		for (var k = ds_map_find_first(oPlayerStats.inventory_weapons); !is_undefined(k); k = ds_map_find_next(oPlayerStats.inventory_weapons, k)) {
			var v = oPlayerStats.inventory_weapons[? k];
			if (k != WeaponType.SWORD and v != noone) {
				var icon_angle = angle * i + 90;
				var icon_x = feryuu_x + lengthdir_x(current_radius, icon_angle);
				var icon_y = feryuu_y + lengthdir_y(current_radius, icon_angle);
				
				if (cursor_angle > icon_angle - angle/2 and cursor_angle < icon_angle + angle/2) {
				    draw_sprite_ext(v[? "sprite"], 0, icon_x, icon_y, 1.2, 1.2, 0, c_aqua, 1);
					selected_weapon = v[? "name"];
				}
				
				draw_sprite(v[? "sprite"], 0, icon_x, icon_y);
				
				if (k == oWeapon.equipped_weapon) {
				    draw_sprite(sEquippedIcon, 0, icon_x + sprite_get_width(v[? "sprite"])/2, icon_y + sprite_get_height(v[? "sprite"])/2);
				}
				
				++i;
			}
		}
	#endregion
	
	if(obj_ap_feryuu.confirm[pressed] and selected_weapon != noone) {
		with (oWeapon) {
		    ChangeWeapon(selected_weapon);
		}
	}
}