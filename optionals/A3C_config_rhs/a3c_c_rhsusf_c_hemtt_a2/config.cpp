class CfgPatches
{
	class a3c_c_rhsusf_c_hemtt_a2
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhsusf_c_hemtt_a2"};
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
		class HitPoints;
		class NewTurret;
	};
	class Car_F: Car
	{
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
			class HitLFWheel;
			class HitLF2Wheel;
			class HitRFWheel;
			class HitRF2Wheel;
			class HitBody;
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitGlass6;
		};
		class EventHandlers;
		class AnimationSources;
	};
	class Truck_F: Car_F
	{
		class ViewPilot;
		class HitPoints: HitPoints
		{
			class HitLFWheel;
			class HitLBWheel;
			class HitLMWheel;
			class HitLF2Wheel;
			class HitRFWheel;
			class HitRBWheel;
			class HitRMWheel;
			class HitRF2Wheel;
		};
		class AnimationSources;
	};
	class Truck_01_base_F: Truck_F{};
	class rhsusf_HEMTT_A2_base: Truck_01_base_F
	{
		faction = "Faction_USAM";
		displayName = "M977A2";
		vehicleClass = "pojazdyladowe2";
		class EventHandlers: EventHandlers
		{
			dammaged = "_this call SLX_XEH_EH_Dammaged;_this call rhs_fnc_fuelLeak;";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
	};
	class rhsusf_M977A2_usarmy_wd: rhsusf_HEMTT_A2_base
	{
		displayName = "M977A2 WD";
		faction = "Faction_USAM";
	};
	class rhsusf_M977A2_CPK_usarmy_wd: rhsusf_M977A2_usarmy_wd
	{
		displayName = "M977A2 WD (CPK)";
	};
	class rhsusf_M978A2_usarmy_wd: rhsusf_M977A2_usarmy_wd
	{
		displayName = "M978A2 WD";
	};
	class rhsusf_M978A2_CPK_usarmy_wd: rhsusf_M978A2_usarmy_wd
	{
		displayName = "M978A2 WD (CPK)";
	};
};