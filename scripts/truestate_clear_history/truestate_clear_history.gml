/// @description truestate_clear_history

/// Empties the previous state stack to prevent getting to big.
/// Recommended you call it when you are at a "default" state.

ds_stack_clear(state_stack);
ds_stack_push(state_stack,state);
