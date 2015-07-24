/***********************************************************************
	Szablony wyposażenia dla jednostek

	Opis wartosci:
	headgear -
	vest -
	backpack -
	goggles -
	primaryWeapon -
	primaryWeaponItems -
	handgun -
	handgunItems -
	secondaryWeapon -
	secondaryWeaponItems -
	clearUniform -
	clearVest -
	clearBackpack -

	class uniformItems -
	class vestItems  -
	class backpackItems -

	radios -

************************************************************************/

class gearTemplates {
	class przykladowy_sprzet_strzelca {
		headgear = "H_HelmetB_plain_blk";
		vest = "V_PlateCarrier1_rgr";
		backpack = "";
		goggles = "G_Tactical_Clear";
		primaryWeapon = "arifle_MXC_Black_F";
		primaryWeaponItems[] = {"optic_Holosight"};
		handgun = "hgun_P07_F";
		handgunItems[] = {};
		secondaryWeapon = "";
		secondaryWeaponItems[] = {};
		clearUniform = 1;
		clearVest = 1;
		clearBackpack = 1;
		class uniformItems {
			ITEM(ItemMap,1);
			ITEM(ItemCompass,1);
			ITEM(ItemWatch,1);
			ITEM(Binocular,1);
			ITEM(16Rnd_9x21_Mag,2);
		};
		class vestItems {
			ITEM(30Rnd_65x39_caseless_mag,6);
			ITEM(SmokeShell,1);
			ITEM(HandGrenade,2);
		};
		class backpackItems {
		};
		radios[] = {"tf_anprc152"};
	};

	class przykladowy_sprzet_strzelca_at {
		headgear = "H_HelmetB_plain_blk";
		vest = "V_PlateCarrier1_rgr";
		backpack = "B_AssaultPack_rgr";
		goggles = "G_Tactical_Clear";
		primaryWeapon = "arifle_MXC_Black_F";
		primaryWeaponItems[] = {"optic_Holosight"};
		handgun = "hgun_P07_F";
		handgunItems[] = {};
		secondaryWeapon = "launch_NLAW_F";
		secondaryWeaponItems[] = {};
		clearUniform = 1;
		clearVest = 1;
		clearBackpack = 1;
		class uniformItems {
			ITEM(ItemMap,1);
			ITEM(ItemCompass,1);
			ITEM(ItemWatch,1);
			ITEM(Binocular,1);
			ITEM(16Rnd_9x21_Mag,2);
		};
		class vestItems {
			ITEM(30Rnd_65x39_caseless_mag,6);
			ITEM(SmokeShell,1);
			ITEM(HandGrenade,2);
		};
		class backpackItems {
			ITEM(NLAW_F,2);
		};
		radios[] = {"tf_anprc152"};
	};
};