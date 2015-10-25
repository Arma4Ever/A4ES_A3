class CfgPatches
{
	class a3c_c_rhs_c_bmd
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhs_c_bmd"};
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
		class EventHandlers;
	};
	class rhs_bmd_base: Tank_F
	{
		displayName = "$STR_BMD2_Name";
		vehicleClass = "a3c_rhs_vehclass_apc";
		faction = "a3c_rhs_faction_russian";
		class UserActions
		{
			class LowerSusp
			{
				displayName = "$STR_UA_LowerSusp";
				position = "";
				radius = 5;
				condition = "(player == driver this) && (2 > speed this) && !(surfaceIsWater getPos this) && getmass this <8400";
				statement = "this setmass [7600*1.7,6];this setVelocity [0.01,0.01,0.01]";
				onlyForPlayer = 1;
			};
			class RaiseSusp: LowerSusp
			{
				displayName = "$STR_UA_RaiseSusp";
				condition = "(player == driver this) && (2 > speed this) && !(surfaceIsWater getPos this) && getmass this >12000";
				statement = "this setmass [7600,6];this setVelocity [0.01,0.01,0.01]";
			};
		};
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call rhs_fnc_bmd_init";
			fired = "_this call SLX_XEH_EH_Fired;_this spawn rhs_fnc_9m14_fired;  _this call (uinamespace getvariable 'RHS_fnc_effectFired')";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
	};
	class rhs_bmd2_base: rhs_bmd_base
	{
		class UserActions
		{
			class LowerSusp
			{
				displayName = "$STR_UA_LowerSusp";
				position = "";
				radius = 5;
				condition = "(player == driver this) && (2 > speed this) && !(surfaceIsWater getPos this) && getmass this <8400";
				statement = "this setmass [8200*1.7,6];this setVelocity [0.01,0.01,0.01]";
				onlyForPlayer = 1;
			};
			class RaiseSusp: LowerSusp
			{
				displayName = "$STR_UA_RaiseSusp";
				condition = "(player == driver this) && (2 > speed this) && !(surfaceIsWater getPos this) && getmass this >13000";
				statement = "this setmass [8200,6];this setVelocity [0.01,0.01,0.01]";
			};
		};
		class EventHandlers: EventHandlers
		{
			fired = "_this call SLX_XEH_EH_Fired;_this call rhs_fnc_at14_fired;  _this call (uinamespace getvariable 'RHS_fnc_effectFired')";
		};
	};
	class rhs_bmd1_base: rhs_bmd_base
	{
		displayName = "$STR_BMD1_Name";
		class EventHandlers;
	};
	class rhs_bmd1: rhs_bmd1_base
	{

	};
	class rhs_bmd1k: rhs_bmd1_base
	{
		displayName = "$STR_BMD1K_Name";
	};
	class rhs_bmd1p: rhs_bmd1_base
	{
		displayName = "$STR_BMD1P_Name";
		class EventHandlers: EventHandlers
		{
			fired = "_this call SLX_XEH_EH_Fired;_this call rhs_fnc_at14_fired;  _this call (uinamespace getvariable 'RHS_fnc_effectFired')";
		};
	};
	class rhs_bmd1pk: rhs_bmd1_base
	{
		displayName = "$STR_BMD1PK_Name";
		class EventHandlers: EventHandlers
		{
			fired = "_this call SLX_XEH_EH_Fired;_this call rhs_fnc_at14_fired;  _this call (uinamespace getvariable 'RHS_fnc_effectFired')";
		};
	};
	class rhs_bmd1r: rhs_bmd1_base
	{
		displayName = "$STR_BMD1R_Name";
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call compile preProcessFile '\rhsafrf\addons\rhs_c_bmd\scripts\rhs_bmd_init.sqf'";
			fired = "_this spawn fRHSBMD1RRocketonfired;  _this call (uinamespace getvariable 'RHS_fnc_effectFired')";
		};
	};
	class rhs_bmd2: rhs_bmd2_base
	{

	};
	class rhs_bmd2m: rhs_bmd2
	{
		displayName = "$STR_BMD2M_Name";
	};
	class rhs_bmd2k: rhs_bmd2
	{
		displayName = "$STR_BMD2K_Name";
	};
};