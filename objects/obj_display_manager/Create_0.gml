///Display Properties
ideal_width=0;
ideal_height=270;

display_width=display_get_width();
display_height=display_get_height();
aspect_ratio=display_width/display_height;
ideal_width=round_n(ideal_height*aspect_ratio,2);


//Calculate Max Zoom
max_zoom=floor(display_width/ideal_width)-1;  
zoom=max_zoom;
res_multiplier=2;
window_set_size(ideal_width*zoom,ideal_height*zoom);
display_set_gui_size(ideal_width*res_multiplier,ideal_height*res_multiplier);
surface_resize(application_surface,ideal_width*res_multiplier,ideal_height*res_multiplier);

alarm[0]=1;

g.view_x = 0;
g.view_y = 0
g.view_w = ideal_width;
g.view_h = ideal_height;


room_goto_next();
