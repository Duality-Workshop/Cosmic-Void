/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 31E1A25B
/// @DnDArgument : "var" "vc"
/// @DnDArgument : "value" "view_camera[0]"
var vc = view_camera[0];

/// @DnDAction : YoYo Games.Common.Temp_Variable
/// @DnDVersion : 1
/// @DnDHash : 2C260C8D
/// @DnDInput : 3
/// @DnDArgument : "var" "cx"
/// @DnDArgument : "value" "camera_get_view_x(vc)"
/// @DnDArgument : "var_1" "cy"
/// @DnDArgument : "value_1" "camera_get_view_y(vc)"
/// @DnDArgument : "var_2" "cw"
/// @DnDArgument : "value_2" "camera_get_view_width(vc)"
var cx = camera_get_view_x(vc);
var cy = camera_get_view_y(vc);
var cw = camera_get_view_width(vc);

/// @DnDAction : YoYo Games.Drawing.Set_Color
/// @DnDVersion : 1
/// @DnDHash : 521086A9
/// @DnDArgument : "color" "$FF00CBE5"
draw_set_colour($FF00CBE5 & $ffffff);
draw_set_alpha(($FF00CBE5 >> 24) / $ff);

/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 11ECB988
/// @DnDArgument : "var" "room"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "roomScore"
if(!(room == roomScore))
{
	/// @DnDAction : YoYo Games.Drawing.Set_Font
	/// @DnDVersion : 1
	/// @DnDHash : 216BEBAF
	/// @DnDParent : 11ECB988
	/// @DnDArgument : "font" "fScore"
	/// @DnDSaveInfo : "font" "a6d84441-5a99-4f89-b6b7-9d8f7d05b8cb"
	draw_set_font(fScore);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value
	/// @DnDVersion : 1
	/// @DnDHash : 36DCC2E4
	/// @DnDParent : 11ECB988
	/// @DnDArgument : "x" "cx + cw - 256"
	/// @DnDArgument : "y" "cy + 48"
	/// @DnDArgument : "caption" ""TIME: ""
	/// @DnDArgument : "var" "oGlobalStats.global_timer / 60"
	draw_text(cx + cw - 256, cy + 48, string("TIME: ") + string(oGlobalStats.global_timer / 60));

	/// @DnDAction : YoYo Games.Drawing.Draw_Value
	/// @DnDVersion : 1
	/// @DnDHash : 361C0458
	/// @DnDParent : 11ECB988
	/// @DnDArgument : "x" "cx + cw - 256"
	/// @DnDArgument : "y" "cy + 72"
	/// @DnDArgument : "caption" ""SCORE: ""
	/// @DnDArgument : "var" "oGlobalStats.global_score"
	draw_text(cx + cw - 256, cy + 72, string("SCORE: ") + string(oGlobalStats.global_score));
}

/// @DnDAction : YoYo Games.Common.Else
/// @DnDVersion : 1
/// @DnDHash : 06B94444
else
{
	/// @DnDAction : YoYo Games.Drawing.Set_Font
	/// @DnDVersion : 1
	/// @DnDHash : 109942A8
	/// @DnDParent : 06B94444
	/// @DnDArgument : "font" "fFinalScore"
	/// @DnDSaveInfo : "font" "e2a134f7-e835-446a-a98a-2880d5309cba"
	draw_set_font(fFinalScore);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value
	/// @DnDVersion : 1
	/// @DnDHash : 593FD482
	/// @DnDParent : 06B94444
	/// @DnDArgument : "x" "cx + cw /2 - 256"
	/// @DnDArgument : "y" "cy + 256"
	/// @DnDArgument : "caption" ""SCORE: ""
	/// @DnDArgument : "var" "oGlobalStats.global_score"
	draw_text(cx + cw /2 - 256, cy + 256, string("SCORE: ") + string(oGlobalStats.global_score));
}