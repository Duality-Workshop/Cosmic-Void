// @desc Returns a string of the list's value, separated by commas by default
// @arg id The list's id
// @arg {string} del the separating string

var list = argument0;
var del = argument_count == 1 ? ", " : argument[1];

var str = "";

for (var i = 0; i < ds_list_size(list); ++i) {
    str += string(list[| i]);
	if (i < ds_list_size(list) - 1) {
	    str += del;
	}
}

return str;