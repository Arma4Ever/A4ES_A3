class CfgPatches
{
	class a3c_rhsusf_ace_gau8
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"RHS_US_A2_AirImport"};
		author[]={"SzwedzikPL"};
		authorUrl = "";
		versionDesc = "";
		version = "";
		text = "";
		magazines[] = {};
		ammo[] = {};
	};
};

class cfgVehicles {
	class Plane_CAS_01_base_F;
	class RHS_A10: Plane_CAS_01_base_F {
		weapons[] = {"Gatling_30mm_Plane_CAS_01_F","rhs_weap_SidewinderLauncher","rhs_weap_agm65","rhs_weap_FFARLauncher","rhs_weap_gbu12","CMFlareLauncher"};
		magazines[] = {"rhs_mag_agm65","rhs_mag_agm65","rhs_mag_Sidewinder_2","rhs_mag_gbu12_4","rhs_mag_ANALQ131","rhs_mag_FFAR_14","1000Rnd_Gatling_30mm_Plane_CAS_01_F","240Rnd_CMFlare_Chaff_Magazine"};
	};
};