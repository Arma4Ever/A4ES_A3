class CfgPatches
{
	class a3c_c_rhsusf_c_m109
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhsusf_c_m109"};
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
	class MBT_01_base_F: Tank_F{};
	class MBT_01_arty_base_F: MBT_01_base_F
	{
		class Turrets: Turrets
		{
			class MainTurret: MainTurret
			{
				class Turrets: Turrets
				{
					class CommanderOptics: CommanderOptics{};
				};
			};
		};
		class AnimationSources;
		class EventHandlers;
	};
	class rhsusf_m109tank_base: MBT_01_arty_base_F
	{
		displayName = "M109A6";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
	class rhsusf_m109_usarmy: rhsusf_m109tank_base
	{
		displayName = "M109A6 WD";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
	class rhsusf_m109d_usarmy: rhsusf_m109tank_base
	{
		displayName = "M109A6D";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
};