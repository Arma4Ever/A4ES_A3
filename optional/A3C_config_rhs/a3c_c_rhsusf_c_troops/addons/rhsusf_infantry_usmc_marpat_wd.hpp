
	class rhsusf_infantry_usmc_base: rhsusf_infantry_army_base
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_usmc_wd";	
		
	};

	class rhsusf_usmc_marpat_wd_rifleman: rhsusf_infantry_usmc_base
	{
		displayName = "Strzelec (Szeregowy)";
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\private_gs.paa";	
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_lwh_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_lwh_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_rifleman_m4: rhsusf_usmc_marpat_wd_rifleman
	{
		displayName = "Strzelec (St. Szeregowy)";			
		a3cs_nametag_rankname = "St. Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\private_fc_gs.paa";
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_mich_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_mich_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_rifleman_light: rhsusf_usmc_marpat_wd_rifleman
	{
		displayName = "Strzelec (Kapral)";
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\corporal_gs.paa";	
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatwd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatwd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_rifleman_medic: rhsusf_usmc_marpat_wd_rifleman
	{
		displayName = "Medyk (Kapral)";
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\corporal_gs.paa";	
		
		attendant = 1;			
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatwd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatwd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};	
	
	class rhsusf_usmc_marpat_wd_riflemanat: rhsusf_usmc_marpat_wd_rifleman
	{
		displayName = "Strzelec AT (Ml. Sierzant)";		
		a3cs_nametag_rankname = "Ml. Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\m_sergeant_gs.paa";
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_kapitan","rhsusf_lwh_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapitan","rhsusf_lwh_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_rifleman_m590: rhsusf_usmc_marpat_wd_rifleman
	{
		displayName = "Strzelec m590 (Kapral)";
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\corporal_gs.paa";	
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_mich_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_mich_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_grenadier: rhsusf_usmc_marpat_wd_rifleman
	{
		displayName = "Grenadier (St. Szeregowy)";			
		a3cs_nametag_rankname = "St. Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\private_fc_gs.paa";
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatwd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatwd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_autorifleman: rhsusf_infantry_usmc_base
	{
		displayName = "Strzelec MG (Sierzant)";		
		a3cs_nametag_rankname = "Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\sergeant_gs.paa";	
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		weapons[] = {"rhs_weap_m249_pip_L","Throw","Put"};
		magazines[] = {"rhs_200rnd_556x45_M_SAW","rhs_200rnd_556x45_M_SAW","rhs_200rnd_556x45_M_SAW","rhs_200rnd_556x45_M_SAW","rhs_200rnd_556x45_M_SAW"};		
		linkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_lwh_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_lwh_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_autorifleman_m249: rhsusf_usmc_marpat_wd_autorifleman
	{
		Scope = 1;
	};

	class rhsusf_usmc_marpat_wd_autorifleman_m249_ass: rhsusf_usmc_marpat_wd_rifleman
	{
		Scope = 1;
	};

	class rhsusf_usmc_marpat_wd_machinegunner: rhsusf_usmc_marpat_wd_autorifleman
	{
		Scope = 1;
	};

	class rhsusf_usmc_marpat_wd_machinegunner_ass: rhsusf_usmc_marpat_wd_rifleman
	{
		Scope = 1;
	};

	class rhsusf_usmc_marpat_wd_officer: rhsusf_usmc_marpat_wd_rifleman
	{
		displayName = "Dowodca druzyny (Podporucznik)";		
		a3cs_nametag_rankname = "Podporucznik"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\lieutenant_gs.paa";
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_mich_helmet_marpatwd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_mich_helmet_marpatwd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_squadleader: rhsusf_usmc_marpat_wd_rifleman
	{
		displayName = "Podoficer (St. Sierzant)";		
		a3cs_nametag_rankname = "St. Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\sergeant_2.paa";	
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_kapitan","rhsusf_lwh_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapitan","rhsusf_lwh_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_teamleader: rhsusf_infantry_usmc_base
	{
		displayName = "St Dowodca druzyny (Porucznik)";		
		a3cs_nametag_rankname = "Porucznik"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\porucznik.paa";	
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_szer","rhsusf_mich_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_szer","rhsusf_mich_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_jfo: rhsusf_usmc_marpat_wd_rifleman
	{
		displayName = "Oficer polowy (Kapitan)";		
		a3cs_nametag_rankname = "Kapitan"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\captain_gs.paa";	
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_mich_helmet_marpatwd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_mich_helmet_marpatwd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_fso: rhsusf_usmc_marpat_wd_rifleman
	{
		scope = 1;
		displayName = "NO IDEA (Kapral)";		
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\corporal_gs.paa";
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_lwh_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_Ml_Chorazy","rhsusf_lwh_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_javelin: rhsusf_usmc_marpat_wd_riflemanat
	{
		displayName = "Strzelec AT Javelin (Kapral)";		
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\corporal_gs.paa";
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapral","rhsusf_mich_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_stinger: rhsusf_usmc_marpat_wd_riflemanat
	{
		displayName = "Strzelec AA (Kapral)";		
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\corporal_gs.paa";
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_kapitan","rhsusf_mich_helmet_marpatwd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapitan","rhsusf_mich_helmet_marpatwd_norotos","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_engineer: rhsusf_usmc_marpat_wd_rifleman
	{
		displayName = "Inzynier (Ml. Chorazy)";		
		a3cs_nametag_rankname = "Ml. Chorazy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\sergeant_3.paa";	
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_szer","rhsusf_lwh_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_szer","rhsusf_lwh_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_explosives: rhsusf_usmc_marpat_wd_rifleman
	{
		displayName = "Saper (Ml. Sierzant)";
		a3cs_nametag_rankname = "Ml. Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\m_sergeant_gs.paa";
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_mich_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_ml_sierzant","rhsusf_mich_helmet_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_uav: rhsusf_usmc_marpat_wd_rifleman
	{
		scope = 1;
	};

	class rhsusf_usmc_marpat_wd_marksman: rhsusf_usmc_marpat_wd_rifleman
	{
		displayName = "Strzelec wyborowy (Sierzant)";		
		a3cs_nametag_rankname = "Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\sergeant_gs.paa";
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_Ml_Chorazy","rhs_Booniehat_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_Ml_Chorazy","rhs_Booniehat_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_spotter: rhsusf_usmc_marpat_wd_marksman
	{
		displayName = "Spoter (Ml. Sierzant)";
		a3cs_nametag_rankname = "Ml. Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\m_sergeant_gs.paa";	
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_kapitan","rhs_Booniehat_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_kapitan","rhs_Booniehat_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_sniper: rhsusf_usmc_marpat_wd_marksman
	{
		displayName = "Snajper (St. Sierzant)";		
		a3cs_nametag_rankname = "St. Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\sergeant_2.paa";	
		
		backpack ="rhsusf_assault_eagleaiii_coy";		
		
		linkedItems[] = {"usmc_vest_szer","rhs_Booniehat_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_szer","rhs_Booniehat_marpatwd","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_crewman: rhsusf_infantry_usmc_base
	{
		displayName = "Dowodca pojazdu (St. Sierzant)";		
		a3cs_nametag_rankname = "St. Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\sergeant_2.paa";
		
		backpack ="";		
		
		linkedItems[] = {"usmc_vest_szer","rhsusf_cvc_green_helmet","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_szer","rhsusf_cvc_green_helmet","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_combatcrewman: rhsusf_usmc_marpat_wd_crewman
	{
		displayName = "Strzelec pojazdu (Kapral)";		
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\corporal_gs.paa";
		
		backpack ="";		
		
		linkedItems[] = {"usmc_vest_szer","rhsusf_cvc_green_ess","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_szer","rhsusf_cvc_green_ess","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_driver: rhsusf_infantry_usmc_base
	{
		displayName = "Kierowca pojazdu (St. Szeregowy)";		
		a3cs_nametag_rankname = "St. Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USMC\private_fc_gs.paa";		
		
		backpack ="";		
		
		linkedItems[] = {"usmc_vest_szer","rhsusf_cvc_green_ess","ItemMap","ItemCompass","ItemWatch","ItemRadio"};
		respawnLinkedItems[] = {"usmc_vest_szer","rhsusf_cvc_green_ess","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	};

	class rhsusf_usmc_marpat_wd_helipilot: rhsusf_infantry_usmc_base
	{
		scope = 1;		
	};

	class rhsusf_usmc_marpat_wd_helicrew: rhsusf_usmc_marpat_wd_helipilot
	{
		scope = 1;		
	};