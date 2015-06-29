
	class rhsusf_infantry_army_base: SoldierWB
	{
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_ocp";
		displayName= "$STR_RHSUSF_INF_RIFLEMAN";
	};

	class rhsusf_infantry_army_1stcav: rhsusf_infantry_army_base
	{
		Scope = 1;
	};

	class rhsusf_infantry_army_82nd: rhsusf_infantry_army_base
	{
		Scope = 1;
	};

	class rhsusf_infantry_army_101st: rhsusf_infantry_army_base
	{
		Scope = 1;
	};

	class rhsusf_infantry_army_10th: rhsusf_infantry_army_base
	{
		Scope = 1;
	};
	class rhsusf_army_ocp_rifleman_1stcav: rhsusf_infantry_army_1stcav
	{
		Scope = 1;
	};

	class rhsusf_army_ocp_rifleman_82nd: rhsusf_infantry_army_82nd
	{
		Scope = 1;
	};

	class rhsusf_army_ocp_rifleman_101st: rhsusf_infantry_army_101st
	{
		Scope = 1;
	};

	class rhsusf_army_ocp_rifleman_10th: rhsusf_infantry_army_10th
	{
		Scope = 1;
	};
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	class rhsusf_army_ocp_rifleman: rhsusf_infantry_army_base
	{
		displayName= "Strzelec (Szeregowy)";	
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\private_gs.paa";		
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_rifleman_m4: rhsusf_army_ocp_rifleman
	{
		displayName = "Strzelec (St. Szeregowy)";		
		a3cs_nametag_rankname = "St. Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\private_fc_gs.paa";	
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_rifleman_m16: rhsusf_army_ocp_rifleman
	{
		displayName = "Strzelec (Kapral)";		
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\corporal_gs.paa";	
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_rifleman_m590: rhsusf_army_ocp_rifleman
	{
		displayName = "Strzelec (Plutonowy)";		
		a3cs_nametag_rankname = "Plutonowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\specialist_gs.paa";	
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_riflemanl: rhsusf_army_ocp_rifleman
	{
		displayName = "Strzelec (Ml. Sierzant)";		
		a3cs_nametag_rankname = "Ml. Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\m_sergeant_gs.paa";	
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_riflemanat: rhsusf_army_ocp_rifleman
	{
		displayName = "Strzelec AT (St. Szeregowy)";		
		a3cs_nametag_rankname = "St. Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\private_fc_gs.paa";		
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_grenadier: rhsusf_infantry_army_base
	{
		displayName = "Grenadier (Kapral)";		
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\corporal_gs.paa";		
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_autorifleman: rhsusf_infantry_army_base
	{
		displayName= "$STR_RHSUSF_INF_ARIFLEMAN";
		scope = 1;
			
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\private_gs.paa";		
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_autoriflemana: rhsusf_army_ocp_rifleman
	{
		displayName = "Strzelec MG (Kapral)";		
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\corporal_gs.paa";	
		backpack ="rhsusf_assault_eagleaiii_ocp";	
		weapons[] = {"rhs_weap_m249_pip_L","Throw","Put"};
		magazines[] = {"rhs_200rnd_556x45_M_SAW","rhs_200rnd_556x45_M_SAW","rhs_200rnd_556x45_M_SAW","rhs_200rnd_556x45_M_SAW","rhs_200rnd_556x45_M_SAW"};		
	};

	class rhsusf_army_ocp_machinegunner: rhsusf_army_ocp_autorifleman
	{
		scope = 1;
	};

	class rhsusf_army_ocp_machinegunnera: rhsusf_army_ocp_rifleman
	{
		scope = 1;
	};

	class rhsusf_army_ocp_officer: rhsusf_infantry_army_base
	{
		displayName = "Dowodca druzyny (Podporucznik)";		
		a3cs_nametag_rankname = "Podporucznik"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\lieutenant_gs.paa";		
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_squadleader: rhsusf_infantry_army_base
	{
		displayName = "Podoficer (St. Sierzant)";		
		a3cs_nametag_rankname = "St. Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\sergeant_2.paa";		
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_teamleader: rhsusf_infantry_army_base
	{

		displayName = "Ml Podoficer (Sierzant)";		
		a3cs_nametag_rankname = "Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\sergeant_gs.paa";		
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_jfo: rhsusf_infantry_army_base
	{
		faction = "Faction_USAM";
		displayName = "St Dowodca druzyny (Porucznik)";		
		a3cs_nametag_rankname = "Porucznik"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\porucznik.paa";		
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_fso: rhsusf_army_ocp_jfo
	{
		faction = "Faction_USAM";
		displayName = "Oficer polowy (Kapitan)";		
		a3cs_nametag_rankname = "Kapitan"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\captain_gs.paa";	
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_javelin: rhsusf_army_ocp_riflemanat
	{
		displayName = "Strzelec AT Javelin (St. Szeregowy)";		
		a3cs_nametag_rankname = "St. Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\private_fc_gs.paa";		
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_aa: rhsusf_army_ocp_riflemanat
	{
		displayName = "Strzelec AA (St. Szeregowy)";		
		a3cs_nametag_rankname = "St. Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\private_fc_gs.paa";		
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_uav : rhsusf_army_ocp_rifleman
	{
		Scope = 1;
	};

	class rhsusf_army_ocp_medic: rhsusf_army_ocp_rifleman
	{
		displayName = "Medyk (Kapral)";		
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\corporal_gs.paa";		
		backpack ="rhsusf_assault_eagleaiii_ocp";		
		attendant = 1;			
	};

	class rhsusf_army_ocp_engineer: rhsusf_army_ocp_rifleman
	{
		displayName = "Inzynier (Plutonowy)";		
		a3cs_nametag_rankname = "Plutonowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\specialist_gs.paa";
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_explosives: rhsusf_army_ocp_rifleman
	{
		displayName = "Saper (Plutonowy)";		
		a3cs_nametag_rankname = "Plutonowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\specialist_gs.paa";	
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_marksman: rhsusf_infantry_army_base
	{
		displayName = "Strzelec wyborowy (Sierzant)";		
		a3cs_nametag_rankname = "Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\sergeant_gs.paa";
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_sniper: rhsusf_army_ocp_marksman
	{
		displayName = "Snajper (Sierzant)";		
		a3cs_nametag_rankname = "Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\sergeant_gs.paa";	
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_crewman: rhsusf_infantry_army_base
	{
		displayName = "Dowodca pojazdu (Sierzant)";		
		a3cs_nametag_rankname = "Sierzant"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\sergeant_gs.paa";	
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_combatcrewman: rhsusf_army_ocp_crewman
	{
		displayName = "Strzelec pojazdu (Kapral)";		
		a3cs_nametag_rankname = "Kapral"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\corporal_gs.paa";	
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_driver : rhsusf_infantry_army_base
	{
		displayName = "Kierowca pojazdu (St. Szeregowy)";		
		a3cs_nametag_rankname = "St. Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\private_fc_gs.paa";		
		backpack ="rhsusf_assault_eagleaiii_ocp";					
	};

	class rhsusf_army_ocp_helipilot: rhsusf_infantry_army_base
	{
		Scope = 1;
	};

	class rhsusf_army_ocp_helicrew: rhsusf_army_ocp_helipilot
	{
		Scope = 1;
	};