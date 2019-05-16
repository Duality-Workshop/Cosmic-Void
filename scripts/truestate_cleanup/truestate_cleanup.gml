/// @description truestate_cleanup

/// Put in the cleanup event of the object.
/// Cleans up all related data structures.

ds_map_destroy(state_map);
ds_map_destroy(state_names);
ds_stack_destroy(state_stack);
ds_queue_destroy(state_queue);
