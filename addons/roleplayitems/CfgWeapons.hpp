class CfgWeapons {
    class CBA_MiscItem;
    class CBA_MiscItem_ItemInfo;

    class A4ES_RPItems_Core: CBA_MiscItem {
		scope = 0;
        author = "Krzyciu";
		descriptionShort = CSTRING(generalItem_descriptionShort);
		A4ES_isRPItem = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
	};

	class A4ES_RPItems_antibiotics: A4ES_RPItems_Core {
		scope = 2;
		model = "\A3\structures_f_epa\Items\Medical\Antibiotic_F.p3d";
		picture= QPATHTOF(data\antibiotics_ca.paa);
        displayName = CSTRING(antibioticsItem_displayName);
	};

    class A4ES_RPItems_gasCanister: A4ES_RPItems_Core {
		scope = 2;
		model = "\A3\Structures_F\Items\Vessels\CanisterFuel_F.p3d";
		picture= QPATHTOF(data\gasCanister_ca.paa);
        displayName = CSTRING(gasCanisterItem_displayName);
		descriptionShort = CSTRING(gasCanisterItem_descriptionShort);

		class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
	};

    class A4ES_RPItems_matches: A4ES_RPItems_Core {
		scope = 2;
		model = "\A3\structures_f_epa\Items\Tools\Matches_F.p3d";
		picture= QPATHTOF(data\matches_ca.paa);
        displayName = CSTRING(matchesItem_displayName);
	};

	class A4ES_RPItems_keys: A4ES_RPItems_Core {
		scope = 2;
		model = "a3\props_f_oldman\items\Key_01_F.p3d";
		picture= QPATHTOF(data\key_ca.paa);
        displayName = CSTRING(keyItem_displayName);
	};

	class A4ES_RPItems_phone: A4ES_RPItems_Core {
		scope = 2;
		model = "a3\structures_f\items\electronics\mobilephone_smart_f.p3d";
		picture= QPATHTOF(data\phone_ca.paa);
        displayName = CSTRING(phoneItem_displayName);
	};

	class A4ES_RPItems_knife: A4ES_RPItems_Core {
		scope = 2;
		model = "a3\structures_f\items\tools\file_f.p3d";
		picture= QPATHTOF(data\knife_ca.paa);
        displayName = CSTRING(knifeItem_displayName);
	};

	class A4ES_RPItems_vodka: A4ES_RPItems_Core {
		scope = 2;
		model = "a3\structures_f\items\food\bottleplastic_v1_f.p3d";
		picture= QPATHTOF(data\vodka_ca.paa);
        displayName = CSTRING(vodkaItem_displayName);
	};

	class A4ES_RPItems_money: A4ES_RPItems_Core {
		scope = 2;
		model = "a3\props_f_oldman\items\MoneyBills_01_roll_F.p3d";
		picture= QPATHTOF(data\money_ca.paa);
        displayName = CSTRING(moneyItem_displayName);
	};

	class A4ES_RPItems_USB: A4ES_RPItems_Core {
		scope = 2;
		model = "a3\props_f_oldman\items\USB_Dongle_01_F.p3d";
		picture= QPATHTOF(data\usb_ca.paa);
        displayName = CSTRING(usbItem_displayName);
	};

	class A4ES_RPItems_milID: A4ES_RPItems_Core {
		scope = 2;
		model = "a3\props_f_oldman\items\documents\Military_ID_Card_01_F.p3d";
		picture= QPATHTOF(data\milID_ca.paa);
        displayName = CSTRING(milIDItem_displayName);
	};

	class A4ES_RPItems_ID: A4ES_RPItems_Core {
		scope = 2;
		model = "a3\missions_f_oldman\props\Wallet_01_CSAT_F.p3d";
		picture= QPATHTOF(data\id_ca.paa);
        displayName = CSTRING(IDItem_displayName);
	};

	class A4ES_RPItems_passport: A4ES_RPItems_Core {
		scope = 2;
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture= QPATHTOF(data\passport_ca.paa);
        displayName = CSTRING(passportItem_displayName);
	};

	class A4ES_RPItems_drivingLicense: A4ES_RPItems_Core {
		scope = 2;
		model = "a3\missions_f_oldman\props\Wallet_01_CSAT_F.p3d";
		picture= QPATHTOF(data\drivingLicense_ca.paa);
        displayName = CSTRING(drivingLicenseItem_displayName);
	};

	class A4ES_RPItems_gunLicense: A4ES_RPItems_Core {
		scope = 2;
		model = "\A3\Structures_F\Items\Documents\Map_F.p3d";
		picture= QPATHTOF(data\gunLicense_ca.paa);
        displayName = CSTRING(gunLicenseItem_displayName);
	};
	
	class A4ES_RPItems_cigarettes: A4ES_RPItems_Core {
		scope = 2;
		model = "\A3\structures_f_epa\Items\Tools\Matches_F.p3d";
		picture= QPATHTOF(data\cigarettes_ca.paa);
        displayName = CSTRING(cigarettesItem_displayName);
	};

	class A4ES_RPItems_camera: A4ES_RPItems_Core {
		scope = 2;
		model = "a3\structures_f_heli\items\electronics\camera_01_f.p3d";
		picture= QPATHTOF(data\camera_ca.paa);
        displayName = CSTRING(cameraItem_displayName);
	};

	class A4ES_RPItems_policeBadge: A4ES_RPItems_Core {
		scope = 2;
		model = "a3\props_f_oldman\items\documents\Military_ID_Card_01_F.p3d";
		picture= QPATHTOF(data\policeBadge_ca.paa);
        displayName = CSTRING(policeBadgeItem_displayName);
	};

	class A4ES_RPItems_pass: A4ES_RPItems_Core {
		scope = 2;
		model = "\a3\Weapons_F_Orange\Ammo\leaflet_05_f.p3d";
		picture= QPATHTOF(data\pass_ca.paa);
        displayName = CSTRING(passItem_displayName);
	};

	class A4ES_RPItems_alcoholConcession: A4ES_RPItems_Core {
		scope = 2;
		model = "\A3\Structures_F\Items\Documents\File1_F.p3d";
		picture= QPATHTOF(data\alcoholConcession_ca.paa);
        displayName = CSTRING(alcoholConcessionItem_displayName);
	};

	class A4ES_RPItems_narcotics: A4ES_RPItems_Core {
		scope = 2;
		model = "\A3\Structures_F\Items\Luggage\Suitcase_F.p3d";
		picture= QPATHTOF(data\narcotics_ca.paa);
        displayName = CSTRING(narcoticsItem_displayName);
	};
};