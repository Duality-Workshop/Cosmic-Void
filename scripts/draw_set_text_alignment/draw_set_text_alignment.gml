/// @description draw_set_text_alignment(alignment<enum>,color<optional>)
/// @param Text_Enum
/// @param <Color>
enum Text
{
	left_bottom,
	center_bottom,
	right_bottom,
	left_middle,
	center_middle,
	right_middle,
	left_top,
	center_top,
	right_top
}
switch(argument[0])
{
    case 0: draw_set_halign(fa_left);   draw_set_valign(fa_bottom); break;
    case 1: draw_set_halign(fa_center); draw_set_valign(fa_bottom); break;
    case 2: draw_set_halign(fa_right);  draw_set_valign(fa_bottom); break;
    case 3: draw_set_halign(fa_left);   draw_set_valign(fa_middle); break;
    case 4: draw_set_halign(fa_center); draw_set_valign(fa_middle); break;
    case 5: draw_set_halign(fa_right);  draw_set_valign(fa_middle); break;
    case 6: draw_set_halign(fa_left);   draw_set_valign(fa_top); break;
    case 7: draw_set_halign(fa_center); draw_set_valign(fa_top); break;
    case 8: draw_set_halign(fa_right);  draw_set_valign(fa_top); break;


}

if (argument_count==2)
{
    draw_set_color(argument[1]);
}
