class CfgPatches
{
	class a3c_c_rhs_c_btr
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhs_c_btr"};
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
	class Car;
	class Car_F: Car
	{
		class ViewPilot;
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
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitGlass6;
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
			};
		};
		class AnimationSources;
		class EventHandlers;
		class CommanderOptics;
	};
	class rhs_btr_base: Wheeled_APC_F
	{
		faction = "a3c_rhs_faction_russian";
		displayName = "$STR_RHS_BTR70_Name";
		vehicleClass = "a3c_rhs_vehclass_apc";
		class UserActions
		{
			class openDriverViewHatch
			{
				displayName = "$STR_RHS_BTR70_OpenShield";
				position = "";
				radius = 5;
				hideWindow = 0;
				condition = "(player == driver this) && (this animationPhase 'driverViewHatch' < 0.5)";
				statement = "this animateDoor ['driverViewHatch',1];";
				onlyForPlayer = 1;
			};
			class closeDriverViewHatch: openDriverViewHatch
			{
				displayName = "$STR_RHS_BTR70_CloseShield";
				condition = "(player == driver this) && (this animationPhase 'driverViewHatch' > 0.5)";
				statement = "this animateDoor ['driverViewHatch',0];";
			};
			class openCommanderViewHatch: openDriverViewHatch
			{
				condition = "((this turretUnit [1]) == player) && (this animationPhase 'commanderViewHatch' < 0.5)";
				statement = "this animateDoor ['commanderViewHatch',1];";
			};
			class closeCommanderViewHatch: closeDriverViewHatch
			{
				condition = "((this turretUnit [1]) == player) && (this animationPhase 'commanderViewHatch' > 0.5)";
				statement = "this animateDoor ['commanderViewHatch',0];";
			};
			class openl_door: openDriverViewHatch
			{
				displayName = "$STR_RHS_BTR70_Openl_door";
				position = "l_door";
				radius = 2;
				condition = "((this animationPhase 'l_door' == 0)&&(speed this <= 10)&&(!surfaceIsWater [(getposASL this select 0), (getposASL this select 1)]))";
				statement = "this animateDoor ['l_door',1];";
			};
			class closel_door: openl_door
			{
				displayName = "$STR_RHS_BTR70_Closel_door";
				condition = "(this animationPhase 'l_door' == 1)";
				statement = "this animateDoor ['l_door',0];";
			};
			class openr_door: openl_door
			{
				displayName = "$STR_RHS_BTR70_Openr_door";
				condition = "((this animationPhase 'r_door' == 0)&&(speed this <= 10)&&(!surfaceIsWater [(getposASL this select 0), (getposASL this select 1)]))";
				statement = "this animateDoor ['r_door',1];";
			};
			class closer_door: openr_door
			{
				displayName = "$STR_RHS_BTR70_Closer_door";
				condition = "(this animationPhase 'r_door' == 1)";
				statement = "this animateDoor ['r_door',0];";
			};
			class opent_door: openr_door
			{
				displayName = "$STR_RHS_BTR70_Opent_door";
				condition = "((this animationPhase 't_door_1' == 0)&&((speed this > 10)||(surfaceIsWater [(getposASL this select 0), (getposASL this select 1)])))";
				statement = "this animateDoor ['t_door_1',1];";
			};
			class closet_door: openr_door
			{
				displayName = "$STR_RHS_BTR70_Closet_door";
				condition = "(this animationPhase 't_door_1' == 1)";
				statement = "this animateDoor ['t_door_1',0];";
			};
		};
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call rhs_fnc_btr_init;(_this select 0) addeventhandler ['HandleDamage',{[_this,0.1,0.002,0.9,0.2] spawn rhs_fnc_activeTirePressure; _this select 2;} ];";
			fired = "_this call (uinamespace getvariable 'RHS_fnc_effectFired')";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
	};
	class rhs_btr70_vmf: rhs_btr_base
	{
		faction = "a3c_rhs_faction_russian";
		displayName = "$STR_RHS_BTR70_Name";
		vehicleClass = "a3c_rhs_vehclass_apc";
	};
	class rhs_btr70_vdv: rhs_btr70_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_btr70_vv: rhs_btr70_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_btr70_msv: rhs_btr70_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_btr80_msv: rhs_btr70_msv
	{
		class UserActions
		{
			class openDriverViewHatch
			{
				displayName = "$STR_RHS_BTR70_OpenShield";
				position = "";
				radius = 5;
				hideWindow = 0;
				condition = "(player == driver this) && (this animationPhase 'driverViewHatch' < 0.5)";
				statement = "this animateDoor ['driverViewHatch',1];";
				onlyForPlayer = 1;
			};
			class closeDriverViewHatch: openDriverViewHatch
			{
				displayName = "$STR_RHS_BTR70_CloseShield";
				condition = "(player == driver this) && (this animationPhase 'driverViewHatch' > 0.5)";
				statement = "this animateDoor ['driverViewHatch',0];";
			};
			class openCommanderViewHatch: openDriverViewHatch
			{
				condition = "((this turretUnit [1]) == player) && (this animationPhase 'commanderViewHatch' < 0.5)";
				statement = "this animateDoor ['commanderViewHatch',1];";
			};
			class closeCommanderViewHatch: closeDriverViewHatch
			{
				condition = "((this turretUnit [1]) == player) && (this animationPhase 'commanderViewHatch' > 0.5)";
				statement = "this animateDoor ['commanderViewHatch',0];";
			};
		};
	};
	class rhs_btr80_vdv: rhs_btr80_msv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_btr80_vv: rhs_btr80_msv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_btr80_vmf: rhs_btr80_msv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_btr80a_msv: rhs_btr80_msv
	{
		displayName = "$STR_RHS_BTR80A_Name";
	};
	class rhs_btr80a_vdv: rhs_btr80a_msv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_btr80a_vv: rhs_btr80a_msv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_btr80a_vmf: rhs_btr80a_msv
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
};