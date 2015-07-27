class CfgPatches
{
	class a3c_rhs_pam
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"A10","Ah64D","CH47F","uh60m","M1A1","pam_tracked_vehicles","C130","AH1Z","mi_17_mod","mi24"};
	};
};
class CfgVehicles
{
	//Duplikaty PAM
	class Plane;
	class Ah64D_base;
	class ch47f_base;
	class blachawk_base;
	class M1A1_Base;
	class I_APC_tracked_03_cannon_F;
	class ah1z_base;
	class mi17_base;
	class mi24_base;
	class A10: Plane
	{
		scope = 0;
	};
	class Ah64D: Ah64D_base
	{
		scope = 0;
	};
	class Ah64D_UK: Ah64D_base
	{
		scope = 0;
	};
	class ch47f: ch47f_base
	{
		scope = 0;
	};
	class blackhawk_a2: blachawk_base
	{
		scope = 0;
	};
	class blackhawk_a2_transport: blachawk_base
	{
		scope = 0;
	};
	class M1A1: M1A1_Base
	{
		scope = 0;
	};
	class M1A1_2: M1A1_Base
	{
		scope = 0;
	};
	class AH1Z: ah1z_base
	{
		scope = 0;
	};
	class car11_a3c: I_APC_tracked_03_cannon_F
	{
		scope = 0;
	};
	class car12_a3c: car11_a3c
	{
		scope = 0;
	};
	class C130: Plane
	{
		scope = 0;
	};
	class mi24_pl: mi24_base
	{
		scope = 0;
	};
	class mi17_PL: mi17_base
	{
		scope = 0;
	};
	class Mi8TV_PL: mi17_base
	{
		scope = 0;
	};

	//Polskie Mi24
	class RHS_Mi24P_CAS_vvs;
	class RHS_Mi24V_AT_vvs;
	class RHS_Mi24V_vvs;
	class PAM_Mi24P: RHS_Mi24P_CAS_vvs
	{
		scope = 2;
		displayName = "Mi-24P";
		vehicleClass = "pojazdylatajace";
		crew = "pilot";
		faction = "Faction_A3C";
		driver = "pilot";
		side = 1;
		hiddenSelectionsTextures[] = {
			"pam_air_vehicles\pam_mi24\data\PL\mi24p_PL.paa",
			"pam_air_vehicles\pam_mi24\data\PL\mi24p_PL2.paa"
		};
	};
	class PAM_Mi24V_AT: RHS_Mi24V_AT_vvs
	{
		scope = 2;
		displayName = "Mi-24V AT";
		vehicleClass = "pojazdylatajace";
		crew = "pilot";
		faction = "Faction_A3C";
		driver = "pilot";
		side = 1;
		hiddenSelectionsTextures[] = {
			"pam_air_vehicles\pam_mi24\data\PL\mi24p_PL.paa",
			"pam_air_vehicles\pam_mi24\data\PL\mi24p_PL2.paa"
		};
	};
	class PAM_Mi24V: RHS_Mi24V_vvs
	{
		scope = 2;
		displayName = "Mi-24V";
		vehicleClass = "pojazdylatajace";
		crew = "pilot";
		faction = "Faction_A3C";
		driver = "pilot";
		side = 1;
		hiddenSelectionsTextures[] = {
			"pam_air_vehicles\pam_mi24\data\PL\mi24p_PL.paa",
			"pam_air_vehicles\pam_mi24\data\PL\mi24p_PL2.paa"
		};
	};

	//Polskie Mi8
	class RHS_Mi8mt_Cargo_vvs; // Transport
	class RHS_Mi8mt_vvs; // Transport + pkm
	class RHS_Mi8MTV3_FAB_vvs; // Z bombami
	class RHS_Mi8AMTSh_vvs; // Same rakiety
	class RHS_Mi8amt_vvs; // Medyczny
	class PAM_Mi8mt_Cargo_PL: RHS_Mi8mt_Cargo_vvs // Transport
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
	class PAM_Mi8mt_PL: RHS_Mi8mt_vvs // Transport + pkm
	{
		scope = 2;
		displayName = "Mi-17 (Transport + PKM)";
		vehicleClass = "pojazdylatajace";
		crew = "pilot";
		faction = "Faction_A3C";
		driver = "pilot";
		side = 1;
		hiddenSelectionsTextures[] = {
			"pam_air_vehicles\pam_mi17\data\pl\mi17_body_pl_CO.paa",
			"pam_air_vehicles\pam_mi17\data\pl\mi17_det_pl_CO.paa"
		};
	};
	class PAM_Mi8MTV3_FAB_PL: RHS_Mi8MTV3_FAB_vvs // Z bombami
	{
		scope = 2;
		displayName = "Mi-8 (Bomby)";
		vehicleClass = "pojazdylatajace";
		crew = "pilot";
		faction = "Faction_A3C";
		driver = "pilot";
		side = 1;
		hiddenSelectionsTextures[] = {
			"pam_air_vehicles\pam_mi17\data\pl\mi17_body_pl_CO.paa",
			"pam_air_vehicles\pam_mi17\data\pl\mi17_det_pl_CO.paa"
		};
	};
	class PAM_Mi8AMTSh_PL: RHS_Mi8AMTSh_vvs // Same rakiety
	{
		scope = 2;
		displayName = "Mi-8 (Rakiety)";
		vehicleClass = "pojazdylatajace";
		crew = "pilot";
		faction = "Faction_A3C";
		driver = "pilot";
		side = 1;
		hiddenSelectionsTextures[] = {
			"pam_air_vehicles\pam_mi17\data\pl\mi17_body_pl_CO.paa",
			"pam_air_vehicles\pam_mi17\data\pl\mi17_det_pl_CO.paa"
		};
	};
	class PAM_Mi8amt_PL: RHS_Mi8amt_vvs // Medyczny
	{
		scope = 2;
		displayName = "Mi-17 (Medevac)";
		vehicleClass = "pojazdylatajace";
		crew = "pilot";
		faction = "Faction_A3C";
		driver = "pilot";
		side = 1;
		hiddenSelectionsTextures[] = {
			"pam_air_vehicles\pam_mi17\data\pl\mi17_body_med_co.paa",
			"pam_air_vehicles\pam_mi17\data\pl\mi17_det_pl_CO.paa"
		};
	};
};