/// @desc ChangeWeapon(weapon)
/// @arg weapon The weapon to change to. Has to be from the Weapon Enum

var wp_map = global.weapon_dictionary[? argument0];
sprite = wp_map[? "sprite"];
recoil = wp_map[? "recoil"];
recoil_push = wp_map[? "recoil_push"];
damage = wp_map[? "damage"];
projectile = wp_map[? "projectile"];
startup = wp_map[? "startup"];
length = wp_map[? "length"];
cooldown = wp_map[? "cooldown"];
bulletspeed = wp_map[? "bulletspeed"];
automatic = wp_map[? "automatic"];
rank = wp_map[? "rank"];
name = wp_map[? "name"];