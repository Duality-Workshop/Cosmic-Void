///Zoom window
if(keyboard_check_pressed(vk_f3))
{
  zoom++;
  
  if(zoom>max_zoom)
    zoom=1;
  
  window_set_size(ideal_width*zoom,ideal_height*zoom);
  alarm[0]=1;
}
if(keyboard_check_pressed(vk_f4))
{
	window_set_fullscreen(!window_get_fullscreen());	
}