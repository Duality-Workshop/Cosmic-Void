// @desc IsBetween(value, min, max)
// @arg value Value to test
// @arg min Lower bound
// @arg max Higher bound

var value = argument0;
var min_value = argument1;
var max_value = argument2;

// Properly re-assign bounds in case of mixup
if (min_value > max_value) {
	min_value = argument2;
	max_value = argument1;
}

return value > min_value and value < max_value;