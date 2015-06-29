class CfgPatches
{
	class a3c_rhs_pam_2
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {};
	};
};
class CfgVehicles
{

	class RHS_Mi8mt_Cargo_vvs; //<- transport
	class RHS_Mi8mt_vvs; //<- Transport + pkm
	class RHS_Mi8MTV3_FAB_vvs; //<- z bombami
	class RHS_Mi8AMTSh_vvs; //<- same rakiety
	class RHS_Mi8amt_vvs; //<-med
	class RHS_Mi24P_CAS_vvs;
	class RHS_Mi24V_AT_vvs;
	class RHS_Mi24V_vvs;
	class PAM_Mi24P: RHS_Mi24P_CAS_vvs
	{
		displayName = "Mi-24P";
		vehicleClass = "pojazdylatajace";
		crew = "pilot";
		faction = "Faction_A3C";
		driver = "pilot";		
		hiddenSelectionsTextures[] = {
		"pam_air_vehicles\pam_mi24\data\PL\mi24p_PL.paa",
		"pam_air_vehicles\pam_mi24\data\PL\mi24p_PL2.paa"};
		scope = 2;
		side = 1;
	};
	class PAM_Mi24V_AT: RHS_Mi24V_AT_vvs
	{
		displayName = "Mi-24V AT";
		vehicleClass = "pojazdylatajace";
		crew = "pilot";
		faction = "Faction_A3C";
		driver = "pilot";		
		hiddenSelectionsTextures[] = {
		"pam_air_vehicles\pam_mi24\data\PL\mi24p_PL.paa",
		"pam_air_vehicles\pam_mi24\data\PL\mi24p_PL2.paa"};
		scope = 2;
		side = 1;
	};
	class PAM_Mi24V: RHS_Mi24V_vvs
	{
		displayName = "Mi-24V";
		vehicleClass = "pojazdylatajace";
		crew = "pilot";
		faction = "Faction_A3C";
		driver = "pilot";		
		hiddenSelectionsTextures[] = {
		"pam_air_vehicles\pam_mi24\data\PL\mi24p_PL.paa",
		"pam_air_vehicles\pam_mi24\data\PL\mi24p_PL2.paa"};
		scope = 2;
		side = 1;
	};
///////////////////////////////////////////////////////////////////////////////
	class PAM_Mi8mt_Cargo_PL: RHS_Mi8mt_Cargo_vvs //<- transport	
	{
		displayName = "Mi-17 (Transport)";
		vehicleClass = "pojazdylatajace";
		crew = "pilot";
		faction = "Faction_A3C";
		driver = "pilot";		
		hiddenSelectionsTextures[] = {"pam_air_vehicles\pam_mi17\data\pl\mi17_body_pl_CO.paa","pam_air_vehicles\pam_mi17\data\pl\mi17_det_pl_CO.paa"};
		side = 1;		
		scope = 2;		
	};		
	class PAM_Mi8mt_PL: RHS_Mi8mt_vvs //<- Transport + pkm
	{
		displayName = "Mi-17 (Transport + PKM)";
		vehicleClass = "pojazdylatajace";
		crew = "pilot";
		faction = "Faction_A3C";
		driver = "pilot";		
		hiddenSelectionsTextures[] = {"pam_air_vehicles\pam_mi17\data\pl\mi17_body_pl_CO.paa","pam_air_vehicles\pam_mi17\data\pl\mi17_det_pl_CO.paa"};
		side = 1;		
		scope = 2;		
	};	
	class PAM_Mi8MTV3_FAB_PL: RHS_Mi8MTV3_FAB_vvs //<- z bombami
	{
		displayName = "Mi-8 (Bomby)";
		vehicleClass = "pojazdylatajace";
		crew = "pilot";
		faction = "Faction_A3C";
		driver = "pilot";		
		hiddenSelectionsTextures[] = {"pam_air_vehicles\pam_mi17\data\pl\mi17_body_pl_CO.paa","pam_air_vehicles\pam_mi17\data\pl\mi17_det_pl_CO.paa"};
		side = 1;		
		scope = 2;		
	};	
	class PAM_Mi8AMTSh_PL: RHS_Mi8AMTSh_vvs //<- same rakiety
	{
		displayName = "Mi-8 (Rakiety)";
		vehicleClass = "pojazdylatajace";
		crew = "pilot";
		faction = "Faction_A3C";
		driver = "pilot";		
		hiddenSelectionsTextures[] = {"pam_air_vehicles\pam_mi17\data\pl\mi17_body_pl_CO.paa","pam_air_vehicles\pam_mi17\data\pl\mi17_det_pl_CO.paa"};
		side = 1;		
		scope = 2;		
	};	
	class PAM_Mi8amt_PL: RHS_Mi8amt_vvs //<-med
	{
		displayName = "Mi-17 (Medevac)";
		vehicleClass = "pojazdylatajace";
		crew = "pilot";
		faction = "Faction_A3C";
		driver = "pilot";		
		hiddenSelectionsTextures[] = {"pam_air_vehicles\pam_mi17\data\pl\mi17_body_med_co.paa","pam_air_vehicles\pam_mi17\data\pl\mi17_det_pl_CO.paa"};
		side = 1;		
		scope = 2;		
	};
};