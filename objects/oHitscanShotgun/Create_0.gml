event_inherited();

max_dist = 150;
color = c_yellow;
lifetime = 10;

// Custom parameters
nb_projectiles = 5;
projectile_angle = 30;
projectile_spacer = projectile_angle / (nb_projectiles - 1);

angles = array_create(nb_projectiles, 0);
var min_angle = direction - (projectile_angle / 2);
for (var i = 0; i < array_length_1d(angles); i++) {
    angles[i] = min_angle + i * projectile_spacer;
}

dists = array_create(nb_projectiles, 0);
targets = array_create(nb_projectiles, noone);