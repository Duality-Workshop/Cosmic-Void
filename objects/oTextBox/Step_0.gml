if (oPlayer.key_action) {
	if (charCount < string_length(pageText[page])) {
		charCount = string_length(pageText[page]);
	}
	else if (page + 1 < array_length_1d(pageText)) {
	{
		page++;
		charCount = 0;
	}
	} else {
		creator.alarm[1] = 1;
		instance_destroy();
	}
}