//Creating Particle System
global.ps = part_system_create();
part_system_depth(global.ps, -1);

//Creating Particle Types
//Thruster
global.pt_Thruster = part_type_create();
part_type_shape(global.pt_Thruster, pt_shape_square);
part_type_sprite(global.pt_Thruster, spr_pt_shape_square_new, 0, 0, 0);
part_type_size(global.pt_Thruster, 0.01, 0.10, 0, 0);
part_type_scale(global.pt_Thruster, 1, 1);
part_type_orientation(global.pt_Thruster, 0, 0, 0, 0, 0);
part_type_color3(global.pt_Thruster, 16777215, 16776960, 16744448);
part_type_alpha3(global.pt_Thruster, 1, 1, 1);
part_type_blend(global.pt_Thruster, 0);
part_type_life(global.pt_Thruster, 10, 30);
part_type_speed(global.pt_Thruster, 5, 10, -0.30, 0);
part_type_direction(global.pt_Thruster, -25, 25, 0, 0);
part_type_gravity(global.pt_Thruster, 0.05, 270);

//Creating Emitters
global.pe_Thruster = part_emitter_create(global.ps);