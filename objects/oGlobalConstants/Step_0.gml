if (keyboard_check(vk_anykey)) {
    input_mode = Input.keyboard;
}

if (GamepadAnyButtonCheck()) {
    input_mode = Input.controller;
}