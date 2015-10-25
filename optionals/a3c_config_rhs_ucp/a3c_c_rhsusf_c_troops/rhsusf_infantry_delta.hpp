	class rhsusf_delta_force: rhsusf_infantry_army_base
	{
		displayName= "Strzelec (Szeregowy)";	
		a3cs_nametag_rankname = "Szeregowy"; 
		a3cs_nametag_rankicon = "\pam_ranks\USARMY\private_gs.paa";			
		
		Scope = 2;
		faction = "Faction_USAM";
		vehicleClass = "rhs_vehclass_infantry_1cav";
		backpack ="B_AssaultPack_cbr";		
		uniformClass = "rhs_uniform_cu_ocp_1stcav";			
		weapons[] = {"rhs_weap_m4a1_carryhandle","Throw","Put"};
		magazines[] = {"rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag","rhs_mag_30Rnd_556x45_Mk318_Stanag"};		
		linkedItems[] = {"rhsusf_iotv_ocp_Rifleman","rhsusf_opscore_03_ocp","ItemMap","ItemCompass","ItemWatch","ItemRadio"};			
	
		hiddenSelections[] = {"camo1","camo2","camo3","insignia"};
		hiddenSelectionsTextures[] = {"uniform.paa","pokets.paa"};	
	};