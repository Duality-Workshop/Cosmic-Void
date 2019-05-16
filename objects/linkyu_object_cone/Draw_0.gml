var value = window_mouse_get_y() / window_get_height();

shader_set(linkyu_shader_cone);
shader_set_uniform_f(u_value, value);
var uv = sprite_get_uvs(sprite_index, image_index);
shader_set_uniform_f(u_uv, uv[0], uv[1], uv[2], uv[3]);
draw_text(10, 10, value);
draw_text(10, 30, uv);


draw_self();
shader_reset();
