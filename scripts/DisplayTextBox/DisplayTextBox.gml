/// @desc DisplayTextBox(text)
/// @arg text The text to display

var spacer = 10;
var boxHeight = 160;

var w = camera_get_view_width(view_camera[0]);
var h = camera_get_view_height(view_camera[0]);

var text = SplitDialogueString(argument0);


NineSliceBox_stretch(
	sNineCellBox, 
	spacer, 
	h-boxHeight, 
	w-spacer, 
	h-spacer
);

if (global.debug) {
	draw_text(20, 120, w);
	draw_text(20, 150, h);
}

draw_set_font(oGlobalConstants.WEIHOLMIR);
var loop_init = 0;

if (loop_init < array_length_1d(text))
{
	var stringHeight = string_height(text[0]);
	for (var i = loop_init; i < array_length_1d(text); i++)
	{
		draw_text_ext_transformed(spacer*2, h-boxHeight+spacer+(spacer*3*(i+1)), text[i], stringHeight, w - (spacer * 2), 3, 3, image_angle);
	}
	if (keyboard_check_pressed(ord("E")))
	{
		loop_init++;
	}
}