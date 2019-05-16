/// @description Update State
//Why draw_gui_end?  Because it's basically the final event before the next step
//starts.  So this is likely where you want to update your state.
//show_debug_message("actor gui end");
/*if(truestate_draw_gui_end())
{
	ds_list_insert(state_history,0,truestate_get_name(state));	
}
*/