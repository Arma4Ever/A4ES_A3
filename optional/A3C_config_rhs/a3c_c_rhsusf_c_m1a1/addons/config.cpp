class CfgPatches
{
	class a3c_c_rhsusf_c_m1a1
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhsusf_c_m1a1"};
		author[] = {"A3C"};
		authorUrl = "";
		versionDesc = "";
		version = "";
		text = "";
		magazines[] = {};
		ammo[] = {};
	};
};
class RscInGameUI
{
	class RscUnitInfo;
	class RHS_RscWeaponM1_Commander: RscUnitInfo
	{
		onLoad = "if (isNil 'a3_ui_initDisplay') then {a3_ui_initDisplay = compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'}; ['onLoad',_this,'RscUnitInfo','IGUI'] call a3_ui_initDisplay; _this spawn RHS_fnc_M1_Comm";
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
	class MBT_01_base_F: Tank_F
	{
		class EventHandlers;
	};
	class rhsusf_m1a1tank_base: MBT_01_base_F
	{
		displayName = "M1A1SA";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call RHS_fnc_M1_init";
			fired = "_this call SLX_XEH_EH_Fired;_this spawn RHS_fnc_Abrams_Loader; _this call (uinamespace getvariable 'BIS_fnc_effectFired')";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
	};
	class rhsusf_m1a1aimwd_usarmy: rhsusf_m1a1tank_base
	{
		displayName = "M1A1SA WD";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
	class rhsusf_m1a1aimd_usarmy: rhsusf_m1a1tank_base
	{
		displayName = "M1A1SA";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
	class rhsusf_m1a1aim_tuski_wd: rhsusf_m1a1tank_base
	{
		displayName = "M1A1SA WD (TUSK I)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
	class rhsusf_m1a1aim_tuski_d: rhsusf_m1a1aim_tuski_wd
	{
		displayName = "M1A1SA (TUSK I)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
	class rhsusf_m1a1fep_d: rhsusf_m1a1tank_base
	{
		displayName = "M1A1FEP";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
	class rhsusf_m1a1fep_wd: rhsusf_m1a1tank_base
	{
		displayName = "M1A1FEP WD";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
	class rhsusf_m1a1fep_od: rhsusf_m1a1tank_base
	{
		displayName = "M1A1FEP (O)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
};