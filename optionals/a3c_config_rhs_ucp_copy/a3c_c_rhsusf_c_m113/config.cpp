class CfgPatches
{
	class a3c_c_rhsusf_c_m113
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhsusf_c_m113"};
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
	class Tank: LandVehicle
	{
		class NewTurret;
		class Sounds;
		class HitPoints;
	};
	class Tank_F: Tank
	{
		class Turrets
		{
			class MainTurret: NewTurret
			{
				class Turrets
				{
					class CommanderOptics;
				};
			};
		};
		class AnimationSources;
		class ViewPilot;
		class ViewOptics;
		class ViewCargo;
		class HeadLimits;
		class HitPoints: HitPoints
		{
			class HitHull;
			class HitEngine;
			class HitLTrack;
			class HitRTrack;
		};
		class Sounds: Sounds
		{
			class Engine;
			class Movement;
		};
	};
	class APC_Tracked_02_base_F: Tank_F
	{
		class EventHandlers;
	};
	class rhsusf_m113tank_base: APC_Tracked_02_base_F
	{
		displayName = "M113A3";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
		class EventHandlers: EventHandlers
		{
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
	};
	class rhsusf_m113_usarmy: rhsusf_m113tank_base
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
		displayName = "M113A3 WD";
	};
	class rhsusf_m113d_usarmy: rhsusf_m113tank_base
	{
		displayName = "M113A3";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
};