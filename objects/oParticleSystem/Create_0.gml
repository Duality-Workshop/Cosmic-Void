//Generated for GMS2 in Geon FX v0.9.0
//Put this code in Create event

//Creating Particle System
global.ps = part_system_create();
part_system_depth(global.ps, -1);

//Creating Particle Types
//dash_thruster
global.pt_dash_thruster = part_type_create();
part_type_shape(global.pt_dash_thruster, pt_shape_flare);
part_type_sprite(global.pt_dash_thruster, spr_pt_shape_flare, 0, 0, 0);
part_type_size(global.pt_dash_thruster, 1, 2, 0, 2);
part_type_scale(global.pt_dash_thruster, 0.10, 0.10);
part_type_orientation(global.pt_dash_thruster, 0, 0, 0, 0, 1);
part_type_color3(global.pt_dash_thruster, 16777139, 16776960, 16711680);
part_type_alpha3(global.pt_dash_thruster, 1, 1, 0.69);
part_type_blend(global.pt_dash_thruster, 1);
part_type_life(global.pt_dash_thruster, 3, 7);
part_type_speed(global.pt_dash_thruster, 10, 15, 0, 0);
part_type_direction(global.pt_dash_thruster, -15, 15, 0, 0);
part_type_gravity(global.pt_dash_thruster, 0.50, 270);