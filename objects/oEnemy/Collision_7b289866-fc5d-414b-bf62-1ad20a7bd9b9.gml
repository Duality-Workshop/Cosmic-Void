with (other) {
	if(invicibility_frames == 0 and has_control)
	{
		invicibility_frames = invicibility_frames_base;
		hp += -1;
		hit_from = point_direction(other.x, other.y, x, y);
		knockback = true;
		hit = true;
	}
}