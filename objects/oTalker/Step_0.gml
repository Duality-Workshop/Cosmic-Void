if (place_meeting(x, y, oPlayer)) {
	if (keyboard_check_pressed(ord("E"))) {
		if (myTextBox == noone) {
			myTextBox = instance_create_layer(x,y, "Instances", oTextBox);
			myTextBox.text = myText;
			myTextBox.creator = self;
		}
	}
}