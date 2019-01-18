shader_set(shAquaWave);
shader_set_uniform_f(shader_wave, Wave(0.0, 1.0, 2.0, 0.0));
draw_self();
shader_reset();