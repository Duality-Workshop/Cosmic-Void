w = camera_get_view_width(view_camera[0]);
var gui_h = 100;

NineSliceBox_stretch(
	sNineCellBox, 
	0, 
	0, 
	w, 
	gui_h
);

var spacer = 16;

var icon = sWeaponIcon;
var icon_offset = (gui_h - sprite_get_height(icon)) / 2;
draw_sprite(icon, 0, icon_offset, icon_offset);


DrawHealthBar(icon_offset + sprite_get_width(icon) + spacer, icon_offset);
DrawShieldBar(icon_offset + sprite_get_width(icon) + spacer, icon_offset * 3, icon_offset + sprite_get_width(icon) + spacer + 300, icon_offset * 4)

draw_text(icon_offset + sprite_get_width(icon) + spacer + 250, spacer, room_get_name(room));