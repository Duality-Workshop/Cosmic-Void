/// @function AddWeapon(weapon_type, sprite, recoil, recoil_push, damage, projectile, startup, length, cooldown, bulletspeed, automatic, rank)
/// @description Adds a weapon to the dictionary
/// @param {enum} weapon_type
/// @param {number} sprite
/// @param {number} recoil
/// @param {number} recoil_push
/// @param {number} damage
/// @param {number} projectile
/// @param {number} startup
/// @param {number} length
/// @param {number} cooldown
/// @param {number} bulletspeed
/// @param {bool} automatic
/// @param {enum} rank
/// @param {string} name

var weapon_name = argument12;

ds_map_add_map(global.weapon_dictionary, weapon_name, ds_map_create());

ds_map_add(global.weapon_dictionary[? weapon_name], "type", argument0);
ds_map_add(global.weapon_dictionary[? weapon_name], "sprite", argument1);
ds_map_add(global.weapon_dictionary[? weapon_name], "recoil", argument2);
ds_map_add(global.weapon_dictionary[? weapon_name], "recoil_push", argument3);
ds_map_add(global.weapon_dictionary[? weapon_name], "damage", argument4);
ds_map_add(global.weapon_dictionary[? weapon_name], "projectile", argument5);
ds_map_add(global.weapon_dictionary[? weapon_name], "startup", argument6);
ds_map_add(global.weapon_dictionary[? weapon_name], "length", argument7);
ds_map_add(global.weapon_dictionary[? weapon_name], "cooldown", argument8);
ds_map_add(global.weapon_dictionary[? weapon_name], "bulletspeed", argument9);
ds_map_add(global.weapon_dictionary[? weapon_name], "automatic", argument10);
ds_map_add(global.weapon_dictionary[? weapon_name], "rank", argument11);
ds_map_add(global.weapon_dictionary[? weapon_name], "name", argument12);