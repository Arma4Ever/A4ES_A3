class CfgPatches
{
	class a3c_c_rhs_c_a3retex
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhs_c_a3retex"};
		author[] = {"A3C"};
		authorUrl = "";
		versionDesc = "";
		version = "";
		text = "";
		magazines[] = {};
		ammo[] = {};
	};
};
class CfgVehicles
{
	class O_Truck_03_repair_F;
	class O_Heli_Light_02_unarmed_F;
	class rhs_typhoon_base: O_Truck_03_repair_F
	{
		displayName = "$STR_RHS_KAMAZ63968_NAME";
	};
	class rhs_typhoon_vdv: rhs_typhoon_base
	{
		vehicleClass = "a3c_rhs_vehclass_truck";
		faction = "a3c_rhs_faction_russian";
		scope = 2;
	};
	class rhs_ka60_grey: O_Heli_Light_02_unarmed_F
	{
		displayName = "Ka-60";
		vehicleClass = "a3c_rhs_vehclass_heli";
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_ka60_c: rhs_ka60_grey
	{
		faction = "a3c_rhs_faction_russian";
	};
};