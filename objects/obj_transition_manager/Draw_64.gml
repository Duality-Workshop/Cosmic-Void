/// @description Draw Wipe
timer++;
var _w = display_get_gui_width();
var _h = display_get_gui_height();
if(!surface_exists(surface))
	surface=surface_create(_w,_h);
var _radius=clamp(easy_tween(TweenType.out_cubic,
														 dir == -1 ? max_radius : 0,
														 dir == -1 ? 0 : max_radius,
														 timer/length),
									0,
									max_radius);

surface_set_target(surface);
{
	draw_clear_alpha(0,1);
	draw_set_color(c_white);
	draw_circle(_w/2,_h/2,_radius,false);
} 
surface_reset_target();

gpu_set_blendmode_ext(bm_dest_color, bm_zero);
draw_surface(surface,0,0);
gpu_set_blendmode(bm_normal);


if(timer >= length)
{
	if(dir == -1)
	{
		room_goto(target_room);
		dir = 1;
	}
	else
	{
		surface_free(surface);
		instance_destroy();
	}
}
