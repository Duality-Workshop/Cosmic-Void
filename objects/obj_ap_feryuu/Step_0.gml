event_inherited();
events[e_step] ++;

if (shield_regen_delay > 0) { // regen on cooldown?
    shield_regen_delay--;
} else if (shield < max_shield) {
	is_regenerating = true;
	shield = Approach(shield, max_shield, shield_regen);
} else {
	is_regenerating = false;
}