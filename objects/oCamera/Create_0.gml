/// @description Set up camera
cam = view_camera[0];
follow = oPlayer;
view_w_half = camera_get_view_width(cam) * .5;
view_h_half = camera_get_view_height(cam) * .5;
x_to = xstart;
y_to = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = shake_magnitude;
shake_buffer = 32;