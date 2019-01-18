with (other) {
	if(invicibility_frames == 0 and has_control)
	{
		invicibility_frames = invicibility_frames_base;
		Damage(self, other.attack);
		hit_from = point_direction(other.x, other.y, x, y);
		knockback = true;
		hit = true;
	}
}