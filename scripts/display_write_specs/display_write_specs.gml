/// @description display_write_spec(display enum)
/// @param DisplayEnum-screen/window/gui/app_surface/view

enum display{screen, window, gui, app_surface, view};
var str="";
switch(argument[0])
{
  case display.screen:
    str="Display: "+string(display_get_width())+" x "+string(display_get_height())+" ("+string(display_get_width()/display_get_height())+")";
  break;
  case display.window:
    str="Window: "+string(window_get_width())+" x "+string(window_get_height())+" ("+string(window_get_width()/window_get_height())+")";
  break;
  case display.gui:
    str="GUI: "+string(display_get_gui_width())+" x "+string(display_get_gui_height())+" ("+string(display_get_gui_width()/display_get_gui_height())+")";
  break;
  case display.app_surface:
    str="App Surface: "+string(surface_get_width(application_surface))+" x "+string(surface_get_height(application_surface))+" ("+string(surface_get_width(application_surface)/surface_get_height(application_surface))+")";
  break;
  case display.view:
    str="View: "+string(camera_get_view_width(view_camera[0]))+" x "+string(camera_get_view_height(view_camera[0]))+" ("+string(camera_get_view_width(view_camera[0])/camera_get_view_height(view_camera[0]))+")";
 break;
}
return str;


