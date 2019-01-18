var spacer = 10;
var boxHeight = 160;

var w = camera_get_view_width(view_camera[0]);
var h = camera_get_view_height(view_camera[0]);

pageText = SplitDialogueString(text);
if (string_char_at(pageText[page], 1) == " ") {
    pageText[page] = string_delete(pageText[page], 1, 1);
}


NineSliceBox_stretch(
	sNineCellBox, 
	spacer, 
	h-boxHeight, 
	w-spacer, 
	h-spacer
);

if (global.debug) {
	draw_text(20, 120, pageText[page]);
}

draw_set_font(oGlobalConstants.WEIHOLMIR);
var textScale = 2;

var stringHeight = string_height(pageText[0]);

if (charCount < string_length(pageText[page])) {
    charCount += textSpeed;
	var currentChar = ord(string_char_at(pageText[page], charCount));
	if ((currentChar >= 65 and currentChar <= 90) or (currentChar >= 97 and currentChar <= 122)) {
	    audio_play_sound(Bop, 10, false);
	}
}
var stringPart = string_copy(pageText[page], 1, charCount);

draw_text_ext_transformed(
	spacer*2, 
	h-boxHeight+spacer*2, 
	stringPart, 
	stringHeight * 2, 
	(w / textScale) - (spacer * 2), 
	textScale, textScale, image_angle
);

/*var loop_init = 0;

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
}*/