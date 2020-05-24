//STEP---------------------------------------
if(argument0==step)
{
	//This code will be executed during the step event.

	//ap_move_player(1,0,1);
	
	var up_strike = up[held];
	var down_strike = down[held];
	var forward_strike = face_direction == 1 ? right[held] : left[held];
	var backward_strike = face_direction == -1 ? right[held] : left[held]; // -1 for left
	var on_ground = place_meeting(x, y+1, _solid_parent);
	strike_previous_state = strike_state;
	
	// This could be overly simplified with structures. Each strike could be an instance of a common struct.
	
	if(state_new)
	{
		// Determining the first strike of the combo
		if (up_strike) { // up takes priority
			if (on_ground) { // is on the ground?
				strike_state = StrikeSubState.LAND_UP;
			} else {
				strike_state = StrikeSubState.AIR_UP;
			}
		}
		else if (down_strike) {
			if (on_ground) {
				strike_state = StrikeSubState.LAND_DOWN;
			} else {
				strike_state = StrikeSubState.AIR_DOWN;
			}
		} else if(forward_strike) {
			if (on_ground) {
				strike_state = StrikeSubState.LAND_FORWARD_1;
			} else {
				strike_state = StrikeSubState.AIR_FORWARD;
			}
		} else { // neutral
			if (on_ground) {
				strike_state = StrikeSubState.LAND_NEUTRAL_1;
				strike_sprite = sFeryuuStrikeGroundNeutral1;
				strike_mask = sFeryuuStrikeGroundNeutral1HurtBox;
			} else {
				strike_state = StrikeSubState.AIR_NEUTRAL;
			}
		}
		
		next_strike_state = StrikeSubState.NONE;
		
		ds_list_clear(targets_hit_by_strike);
	}
	
	#region // Hit detection and processing
	mask_index = strike_mask;
	var current_hits = ds_list_create();
	var hits = instance_place_list(x, y, _enemy, current_hits, false);
	
	if (hits > 0) {
	    for (var i = 0; i < hits; ++i) {
		    var hit_id = current_hits[| i];
			
			// Is it a new hit?
			if (ds_list_find_index(targets_hit_by_strike, hit_id) == -1) { 
			    ds_list_add(targets_hit_by_strike, hit_id);
				/* HIT RESOLUTION */
				show_debug_message("HIT");
			}
		}
	}
	
	ds_list_destroy(current_hits);
	mask_index = strike_sprite;
	#endregion
	
	// Next hit is based on last input read before strike timeout
	if (strike[pressed]) {
		#region //big switch
	
		switch (strike_state) {
		    case StrikeSubState.LAND_NEUTRAL_1:
				/*
					PROCESS STRIKE HERE
				*/
				combo_index = 0;
			
				// Next strike
				if (up_strike) {
				    next_strike_state = StrikeSubState.LAND_UP;
				}
				else if (backward_strike) {
				    next_strike_state = StrikeSubState.LAND_BACK;
				}
				else if (forward_strike) {
				    next_strike_state = StrikeSubState.LAND_FORWARD_2;
				}
				else { // neutral
				    next_strike_state = StrikeSubState.LAND_NEUTRAL_2;
					next_strike_sprite = sFeryuuStrikeGroundNeutral2;
					next_strike_mask = sFeryuuStrikeGroundNeutral2HurtBox;
				}
				break;
			
			case StrikeSubState.LAND_NEUTRAL_2:
				/*
					PROCESS STRIKE HERE
				*/
				combo_index = 1;
			
				// Next strike
				if (up_strike) {
				    next_strike_state = StrikeSubState.LAND_UP;
				}
				else if (backward_strike) {
				    next_strike_state = StrikeSubState.LAND_BACK;
				}
				else if (forward_strike) {
				    next_strike_state = StrikeSubState.LAND_FORWARD_3;
				}
				else { // neutral
				    next_strike_state = StrikeSubState.LAND_NEUTRAL_3;
					next_strike_sprite = sFeryuuStrikeGroundNeutral3;
					next_strike_mask = sFeryuuStrikeGroundNeutral3HurtBox;
				}
				break;
			
			case StrikeSubState.LAND_NEUTRAL_3:
				/*
					PROCESS STRIKE HERE
				*/
				combo_index = 2;
			
				// Next strike
				if (up_strike) {
				    next_strike_state = StrikeSubState.LAND_UP;
				}
				else if (backward_strike) {
				    next_strike_state = StrikeSubState.LAND_BACK;
				}
				else if (forward_strike) {
				    next_strike_state = StrikeSubState.LAND_FORWARD_FINAL;
				}
				else { // neutral
				    next_strike_state = StrikeSubState.LAND_NEUTRAL_1;
					next_strike_sprite = sFeryuuStrikeGroundNeutral1;
					next_strike_mask = sFeryuuStrikeGroundNeutral1HurtBox;
				}
				break;
			
			case StrikeSubState.LAND_FORWARD_1:
				/*
					PROCESS STRIKE HERE
				*/
			
				// Next strike
				if (up_strike) {
				    next_strike_state = StrikeSubState.LAND_UP;
				}
				else if (backward_strike) {
				    next_strike_state = StrikeSubState.LAND_BACK;
				}
				else if (forward_strike) {
				    next_strike_state = StrikeSubState.LAND_FORWARD_2;
				}
				else { // neutral
				    next_strike_state = StrikeSubState.LAND_NEUTRAL_2;
				}
				break;
			
			case StrikeSubState.LAND_FORWARD_2:
				/*
					PROCESS STRIKE HERE
				*/
			
				// Next strike
				if (up_strike) {
				    next_strike_state = StrikeSubState.LAND_UP;
				}
				else if (backward_strike) {
				    next_strike_state = StrikeSubState.LAND_BACK;
				}
				else if (forward_strike) {
				    next_strike_state = StrikeSubState.LAND_FORWARD_3;
				}
				else { // neutral
				    next_strike_state = StrikeSubState.LAND_NEUTRAL_3;
				}
				break;
			
			case StrikeSubState.LAND_FORWARD_3:
				/*
					PROCESS STRIKE HERE
				*/
			
				// Next strike
				if (up_strike) {
				    next_strike_state = StrikeSubState.LAND_UP;
				}
				else if (backward_strike) {
				    next_strike_state = StrikeSubState.LAND_BACK;
				}
				else if (forward_strike) {
				    next_strike_state = StrikeSubState.LAND_FORWARD_FINAL;
				}
				else { // neutral
				    next_strike_state = StrikeSubState.LAND_NEUTRAL_3;
				}
				break;
			
			case StrikeSubState.LAND_FORWARD_FINAL:
				/*
					PROCESS STRIKE HERE
				*/
			
				// No next strike, it's a finisher
				//finisher_strike = true;
			
				break;
			
		    default:
		        // code here
		        break;
			
			case StrikeSubState.LAND_DOWN:
				/*
					PROCESS STRIKE HERE
				*/
			
				// Non-combo strike
				break;
			
			case StrikeSubState.LAND_BACK:
				/*
					PROCESS STRIKE HERE
				*/
			
				// Next strike
				if (up_strike) {
				    next_strike_state = StrikeSubState.LAND_UP;
				}
				else if (backward_strike) {
				    next_strike_state = StrikeSubState.LAND_BACK;
				}
				else if (forward_strike) {
				    next_strike_state = StrikeSubState.LAND_FORWARD_1;
				}
				else { // neutral
				    next_strike_state = StrikeSubState.LAND_NEUTRAL_1;
				}
				break;
			
			case StrikeSubState.LAND_UP:
				/*
					PROCESS STRIKE HERE
				*/
			
				// Next strike
				if (up_strike) {
				    next_strike_state = StrikeSubState.AIR_UP;
				}
				else if (backward_strike) {
				    next_strike_state = StrikeSubState.LAND_BACK;
				}
				else if (forward_strike) {
				    next_strike_state = StrikeSubState.LAND_FORWARD_1;
				}
				else { // neutral
				    next_strike_state = StrikeSubState.LAND_NEUTRAL_1;
				}
				break;
			
			case StrikeSubState.AIR_UP:
				/*
					PROCESS STRIKE HERE (remember to check for ground to know if launch or not)
				*/
			
				// Next strike
				if (down_strike) { // finisher has priority
				    next_strike_state = StrikeSubState.AIR_DOWN;
				}
				else if (forward_strike) {
				    next_strike_state = StrikeSubState.AIR_FORWARD;
				}
				else { // neutral
				    next_strike_state = StrikeSubState.AIR_NEUTRAL;
				}
				break;
			
			case StrikeSubState.AIR_NEUTRAL:
				/*
					PROCESS STRIKE HERE
				*/
			
				// Next strike
				if (down_strike) { // finisher has priority
				    next_strike_state = StrikeSubState.AIR_DOWN;
				}
				else if (forward_strike) {
				    next_strike_state = StrikeSubState.AIR_FORWARD;
				}
				else { // neutral
				    next_strike_state = StrikeSubState.AIR_NEUTRAL;
				}
				break;
			
			case StrikeSubState.AIR_FORWARD:
				/*
					PROCESS STRIKE HERE
				*/
			
				// Next strike
				if (down_strike) { // finisher has priority
				    next_strike_state = StrikeSubState.AIR_DOWN;
				}
				else if (forward_strike) {
				    next_strike_state = StrikeSubState.AIR_FORWARD;
				}
				else { // neutral
				    next_strike_state = StrikeSubState.AIR_NEUTRAL;
				}
				break;
			
			case StrikeSubState.AIR_DOWN:
				/*
					PROCESS STRIKE HERE
				*/
			
				// No next strike; finisher move
				break;
		}
	
		#endregion
	}
	
	
	if (state_timer > strike_timer) {
		if (next_strike_state != strike_state and next_strike_state != StrikeSubState.NONE) {
			// COMBO
			state_timer = 0;
			
			strike_state = next_strike_state;
			next_strike_state = StrikeSubState.NONE;
			
			strike_sprite = next_strike_sprite;
			next_strike_sprite = noone;
		} else {
			// EXIT
		    truestate_switch_previous();
		}
	}
	
	// HIT
	// DIE
	// RC
}
//DRAW---------------------------------------
else if(argument0==draw)
{
	//And this code will be executed during the draw event.
	sprite_index = strike_sprite;
	if (state_timer == 0) {
	    image_speed = 1;
		image_index = 0;
	}
}