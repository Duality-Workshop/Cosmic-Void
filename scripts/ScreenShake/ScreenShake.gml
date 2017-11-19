/// @desc ScreenShake(magnitude, frames)
/// @arg Magnitude Sets the strength of the shake (radius from origin in pixels)
/// @arg Frames, Sets the length of the shake in frames

with (oCamera) {
	if (argument0 > shake_remain) {
	    shake_magnitude = argument0;
		shake_remain = shake_magnitude;
		shake_length = argument1;
	}
}