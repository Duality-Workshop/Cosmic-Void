/// @function sprite_is_on_frame(frame)
/// @arg frame
/// @description    sprite_is_on_frame returns true on the first step the desired frame is displayed.
/// Jon didn't make it don't let him take credit.
var _frame = argument0;
return	(image_index - sprite_get_speed(sprite_index) / (sprite_get_speed_type(sprite_index)==spritespeed_framespergameframe ? 1 : room_speed) * image_speed < _frame) && floor(image_index) == _frame;