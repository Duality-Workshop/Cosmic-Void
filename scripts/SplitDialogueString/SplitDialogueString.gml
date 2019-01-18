/// @desc SplitDialogueString(text)
/// @arg text The string to split

var text = argument0;

var line_length = 43;
var line_count = 3;

var box_length = line_length * line_count;

var lines = [];
var count = 0;

while (string_length(text) > 0)
{
	if (string_length(text) <= box_length)
	{
		lines[count] = text;
		count++;
		text = "";
	}
	else
	{
		if (string_char_at(text, 1) == " ")
		{
			text = string_delete(text, 1, 1);
		}
		
		var sub_string = string_copy(text, 1, box_length);
		var last_char = string_char_at(sub_string, string_length(sub_string));
		
		// if the split occurs on a word, attempt to split before it
		if (last_char != "." and
			last_char != ";" and
			last_char != " " and
			last_char != "-")
		{
			var found = false;
			for (var i = string_length(sub_string)-1; i > 0 and !found; i--)
			{
				if (string_char_at(sub_string, i) == " ")
				{
					sub_string = string_copy(sub_string, 1, i-1);
					found = true;
				}
			}
		}
		
		lines[count] = sub_string;
		count++;
		text = string_delete(text, 1, string_length(sub_string));
	}
}

return lines;