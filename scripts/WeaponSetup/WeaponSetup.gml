global.weapon_dictionary = ds_map_create();

// AddWeapon(WeaponType.UNARMED, noone, 0, 0, 1, noone, -10, -1, -1, -1, false, Rank.D);
AddWeapon(WeaponType.PISTOL, sPistolKinetic, 0, 0, 1, oHitscan, 0, 16, 20, 1, false, Rank.C, "Military Pistols");
AddWeapon(WeaponType.RIFLE, sRifleMilitary, .7, 0, .5, oHitscanRifle, 0, 8, 10, 0, true, Rank.C, "Military Rifle");
AddWeapon(WeaponType.SNIPER, sSniperMarksman, 1.5, 0, 1, oHitscanSniper, 0, 8, 60, 0, true, Rank.B, "Marksman's Rifle");
AddWeapon(WeaponType.SHOTGUN, sShotgunRustic, 2, 0, 1, oHitscanShotgun, 0, 8, 15, 0, false, Rank.C, "Rustic Shotgun");
AddWeapon(WeaponType.SWORD, sSwordMachete, 0, 0, 1, noone, 0, 0, 1, 1, false, Rank.C, "Machete");
