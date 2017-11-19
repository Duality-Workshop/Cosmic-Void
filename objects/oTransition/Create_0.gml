gui_width = display_get_gui_width();
gui_height = display_get_gui_height();

gui_height_half = gui_height * .5;

enum TRANSITION_MODE {
	OFF,
	NEXT,
	GOTO,
	RESTART,
	INTRO
}

mode = TRANSITION_MODE.INTRO;
percent = 1;
target = room;