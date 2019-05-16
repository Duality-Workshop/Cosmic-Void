/// @description Switch Rooms
with(instance_create_depth(0,0,-5000,obj_transition_manager))
{
	target_room=room == rm_action_platform_demo ? rm_top_down_demo : rm_action_platform_demo;	
}
