/// @description truestate_step

/// Call this in the step event of your object.

if(script_exists(state_script))
  script_execute(state_script,step)
else
  truestate_switch(state_default);