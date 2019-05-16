/// @description State draw
truestate_draw();
//draw_sprite_ext(mask_index,0,x,y,image_xscale,image_yscale,image_angle,image_blend,.5);

if(truestate_draw_gui_end())
{
	ds_list_insert(state_history,0,truestate_get_name(state));	
}