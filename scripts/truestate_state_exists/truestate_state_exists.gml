/// @description truestate_state_exists
/// @param {string} statename

/// Returns true if the state exists for the calling actor.

return(ds_map_exists(state_map,argument[0]));

/*This is useful in cases where you are using a general state that many actors use, but some actors have
additional states.

For example, pretty much every actor object might have "States.stand" but only playable characters would
have a "state_idle_animation" when they stand around too long.  So you wouldn't want to wait 3 seconds
and then move to the idle state if the actor doesn't have one, so use this to check first.
