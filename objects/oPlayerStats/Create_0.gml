max_hp = 3;
hp = max_hp;

max_shield = 1;
shield = max_shield;

shield_regen = 0.01; // per frame
shield_regen_delay = 250; // in frames

// // Inventory

// Weapons
inventory_weapons = ds_map_create();
inventory_weapons[? WeaponType.PISTOL] = global.weapon_dictionary[? "Military Pistols"];
inventory_weapons[? WeaponType.RIFLE] = global.weapon_dictionary[? "Military Rifle"];
inventory_weapons[? WeaponType.SHOTGUN] = global.weapon_dictionary[? "Rustic Shotgun"];
inventory_weapons[? WeaponType.SNIPER] = noone;
inventory_weapons[? WeaponType.SWORD] = noone;


