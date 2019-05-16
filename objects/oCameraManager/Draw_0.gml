/// @description Insert description here
// You can write your code in this editor

// offset calculations
if (instance_exists(oCursor)) {
    o_x = obj_ap_feryuu.x + (oCursor.x - obj_ap_feryuu.x) / closeness;
	o_y = obj_ap_feryuu.y + (oCursor.y - obj_ap_feryuu.y) / closeness;
	o_y -= window_get_height() * .1;
}
else {
    o_x = obj_ap_feryuu.x;
	o_y = obj_ap_feryuu.y;
}