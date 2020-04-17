event_inherited();
events[e_step] ++;

if (shield_regen_delay > 0) {
    shield_regen_delay--;
} else if (shield < max_shield) {
	shield = Approach(shield, max_shield, shield_regen);
}