/// @description Update camera

if (instance_exists(follow)) {
		x_to = follow.x;
		y_to = follow.y;
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