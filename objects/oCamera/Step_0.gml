/// @description Update camera

if (instance_exists(follow)) {
	if (follow.y > follow_previous_y) // unless the player is falling
	{
		v_offset = follow.y - follow_previous_y; // in general we want the camera to be centered slightly above the player
	}
	else {
		v_offset = -50; 
	}
	
	x_to = follow.x;
	y_to = follow.y + v_offset;
}

// Update object position
x += (x_to - x) / 25;
y += (y_to - y) / 25;

// Clamp
x = clamp(x, view_w_half + shake_buffer, room_width-view_w_half);
y = clamp(y, view_h_half + shake_buffer, room_height-view_h_half);

// Screen shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

// Update camera position
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

follow_previous_y = follow.y;