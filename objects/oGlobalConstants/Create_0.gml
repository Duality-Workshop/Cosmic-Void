WEIHOLMIR = font_add_sprite(sWeiholmir, ord("!"), true, 0);
WEIHOLMIR_XL = font_add_sprite(sWeiholmirXL, ord("!"), true, 0);
WEIHOLMIR_XL_ITALICS = font_add_sprite(sWeiholmirXLItalics, ord("!"), true, 0);
WEIHOLMIR_MINI = font_add_sprite(sWeiholmirMini, ord("!"), true, 0);

window_set_size(480, 460);

enum Input {
	keyboard = 0,
	controller = 1
	}
input_mode = Input.keyboard;

global.debug = true;