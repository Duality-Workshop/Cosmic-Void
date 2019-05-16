for ( var i = gp_face1; i < gp_axisrv; i++ ) {
    if ( gamepad_button_check( 0, i ) ) return i;
}
if (abs(gamepad_axis_value(0, gp_axislh))) {
    return gp_axislh;
}
if (abs(gamepad_axis_value(0, gp_axislv))) {
    return gp_axislv;
}
if (abs(gamepad_axis_value(0, gp_axisrh))) {
    return gp_axisrh;
}
if (abs(gamepad_axis_value(0, gp_axisrv))) {
    return gp_axisrv;
}

return false;