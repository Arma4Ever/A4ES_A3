class CfgPatches
{
	class a3c_c_rhs_c_heavyweapons
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhs_c_heavyweapons"};
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
	class LandVehicle;
	class StaticWeapon: LandVehicle
	{
		class Turrets;
		class MainTurret;
	};
	class StaticMGWeapon: StaticWeapon{};
	class StaticATWeapon: StaticWeapon{};
	class StaticAAWeapon: StaticWeapon{};
	class StaticCannon: StaticWeapon
	{
		class ViewOptics;
	};
	class StaticGrenadeLauncher: StaticWeapon
	{
		class ViewOptics;
	};
	class rhs_nsv_tripod_base: StaticMGWeapon
	{
		displayName = "NSV Tripod";
	};
	class RHS_NSV_TriPod_MSV: rhs_nsv_tripod_base
	{
		vehicleclass = "a3c_rhs_vehclass_static";
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_NSV_TriPod_VDV: rhs_nsv_tripod_base
	{
		vehicleclass = "a3c_rhs_vehclass_static";
		faction = "a3c_rhs_faction_russian";
	};
	class Bag_Base;
	class Weapon_Bag_Base: Bag_Base
	{
		class assembleInfo;
	};
	class RHS_NSV_Gun_Bag: Weapon_Bag_Base
	{
		displayName = "NSV Gun Bag";
		faction = "a3c_rhs_faction_russian";
	};
	class RHS_NSV_Tripod_Bag: Weapon_Bag_Base
	{
		displayName = "NSV Tripod Bag";
		faction = "a3c_rhs_faction_russian";
	};
};