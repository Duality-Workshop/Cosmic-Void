/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 2E2446FE
/// @DnDArgument : "var" "room"
/// @DnDArgument : "not" "1"
/// @DnDArgument : "value" "roomScore"
if(!(room == roomScore))
{
	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 31E1A25B
	/// @DnDParent : 2E2446FE
	/// @DnDArgument : "var" "vc"
	/// @DnDArgument : "value" "view_camera[0]"
	var vc = view_camera[0];

	/// @DnDAction : YoYo Games.Common.Temp_Variable
	/// @DnDVersion : 1
	/// @DnDHash : 2C260C8D
	/// @DnDInput : 2
	/// @DnDParent : 2E2446FE
	/// @DnDArgument : "var" "cx"
	/// @DnDArgument : "value" "camera_get_view_x(vc)"
	/// @DnDArgument : "var_1" "cy"
	/// @DnDArgument : "value_1" "camera_get_view_y(vc)"
	var cx = camera_get_view_x(vc);
	var cy = camera_get_view_y(vc);

	/// @DnDAction : YoYo Games.Drawing.Set_Color
	/// @DnDVersion : 1
	/// @DnDHash : 468A9A1D
	/// @DnDParent : 2E2446FE
	draw_set_colour($FFFFFFFF & $ffffff);
	draw_set_alpha(($FFFFFFFF >> 24) / $ff);

	/// @DnDAction : YoYo Games.Drawing.Set_Font
	/// @DnDVersion : 1
	/// @DnDHash : 158CACD7
	/// @DnDParent : 2E2446FE
	draw_set_font(noone);

	/// @DnDAction : YoYo Games.Drawing.Draw_Value
	/// @DnDVersion : 1
	/// @DnDHash : 36DCC2E4
	/// @DnDParent : 2E2446FE
	/// @DnDArgument : "x" "cx + 24"
	/// @DnDArgument : "y" "cy + 24"
	/// @DnDArgument : "caption" ""WASD to move\nSPACEBAR to jump\nLMB to fire\nRMB to strike\nR to restart""
	draw_text(cx + 24, cy + 24, string("WASD to move\nSPACEBAR to jump\nLMB to fire\nRMB to strike\nR to restart") + "");
}