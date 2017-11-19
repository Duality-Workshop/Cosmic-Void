if (!instance_exists(oHittable)) {
	if (!ended) {
		oGlobalStats.global_score += oGlobalStats.global_timer;
		ended = true;
	}
	
	with (oTransition) {
		mode = TRANSITION_MODE.GOTO;
		target = roomScore;
	}
}