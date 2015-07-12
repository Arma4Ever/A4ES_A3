
	class rhs_specnaz_rifleman : rhs_vdv_rifleman
	{
		vehicleClass = "a3c_rhs_vehclass_specnaz";
		uniformClass = "rhs_specnaz_rifleman";
		
		a3cs_nametag_rankname = "Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\sierzant.paa";
		displayName = "Strzelec (Sierzant)";	
		
		backpack ="rhs_assault_umbts_engineer_empty";		
		identityTypes[] = {"LanguageRUS","Head_Euro","Head_Asian","rhs_scarf"};
		
		linkedItems[] = {"LOP_V_6B23_6Sh92_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"LOP_V_6B23_6Sh92_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};		
		weapons[] = {"rhs_weap_ak74m_2mag_camo","Throw","Put"};
		magazines[] = {"rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK"};
		respawnWeapons[] = {"rhs_weap_ak74m_2mag_camo","Throw","Put"};
		respawnMagazines[] = {"rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK"};
		Items[] = {"rhs_acc_dtk4short","rhs_acc_pso1m2"};
		RespawnItems[] = {"rhs_acc_dtk4short","rhs_acc_pso1m2"};
		
		hiddenSelections[] = {"camo1", "camo2", "camob", "insignia"};
		hiddenSelectionsTextures[] = {"A3C_config_rhs\a3c_c_rhs_c_troops\addons\data\specnaz_co.paa", "", ""};	
	};

	class rhs_specnaz_sergeant : rhs_specnaz_rifleman
	{
		a3cs_nametag_rankname = "Podporucznik"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\podporucznik.paa";	
		displayName = "Dowodca (Podporucznik)";		
		
		backpack ="rhs_assault_umbts_engineer_empty";		
		uniformClass = "rhs_specnaz_sergeant";
		identityTypes[] = {"LanguageRUS","Head_Euro","Head_Asian","rhs_scarf"};
		
		linkedItems[] = {"LOP_V_6B23_6Sh92_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"LOP_V_6B23_6Sh92_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};		
		weapons[] = {"rhs_weap_ak74m_2mag_camo","Throw","Put"};
		magazines[] = {"rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK"};
		respawnWeapons[] = {"rhs_weap_ak74m_2mag_camo","Throw","Put"};
		respawnMagazines[] = {"rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK"};
		Items[] = {"rhs_acc_dtk4short","rhs_acc_pso1m2"};
		RespawnItems[] = {"rhs_acc_dtk4short","rhs_acc_pso1m2"};
		
		hiddenSelections[] = {"camo1", "camo2", "camob", "insignia"};
		hiddenSelectionsTextures[] = {"A3C_config_rhs\a3c_c_rhs_c_troops\addons\data\specnaz_co.paa", "", ""};	
	};

	class rhs_specnaz_engineer : rhs_specnaz_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";		
		displayName = "Inzynier (Kapral)";		
		
		backpack ="rhs_assault_umbts_engineer_empty";		
		uniformClass = "rhs_specnaz_engineer";
		identityTypes[] = {"LanguageRUS","Head_Euro","Head_Asian","rhs_scarf"};
		
		linkedItems[] = {"LOP_V_6B23_6Sh92_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"LOP_V_6B23_6Sh92_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};		
		weapons[] = {"rhs_weap_ak74m_2mag_camo","Throw","Put"};
		magazines[] = {"rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK"};
		respawnWeapons[] = {"rhs_weap_ak74m_2mag_camo","Throw","Put"};
		respawnMagazines[] = {"rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK"};
		Items[] = {"rhs_acc_dtk4short","rhs_acc_pso1m2"};
		RespawnItems[] = {"rhs_acc_dtk4short","rhs_acc_pso1m2"};
		
		hiddenSelections[] = {"camo1", "camo2", "camob", "insignia"};
		hiddenSelectionsTextures[] = {"A3C_config_rhs\a3c_c_rhs_c_troops\addons\data\specnaz_co.paa", "", ""};	
	};

	class rhs_specnaz_marksman : rhs_specnaz_rifleman
	{
		a3cs_nametag_rankname = "Mlodszy sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\ml_sierzant.paa";		
		displayName = "Strzelec Wyborowy (Mlodszy sierzant)";		
		
		backpack ="rhs_assault_umbts_engineer_empty";		
		uniformClass = "rhs_specnaz_marksman";
		identityTypes[] = {"LanguageRUS","Head_Euro","Head_Asian","rhs_scarf"};
		
		linkedItems[] = {"LOP_V_6B23_6Sh92_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"LOP_V_6B23_6Sh92_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};		
		weapons[] = {"rhs_weap_svdp_wd","Throw","Put"};
		magazines[] = {"rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N1"};
		respawnWeapons[] = {"rhs_weap_svdp_wd","Throw","Put"};
		respawnMagazines[] = {"rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N1","rhs_10Rnd_762x54mmR_7N1"};
		Items[] = {"rhs_acc_pso1m2","rhs_acc_tgpv"};
		RespawnItems[] = {"rhs_acc_pso1m2","rhs_acc_tgpv"};
		
		hiddenSelections[] = {"camo1", "camo2", "camob", "insignia"};
		hiddenSelectionsTextures[] = {"A3C_config_rhs\a3c_c_rhs_c_troops\addons\data\specnaz_co.paa", "", ""};			
	};

	class rhs_specnaz_machinegunner : rhs_specnaz_rifleman
	{
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\szeregowy.paa";	
		displayName = "Strzelec MG (Szeregowy)";		
		
		backpack ="rhs_assault_umbts_engineer_empty";		
		uniformClass = "rhs_specnaz_machinegunner";
		identityTypes[] = {"LanguageRUS","Head_Euro","Head_Asian","rhs_scarf"};
		
		linkedItems[] = {"LOP_V_6B23_6Sh92_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"LOP_V_6B23_6Sh92_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};		
		weapons[] = {"rhs_weap_pkp","Throw","Put"};
		magazines[] = {"rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR"};
		respawnWeapons[] = {"rhs_weap_pkp","Throw","Put"};
		respawnMagazines[] = {"rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR","rhs_100Rnd_762x54mmR"};
		Items[] = {"rhs_acc_pkas"};
		RespawnItems[] = {"rhs_acc_pkas"};
		
		hiddenSelections[] = {"camo1", "camo2", "camob", "insignia"};
		hiddenSelectionsTextures[] = {"A3C_config_rhs\a3c_c_rhs_c_troops\addons\data\specnaz_co.paa", "", ""};			
	};

	class rhs_specnaz_medic : rhs_specnaz_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";	
		displayName = "Medyk (Kapral)";		
		
		backpack ="rhs_assault_umbts_engineer_empty";		
		uniformClass = "rhs_specnaz_medic";
		identityTypes[] = {"LanguageRUS","Head_Euro","Head_Asian","rhs_scarf"};
		
		linkedItems[] = {"LOP_V_6B23_Medic_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"LOP_V_6B23_Medic_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};		
		weapons[] = {"rhs_weap_ak74m_2mag_camo","Throw","Put"};
		magazines[] = {"rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK"};
		respawnWeapons[] = {"rhs_weap_ak74m_2mag_camo","Throw","Put"};
		respawnMagazines[] = {"rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK"};
		Items[] = {"rhs_acc_dtk4short","rhs_acc_pso1m2"};
		RespawnItems[] = {"rhs_acc_dtk4short","rhs_acc_pso1m2"};
		
		hiddenSelections[] = {"camo1", "camo2", "camob", "insignia"};
		hiddenSelectionsTextures[] = {"A3C_config_rhs\a3c_c_rhs_c_troops\addons\data\specnaz_co.paa", "", ""};			
	};

	class rhs_specnaz_at : rhs_specnaz_rifleman
	{
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\szeregowy.paa";		
		displayName = "Strzelec AT (Szeregowy)";	
		
		backpack ="rhs_assault_umbts_engineer_empty";		
		uniformClass = "rhs_specnaz_at";
		identityTypes[] = {"LanguageRUS","Head_Euro","Head_Asian","rhs_scarf"};
		
		linkedItems[] = {"LOP_V_6B23_6Sh92_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"LOP_V_6B23_6Sh92_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};		
		weapons[] = {"rhs_weap_ak74m_2mag_camo","rpg7","Throw","Put"};
		magazines[] = {"rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","RPG7_AMMO","RPG7_AMMO",};
		respawnWeapons[] = {"rhs_weap_ak74m_2mag_camo","rpg7","Throw","Put"};
		respawnMagazines[] = {"rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","RPG7_AMMO","RPG7_AMMO",};
		Items[] = {"rhs_acc_dtk4short","rhs_acc_pso1m2"};
		RespawnItems[] = {"rhs_acc_dtk4short","rhs_acc_pso1m2"};
		
		hiddenSelections[] = {"camo1", "camo2", "camob", "insignia"};
		hiddenSelectionsTextures[] = {"A3C_config_rhs\a3c_c_rhs_c_troops\addons\data\specnaz_co.paa", "", ""};		
	};

	class rhs_specnaz_grenadier : rhs_specnaz_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";		
		displayName = "Grenadier (Kapral)";	
		
		backpack ="rhs_assault_umbts_engineer_empty";		
		uniformClass = "rhs_specnaz_grenadier";
		identityTypes[] = {"LanguageRUS","Head_Euro","Head_Asian","rhs_scarf"};
		
		linkedItems[] = {"LOP_V_6B23_6Sh92_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"LOP_V_6B23_6Sh92_OLV","rhs_6b27m_green_ess_bala","NVGoggles_OPFOR","ItemMap","ItemCompass","ItemWatch","ItemRadio"};		
		weapons[] = {"rhs_weap_ak74m_gp25","Throw","Put"};
		magazines[] = {"rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK"};
		respawnWeapons[] = {"rhs_weap_ak74m_gp25","Throw","Put"};
		respawnMagazines[] = {"rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK","rhs_30Rnd_545x39_AK"};
		Items[] = {"rhs_acc_dtk4short","rhs_acc_pso1m2"};
		RespawnItems[] = {"rhs_acc_dtk4short","rhs_acc_pso1m2"};
		
		hiddenSelections[] = {"camo1", "camo2", "camob", "insignia"};
		hiddenSelectionsTextures[] = {"A3C_config_rhs\a3c_c_rhs_c_troops\addons\data\specnaz_co.paa", "", ""};		
	};
