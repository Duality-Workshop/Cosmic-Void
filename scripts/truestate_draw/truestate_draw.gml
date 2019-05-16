/// @description truestate_draw

/// Call this in the draw event of your object.

if(script_exists(state_script))
  script_execute(state_script,draw)
else
  truestate_switch(state_default);