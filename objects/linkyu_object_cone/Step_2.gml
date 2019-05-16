if (instance_exists(oCameraManager)) {
    x = camera_get_view_x(c_view) + oCameraManager.hexagon_x / 2;
	y = camera_get_view_y(c_view) + oCameraManager.hexagon_y / 2;
}
//show_debug_message([x, y]);