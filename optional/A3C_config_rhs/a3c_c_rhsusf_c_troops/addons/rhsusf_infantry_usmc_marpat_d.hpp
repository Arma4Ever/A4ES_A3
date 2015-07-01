
	class rhsusf_usmc_marpat_d_rifleman: rhsusf_usmc_marpat_wd_rifleman
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_lwh_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_lwh_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_rifleman_light: rhsusf_usmc_marpat_wd_rifleman_light
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};
	
	class rhsusf_usmc_marpat_d_rifleman_medic: rhsusf_usmc_marpat_d_rifleman_light
	{
		displayName = "Medyk (Kapral)";
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\corporal_gs.paa";			
		faction = "Faction_USAM";
		backpack ="plecak_med_us_rhs_cbr";	
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};	
		attendant = 1;			
	};	

	class rhsusf_usmc_marpat_d_rifleman_m4: rhsusf_usmc_marpat_wd_rifleman_m4
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_mich_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_mich_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_riflemanat: rhsusf_usmc_marpat_wd_riflemanat
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_kapitan","rhsusf_lwh_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapitan","rhsusf_lwh_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_rifleman_m590: rhsusf_usmc_marpat_wd_rifleman_m590
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_mich_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_mich_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_grenadier: rhsusf_usmc_marpat_wd_grenadier
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_autorifleman: rhsusf_usmc_marpat_wd_autorifleman
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_lwh_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_lwh_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};	
		weapons[] = {"rhs_weap_m249_pip_L","Throw","Put"};
		magazines[] = {"rhs_200rnd_556x45_M_SAW","rhs_200rnd_556x45_M_SAW","rhs_200rnd_556x45_M_SAW","rhs_200rnd_556x45_M_SAW","rhs_200rnd_556x45_M_SAW"};		
	};

	class rhsusf_usmc_marpat_d_autorifleman_m249: rhsusf_usmc_marpat_wd_autorifleman_m249
	{
		Scope = 1;
	};

	class rhsusf_usmc_marpat_d_autorifleman_m249_ass: rhsusf_usmc_marpat_wd_autorifleman_m249_ass
	{
		Scope = 1;
	};

	class rhsusf_usmc_marpat_d_machinegunner: rhsusf_usmc_marpat_wd_machinegunner
	{
		Scope = 1;
	};

	class rhsusf_usmc_marpat_d_machinegunner_ass: rhsusf_usmc_marpat_wd_machinegunner_ass
	{
		Scope = 1;
	};

	class rhsusf_usmc_marpat_d_officer: rhsusf_usmc_marpat_wd_officer
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_mich_helmet_marpatd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_mich_helmet_marpatd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_squadleader: rhsusf_usmc_marpat_wd_squadleader
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_kapitan","rhsusf_lwh_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapitan","rhsusf_lwh_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_teamleader: rhsusf_usmc_marpat_wd_teamleader
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_szer","rhsusf_mich_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_szer","rhsusf_mich_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_fso: rhsusf_usmc_marpat_wd_fso
	{
		scope = 1;
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_mich_helmet_marpatd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_mich_helmet_marpatd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_jfo: rhsusf_usmc_marpat_wd_jfo
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_mich_helmet_marpatd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_mich_helmet_marpatd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};
	
	class rhsusf_usmc_marpat_d_engineer: rhsusf_usmc_marpat_wd_engineer
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_lwh_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_lwh_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_explosives: rhsusf_usmc_marpat_wd_explosives
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_uav: rhsusf_usmc_marpat_wd_uav
	{
		scope = 1;
	};

	class rhsusf_usmc_marpat_d_javelin: rhsusf_usmc_marpat_wd_javelin
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_kapitan","rhsusf_mich_helmet_marpatd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapitan","rhsusf_mich_helmet_marpatd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_stinger: rhsusf_usmc_marpat_wd_stinger
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_marksman: rhsusf_usmc_marpat_wd_marksman
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_Ml_Chorazy","rhs_Booniehat_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_Ml_Chorazy","rhs_Booniehat_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_spotter: rhsusf_usmc_marpat_wd_spotter
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_Ml_Chorazy","rhs_Booniehat_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_Ml_Chorazy","rhs_Booniehat_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_sniper: rhsusf_usmc_marpat_wd_sniper
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_Ml_Chorazy","rhs_Booniehat_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_Ml_Chorazy","rhs_Booniehat_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_d_crewman: rhsusf_usmc_marpat_wd_crewman
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_szer","rhsusf_cvc_green_helmet","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_szer","rhsusf_cvc_green_helmet","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
		backpack ="";			
	};

	class rhsusf_usmc_marpat_d_combatcrewman: rhsusf_usmc_marpat_wd_combatcrewman
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_szer","rhsusf_cvc_green_ess","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_szer","rhsusf_cvc_green_ess","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
		backpack ="";			
	};

	class rhsusf_usmc_marpat_d_driver: rhsusf_usmc_marpat_wd_driver
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_d";
		linkedItems[] = {"usmc_vest_szer","rhsusf_cvc_green_ess","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_szer","rhsusf_cvc_green_ess","ItemMap","ItemCompass","ItemWatch","ItemRadio"};	
		backpack ="";			
	};

	class rhsusf_usmc_marpat_d_helipilot: rhsusf_usmc_marpat_wd_helipilot
	{
		scope = 1;		
	};

	class rhsusf_usmc_marpat_d_helicrew: rhsusf_usmc_marpat_wd_helicrew
	{
		scope = 1;		
	};