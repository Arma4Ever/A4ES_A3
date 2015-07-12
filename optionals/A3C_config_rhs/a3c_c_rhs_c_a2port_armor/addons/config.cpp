class CfgPatches
{
	class a3c_c_rhs_c_a2port_armor
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhs_c_a2port_armor"};
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
	class APC_Tracked_02_base_F: Tank_F{};
	class Car;
	class Car_F: Car
	{
		class NewTurret;
		class Sounds;
		class HitPoints
		{
			class HitBody;
			class HitEngine;
			class HitFuel;
			class HitLFWheel;
			class HitLBWheel;
			class HitLMWheel;
			class HitLF2Wheel;
			class HitRFWheel;
			class HitRBWheel;
			class HitRMWheel;
			class HitRF2Wheel;
		};
	};
	class Wheeled_APC_F: Car_F
	{
		class ViewOptics;
		class ViewCargo;
		class Sounds: Sounds
		{
			class Engine;
			class Movement;
		};
		class NewTurret;
		class Turrets
		{
			class MainTurret: NewTurret
			{
				class ViewOptics;
				class Turrets
				{
					class CommanderOptics;
				};
			};
		};
		class AnimationSources;
		class EventHandlers;
		class CommanderOptics;
	};
	class rhs_btr_base: Wheeled_APC_F
	{
		class HitPoints: HitPoints{};
	};
	class rhs_btr60_base: rhs_btr_base
	{
		displayName = "$STR_RHS_btr60_Name";
		class UserActions
		{
			class openDriverViewHatch
			{
				displayName = "$STR_RHS_BTR70_OpenShield";
				position = "driverAction";
				radius = 2.5;
				showWindow = 0;
				condition = "(player == driver this) and (this doorPhase 'driverViewHatch' < 0.5)";
				statement = "this animatedoor ['driverViewHatch',1];";
				onlyForPlayer = 1;
			};
			class closeDriverViewHatch: openDriverViewHatch
			{
				displayName = "$STR_RHS_BTR70_CloseShield";
				condition = "(player == driver this) and (this doorPhase 'driverViewHatch' > 0.5)";
				statement = "this animatedoor ['driverViewHatch',0];";
			};
			class openCommanderViewHatch: openDriverViewHatch
			{
				position = "comAction";
				condition = "(player == commander this) and (this doorPhase 'commanderViewHatch' < 0.5)";
				statement = "this animatedoor ['commanderViewHatch',1];";
			};
			class closeCommanderViewHatch: openCommanderViewHatch
			{
				displayName = "$STR_RHS_BTR70_CloseShield";
				condition = "(player == commander this) and (this doorPhase 'commanderViewHatch' > 0.5)";
				statement = "this animatedoor ['commanderViewHatch',0];";
			};
		};
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call rhs_fnc_btr_init;(_this select 0) addeventhandler ['HandleDamage',{[_this,0.5,0.002,0.9,0.2] spawn rhs_fnc_activeTirePressure; _this select 2;} ];";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
	};
	class rhs_btr60_vmf: rhs_btr60_base
	{
		displayName = "$STR_RHS_btr60_Name";
		faction = "a3c_rhs_faction_russian";
		vehicleClass = "a3c_rhs_vehclass_apc";
	};
	class rhs_btr60_vdv: rhs_btr60_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_btr60_vv: rhs_btr60_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_btr60_msv: rhs_btr60_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_zsutank_base: APC_Tracked_02_base_F
	{
		vehicleClass = "a3c_rhs_vehclass_aa";
		displayName = "$STR_RHS_ZSU_Name";
		faction = "a3c_rhs_faction_russian";
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call compile preProcessFile '\rhsafrf\addons\rhs_c_bmp3\scripts\rhs_bmp3_init.sqf'";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
			fired = "_this call SLX_XEH_EH_Fired;_this call RHS_fnc_zsu_shake; _this call (uinamespace getvariable 'BIS_fnc_effectFired')";
		};
	};
	class rhs_zsu234_aa: rhs_zsutank_base
	{
		displayName = "$STR_RHS_ZSU_Name";
		faction = "a3c_rhs_faction_russian";
		vehicleClass = "a3c_rhs_vehclass_aa";
	};
};