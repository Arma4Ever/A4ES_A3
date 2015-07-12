
	class rhs_infantry_vdv_base : rhs_infantry_msv_base
	{
		faction = "a3c_rhs_faction_russian";
		vehicleClass = "a3c_rhs_vehclass_infantry_vdv_emr";
		displayName= "$STR_RHS_INF_RIFLEMAN";
	};

	class rhs_vdv_rifleman : rhs_infantry_vdv_base
	{
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\szeregowy.paa";	
		displayName = "Lekki Strzelec (Szeregowy)";
	};

	class rhs_vdv_efreitor : rhs_vdv_rifleman
	{
		a3cs_nametag_rankname = "Chorazy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\chorazy.paa";			
		displayName = "Weteran (Chorazy)";
	};

	class rhs_vdv_grenadier : rhs_vdv_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";		
		displayName = "Grenadier (Kapral)";
	};

	class rhs_vdv_grenadier_rpg : rhs_vdv_grenadier
	{
		scope = 1;
	};

	class rhs_vdv_machinegunner : rhs_vdv_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";	
		displayName = "Strzelec MG (Kapral)";
	};

	class rhs_vdv_machinegunner_assistant : rhs_vdv_rifleman
	{
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\szeregowy.paa";	
		displayName = "Asyst. Strzelca MG (Szeregowy)";	
	};

	class rhs_vdv_at : rhs_vdv_rifleman
	{
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\szeregowy.paa";		
		displayName = "Strzelec AT (Szeregowy)";
	};

	class rhs_vdv_aa : rhs_vdv_at
	{
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\szeregowy.paa";	
		displayName = "Strzelec AA (Szeregowy)";
	};
	class rhs_vdv_strelok_rpg_assist : rhs_vdv_rifleman
	{
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\szeregowy.paa";	
		displayName = "Asyst. Strzelca AT (Szeregowy)";
	};

	class rhs_vdv_marksman : rhs_vdv_rifleman
	{
		a3cs_nametag_rankname = "Mlodszy sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\ml_sierzant.paa";		
		displayName = "Strzelec Wyborowy (Mlodszy sierzant)";
	};

	class rhs_vdv_officer_armored : rhs_vdv_rifleman
	{
		a3cs_nametag_rankname = "Kapitan"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapitan.paa";	
		displayName = "Oficer #1 (Kapitan)";
	};

	class rhs_vdv_officer : rhs_vdv_officer_armored
	{
		a3cs_nametag_rankname = "Podporucznik"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\podporucznik.paa";	
		displayName = "Oficer #2 (Podporucznik)";
	};

	class rhs_vdv_sergeant :  rhs_vdv_rifleman
	{
		a3cs_nametag_rankname = "St sierzant sztabowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\st_sierzant_sztab.paa";		
		displayName = "Podoficer (St sierzant sztabowy)";
	};

	class rhs_vdv_junior_sergeant : rhs_vdv_sergeant
	{
		a3cs_nametag_rankname = "Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\sierzant.paa";
		displayName = "Ml Podoficer (Sierzant)";
	};

	class rhs_vdv_engineer : rhs_vdv_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";	
		displayName = "Inzynier (Kapral)";
	};

	class rhs_vdv_driver_armored : rhs_vdv_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";	
		displayName = "Kierowca #1 (Kapral)";
	};

	class rhs_vdv_driver : rhs_vdv_driver_armored
	{
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\szeregowy.paa";	
		displayName = "Kierowca #2 (Szeregowy)";
	};

	class rhs_vdv_medic : rhs_vdv_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";	
		displayName = "Medyk (Kapral)";	
	};

	class rhs_vdv_LAT : rhs_vdv_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";	
		displayName = "Strzelec LAT (Kapral)";
	};

	class rhs_vdv_RShG2 : rhs_vdv_LAT
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";	
		displayName = "Strzelec RShG2 (Kapral)";
	};

	class rhs_vdv_crew : rhs_vdv_rifleman
	{
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\kapral.paa";	
		displayName = "Obsluga pojazdu (Kapral)";
	};

	class rhs_vdv_crew_commander : rhs_vdv_crew
	{
		a3cs_nametag_rankname = "St sierzant sztabowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\RUS\st_sierzant_sztab.paa";		
		displayName = "Obsluga pojazdu Dowodca (St sierzant sztabowy)";	
	};

	class rhs_vdv_armoredcrew : rhs_vdv_crew
	{
		scope = 1;
	};

	class rhs_vdv_combatcrew : rhs_vdv_crew
	{
		scope = 1;
	};