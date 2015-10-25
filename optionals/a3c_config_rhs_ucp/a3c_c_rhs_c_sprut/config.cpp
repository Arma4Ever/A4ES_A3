class CfgPatches
{
	class a3c_c_rhs_c_sprut
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhs_c_sprut"};
		author[] = {"A3C"};
		authorUrl = "";
		versionDesc = "";
		version = "";
		text = "";
		magazines[] = {};
		ammo[] = {};
	};
};
class DefaultEventhandlers;
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
		class EventHandlers;
	};
	class rhs_a3spruttank_base: Tank_F
	{
		vehicleClass = "a3c_rhs_vehclass_art";
		displayName = "$STR_SPRUT_Name";
		faction = "a3c_rhs_faction_russian";
		class EventHandlers: DefaultEventhandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call compile preProcessFile '\rhsafrf\addons\rhs_c_sprut\scripts\rhs_sprut_init.sqf'";
			fired = "_this call SLX_XEH_EH_Fired;_this spawn RHS_fnc_Sprut_autoloader; _this call (uinamespace getvariable 'RHS_fnc_effectFired')";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
		class UserActions
		{
			class LowerSusp
			{
				displayName = "$STR_UA_LowerSusp";
				position = "";
				radius = 5;
				condition = "(player == driver this) && (2 > speed this) && !(surfaceIsWater getPos this) && getmass this <19000";
				statement = "this setmass [(getmass this)*5,6];this setVelocity [0.01,0.01,0.01]";
				onlyForPlayer = 1;
			};
			class RaiseSusp: LowerSusp
			{
				displayName = "$STR_UA_RaiseSusp";
				condition = "(player == driver this) && (2 > speed this) && !(surfaceIsWater getPos this) && getmass this >19000";
				statement = "this setmass [18000,6];this setVelocity [0.01,0.01,0.01]";
			};
		};
	};
	class rhs_sprut_vdv: rhs_a3spruttank_base
	{
		displayName = "$STR_SPRUT_Name";
	};
	class rhs_bmd4_vdv: rhs_a3spruttank_base
	{
		vehicleClass = "a3c_rhs_vehclass_apc";
		displayName = "$STR_BMD4_Name";
		faction = "a3c_rhs_faction_russian";
		class UserActions
		{
			class LowerSusp
			{
				displayName = "$STR_UA_LowerSusp";
				position = "";
				radius = 5;
				condition = "(player == driver this) && (2 > speed this) && !(surfaceIsWater getPos this) && getmass this <15000";
				statement = "this setmass [(getmass this)*4,7];this setVelocity [0.01,0.01,0.01]";
				onlyForPlayer = 1;
			};
			class RaiseSusp: LowerSusp
			{
				displayName = "$STR_UA_RaiseSusp";
				condition = "(player == driver this) && (2 > speed this) && !(surfaceIsWater getPos this) && getmass this >15000";
				statement = "this setmass [(getmass this)/4,7];this setVelocity [0.01,0.01,0.01]";
			};
		};
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call compile preProcessFile '\rhsafrf\addons\rhs_c_sprut\scripts\rhs_sprut_init.sqf'";
			fired = "_this call SLX_XEH_EH_Fired;_this spawn RHS_fnc_BMD4_autoloader; _this call (uinamespace getvariable 'RHS_fnc_effectFired')";
		};
	};
	class rhs_bmd4m_vdv: rhs_bmd4_vdv
	{
		vehicleClass = "a3c_rhs_vehclass_apc";
	};
	class rhs_bmd4ma_vdv: rhs_bmd4m_vdv
	{
		vehicleClass = "a3c_rhs_vehclass_apc";
		displayName = "$STR_BMD4MA_Name";
	};
};