/// @description State step
if(script_exists(ai_script))
	script_execute(ai_script);
else
	read_controls();

//You can do other things in your step event if you 
//want, but you sorta need this:
truestate_step();
x += keyboard_check_pressed(vk_right) - keyboard_check_pressed(vk_left);
y += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);