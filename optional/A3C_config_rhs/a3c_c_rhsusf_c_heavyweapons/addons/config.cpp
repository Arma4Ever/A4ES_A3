class CfgPatches
{
	class a3c_c_rhsusf_c_heavyweapons
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhsusf_c_heavyweapons"};
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
	class rhs_m2staticmg_base: StaticMGWeapon
	{
		scope = 1;
	};
	class RHS_M2StaticMG_MiniTripod_base: rhs_m2staticmg_base
	{
		scope = 1;
	};
	class RHS_M2StaticMG_D: RHS_M2StaticMG_base
	{
		scope = 1;
	};
	class RHS_M2StaticMG_MiniTripod_D: RHS_M2StaticMG_MiniTripod_base
	{
		scope = 1;
	};
	class RHS_M2StaticMG_WD: RHS_M2StaticMG_base
	{
		scope = 1;
	};
	class RHS_M2StaticMG_MiniTripod_WD: RHS_M2StaticMG_MiniTripod_base
	{
		scope = 1;
	};
	class RHS_MK19_TriPod_base: StaticGrenadeLauncher
	{
		scope = 1;
	};
	class RHS_MK19_TriPod_D: RHS_MK19_TriPod_base
	{
		scope = 1;
	};
	class RHS_MK19_TriPod_WD: RHS_MK19_TriPod_base
	{
		scope = 1;
	};
	class Bag_Base;
	class Weapon_Bag_Base: Bag_Base
	{
		class assembleInfo;
	};
	class RHS_M2_Gun_Bag: Weapon_Bag_Base
	{
		scope = 1;
	};
	class RHS_M2_Tripod_Bag: Weapon_Bag_Base
	{
		scope = 1;
	};
	class RHS_M2_MiniTripod_Bag: RHS_M2_Tripod_Bag
	{
		scope = 1;
	};
	class RHS_Mk19_Gun_Bag: RHS_M2_Gun_Bag
	{
		scope = 1;
	};
	class RHS_Mk19_Tripod_Bag: RHS_M2_Tripod_Bag
	{
		scope = 1;
	};
};