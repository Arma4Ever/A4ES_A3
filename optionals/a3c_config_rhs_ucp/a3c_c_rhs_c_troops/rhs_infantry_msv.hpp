
	class rhs_infantry_msv_base : SoldierGB
	{
		faction = "a3c_rhs_faction_russian";
		vehicleClass = "a3c_rhs_vehclass_infantry_msv";
		displayName= "$STR_RHS_INF_RIFLEMAN";
	};

	class rhs_pilot_base : rhs_infantry_msv_base
	{
		displayName = "Pilot";
		faction = "a3c_rhs_faction_russian";
	};

	class rhs_pilot : rhs_pilot_base
	{
		a3cs_nametag_rankname = "Kapitan"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapitan.paa";	
		displayName = "Pilot (Kapitan)";
	};

	class rhs_pilot_combat_heli : rhs_pilot_base
	{
		a3cs_nametag_rankname = "Major"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\major.paa";	
		displayName = "Pilot bojowy (Major)";
	};

	class rhs_pilot_transport_heli : rhs_pilot_base
	{
		a3cs_nametag_rankname = "Porucznik"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\porucznik.paa";	
		displayName = "Pilot transportowy (Porucznik)";
	};
	
	class rhs_msv_rifleman : rhs_infantry_msv_base
	{
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\szeregowy.paa";	
		displayName = "Strzelec (Szeregowy)";
	};	

	class rhs_msv_efreitor : rhs_msv_rifleman
	{
		a3cs_nametag_rankname = "Chorazy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\chorazy.paa";			
		displayName = "Weteran (Chorazy)";	
	};

	class rhs_msv_grenadier : rhs_msv_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";		
		displayName = "Grenadier (Kapral)";	
	};

	class rhs_msv_grenadier_rpg : rhs_msv_rifleman
	{
		scope = 1;	
	};

	class rhs_msv_machinegunner : rhs_msv_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";	
		displayName = "Strzelec MG (Kapral)";
	};

	class rhs_msv_machinegunner_assistant : rhs_msv_rifleman
	{
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\szeregowy.paa";	
		displayName = "Asyst. Strzelca MG (Szeregowy)";	
	};

	class rhs_msv_at : rhs_msv_rifleman
	{
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\szeregowy.paa";		
		displayName = "Strzelec AT (Szeregowy)";
	};

	class rhs_msv_aa : rhs_msv_at
	{
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\szeregowy.paa";	
		displayName = "Strzelec AA (Szeregowy)";
	};

	class rhs_msv_strelok_rpg_assist : rhs_msv_rifleman
	{
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\szeregowy.paa";	
		displayName = "Asyst. Strzelca AT (Szeregowy)";	
	};

	class rhs_msv_marksman : rhs_msv_rifleman
	{
		a3cs_nametag_rankname = "Mlodszy sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\ml_sierzant.paa";		
		displayName = "Strzelec Wyborowy (Mlodszy sierzant)";
	};

	class rhs_msv_officer_armored : rhs_msv_rifleman
	{
		a3cs_nametag_rankname = "Kapitan"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapitan.paa";	
		displayName = "Oficer #1 (Kapitan)";
	};

	class rhs_msv_officer : rhs_msv_officer_armored
	{
		a3cs_nametag_rankname = "Podporucznik"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\podporucznik.paa";	
		displayName = "Oficer #2 (Podporucznik)";
	};

	class rhs_msv_sergeant : rhs_msv_rifleman
	{
		a3cs_nametag_rankname = "St sierzant sztabowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\st_sierzant_sztab.paa";		
		displayName = "Podoficer (St sierzant sztabowy)";
	};

	class rhs_msv_junior_sergeant : rhs_msv_sergeant
	{
		a3cs_nametag_rankname = "Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\sierzant.paa";
		displayName = "Ml Podoficer (Sierzant)";
	};

	class rhs_msv_engineer : rhs_msv_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";	
		displayName = "Inzynier (Kapral)";
	};

	class rhs_msv_driver_armored : rhs_msv_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";	
		displayName = "Kierowca #1 (Kapral)";
	};

	class rhs_msv_driver : rhs_msv_driver_armored
	{
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\szeregowy.paa";	
		displayName = "Kierowca #2 (Szeregowy)";
	};

	class rhs_msv_medic : rhs_msv_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";	
		displayName = "Medyk (Kapral)";	
	};

	class rhs_msv_LAT : rhs_msv_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";	
		displayName = "Strzelec LAT (Kapral)";
	};

	class rhs_msv_RShG2 : rhs_msv_LAT
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";	
		displayName = "Strzelec RShG2 (Kapral)";
	};

	class rhs_msv_crew : rhs_msv_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";	
		displayName = "Obsluga pojazdu (Kapral)";
	};

	class rhs_msv_crew_commander : rhs_msv_crew
	{
		a3cs_nametag_rankname = "St sierzant sztabowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\st_sierzant_sztab.paa";		
		displayName = "Obsluga pojazdu Dowodca (St sierzant sztabowy)";	
	};

	class rhs_msv_armoredcrew : rhs_msv_crew
	{
		scope = 1;	
	};

	class rhs_msv_combatcrew : rhs_msv_crew
	{
		scope = 1;	
	};