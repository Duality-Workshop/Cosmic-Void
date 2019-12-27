player = obj_ap_feryuu;

enum Weapon {
    UNARMED,
	PISTOL,
	RIFLE,
	SNIPER,
	SHOTGUN,
	SWORD
}

enum Rank { D, C, B, A, S}

// Setting up weapon stats
WeaponSetup();

weapon = Weapon.SNIPER;
ammo[array_length_1d(weapons) - 1] = 0;
ammo[Weapon.UNARMED] = noone;
ammo[Weapon.SWORD] = noone;

// Create local array
ChangeWeapon(weapon);

current_cd = 0;
current_delay = -1;
current_recoil = 0;