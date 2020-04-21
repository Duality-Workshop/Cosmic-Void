/// @func CycleWeapon(forward)
/// @desc It cycles the hels weapon
/// @arg {bool} forward The cycle is forward

var dir;
if (argument0) {
    dir = 1;
} else {
	dir = -1;
}

var weapon_list = ds_list_create();

AddWeaponToList(weapon_list, WeaponType.PISTOL);	// Ideally, should be replaced with a foreach loop system
AddWeaponToList(weapon_list, WeaponType.RIFLE);
AddWeaponToList(weapon_list, WeaponType.SHOTGUN);
AddWeaponToList(weapon_list, WeaponType.SNIPER);
AddWeaponToList(weapon_list, WeaponType.SWORD);	// The sword shouldn't be counted as it's the melee weapon

var weapon_id = ds_list_find_index(weapon_list, equipped_weapon);
var size = ds_list_size(weapon_list);

var new_weapon_id = (weapon_id + dir) mod size;
if (new_weapon_id < 0) {
    new_weapon_id = size - 1;
}

var new_weapon_type = (ds_list_find_value(weapon_list, new_weapon_id));
var new_weapon = ds_map_create();
ds_map_copy(new_weapon, oPlayerStats.inventory_weapons[? new_weapon_type]);

ChangeWeapon(new_weapon[? "name"]);

ds_list_destroy(weapon_list);