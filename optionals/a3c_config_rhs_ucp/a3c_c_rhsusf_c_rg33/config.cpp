class CfgPatches
{
	class a3c_c_rhsusf_c_rg33
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhsusf_c_rg33"};
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
	class Car: LandVehicle
	{
		class NewTurret;
	};
	class Car_F: Car
	{
		class AnimationSources;
		class Turrets
		{
			class MainTurret: NewTurret
			{
				disableSoundAttenuation = 1;
				class ViewOptics;
			};
		};
		class HitPoints
		{
			class HitFuel;
			class HitEngine;
			class HitBody;
			class HitLFWheel;
			class HitLF2Wheel;
			class HitRFWheel;
			class HitRF2Wheel;
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitGlass6;
		};
		class Sounds;
	};
	class MRAP_01_base_F: Car_F{};
	class rhsusf_rg33_base: MRAP_01_base_F
	{
		displayName = "RG-33 (Unarmed)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
	};
	class rhsusf_rg33_d: rhsusf_rg33_base
	{
		displayName = "RG-33";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
	};
	class rhsusf_rg33_wd: rhsusf_rg33_base
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
		displayName = "RG-33 WD";
	};
	class rhsusf_rg33_m2_d: rhsusf_rg33_base
	{
		displayName = "RG-33 (M2)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
	};
	class rhsusf_rg33_m2_wd: rhsusf_rg33_m2_d
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
		displayName = "RG-33 WD (M2)";
	};
	class rhsusf_rg33_usmc_d: rhsusf_rg33_d
	{
		scope = 1;
		displayName = "RG-33";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
	};
	class rhsusf_rg33_usmc_wd: rhsusf_rg33_wd
	{
		scope = 1;
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
		displayName = "RG-33 WD";
	};
	class rhsusf_rg33_m2_usmc_d: rhsusf_rg33_m2_d
	{
		scope = 1;
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
		displayName = "RG-33 (M2)";
	};
	class rhsusf_rg33_m2_usmc_wd: rhsusf_rg33_m2_d
	{
		scope = 1;
		displayName = "RG-33 WD (M2)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyladowe2";
		//crew = "us_woodland1";
	};
};