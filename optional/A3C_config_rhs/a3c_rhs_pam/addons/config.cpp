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
class Extended_PreInit_EventHandlers
{
    class a3c_rhs_pam
    {
        init = "call ('\A3C_config_rhs\a3c_rhs_pam\addons\XEH_preInit.sqf' call SLX_XEH_COMPILE)";
    };
};
class CfgVehicles
{
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
};