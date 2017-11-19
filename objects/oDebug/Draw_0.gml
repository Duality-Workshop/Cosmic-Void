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

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 36DCC2E4
/// @DnDArgument : "x" "cx + cw - 256"
/// @DnDArgument : "y" "cy + 48"
/// @DnDArgument : "caption" ""time: ""
/// @DnDArgument : "var" "oGlobalStats.global_timer"
draw_text(cx + cw - 256, cy + 48, string("time: ") + string(oGlobalStats.global_timer));

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 361C0458
/// @DnDArgument : "x" "cx + cw - 256"
/// @DnDArgument : "y" "cy + 72"
/// @DnDArgument : "caption" ""score: ""
/// @DnDArgument : "var" "oGlobalStats.global_score"
draw_text(cx + cw - 256, cy + 72, string("score: ") + string(oGlobalStats.global_score));

/// @DnDAction : YoYo Games.Drawing.Draw_Value
/// @DnDVersion : 1
/// @DnDHash : 4261CF07
/// @DnDArgument : "x" "cx + cw - 256"
/// @DnDArgument : "y" "cy + 72"
/// @DnDArgument : "caption" ""score: ""
/// @DnDArgument : "var" "oGlobalStats.global_score"
draw_text(cx + cw - 256, cy + 72, string("score: ") + string(oGlobalStats.global_score));