class CfgPatches
{
	class a3c_c_rhs_c_tanks
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhs_c_tanks", "rhs_c_t72"};
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
	class RHS_RscWeaponT72_FCS: RscUnitInfo
	{
		onLoad = "if (isNil 'a3_ui_initDisplay') then {a3_ui_initDisplay = compile preprocessfilelinenumbers 'A3\ui_f\scripts\initDisplay.sqf'}; ['onLoad',_this,'RscUnitInfo','IGUI'] call a3_ui_initDisplay; _this call RHS_fnc_rF_t72";
	};
	class RHS_RscWeaponT72_Comm: RscUnitInfo
	{
		onLoad = "[] call RHS_fnc_comm_t72";
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
	class rhs_tank_base: Tank_F
	{
		displayName = "$STR_RHS_T80B";
		vehicleClass = "a3c_rhs_vehclass_tank";
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this spawn RHS_fnc_t80_init;";
			fired = "_this call SLX_XEH_EH_Fired;_this spawn RHS_fnc_t80_autoloader; _this call (uinamespace getvariable 'RHS_fnc_effectFired')";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
			getOut = "_this call SLX_XEH_EH_GetOut;if((_this select 3) isEqualTo [0,1])then{[[(_this select 0),false],'rhs_fnc_t72_hatch',(_this select 0)] call BIS_fnc_MP}";
		};
		class UserActions
		{
			class trunk_open
			{
				displayName = "Use NSVT";
				position = "trunk_action";
				radius = 2;
				onlyForplayer = 0;
				condition = "this animationPhase 'RHS_T80B_Hatch_commander'>0.5 and ((call rhs_fnc_findPlayer) == commander this)";
				statement = "(call rhs_fnc_findPlayer) action ['moveToTurret', this, [0,1]];[[this,true],'rhs_fnc_t72_hatch',this] call BIS_fnc_MP";
			};
			class trunk_close: trunk_open
			{
				displayName = "Leave NSVT";
				condition = "vehicle (call rhs_fnc_findPlayer) turretUnit [0,1] == (call rhs_fnc_findPlayer)";
				statement = "(call rhs_fnc_findPlayer) action ['moveToTurret', this, [0,0]];[[this,false],'rhs_fnc_t72_hatch',this] call BIS_fnc_MP";
			};
		};
	};
	class rhs_t80b: rhs_tank_base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_t80bk: rhs_t80b
	{
		displayName = "$STR_RHS_T80BK";
	};
	class rhs_t80bv: rhs_t80b
	{
		displayName = "$STR_RHS_T80BV";
	};
	class rhs_t80bvk: rhs_t80bv
	{
		displayName = "$STR_RHS_T80BVK";
	};
	class rhs_t80: rhs_t80b
	{
		displayName = "$STR_RHS_T80";
		class UserActions{};
	};
	class rhs_t80a: rhs_t80bv
	{
		displayName = "$STR_RHS_T80A";
		class UserActions{};
	};
	class rhs_t80u: rhs_t80a
	{
		displayName = "$STR_RHS_T80U";
	};
	class rhs_t80u_test: rhs_t80u
	{
		displayName = "T80U Test";
	};
	class rhs_t80u45m: rhs_t80u
	{
		displayName = "$STR_RHS_T80U45M";
	};
	class rhs_t80ue1: rhs_t80a
	{
		displayName = "$STR_RHS_T80UE1";
	};
	class rhs_t80um: rhs_t80u
	{
		displayName = "$STR_RHS_T80UM";
	};
	class rhs_a3t72tank_base: Tank_F
	{
		vehicleClass = "a3c_rhs_vehclass_tank";
		displayName = "$STR_T72BA_Name";
		faction = "a3c_rhs_faction_russian";
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call RHS_fnc_T72_init";
			fired = "_this call SLX_XEH_EH_Fired;_this spawn RHS_fnc_T72_autoloader; _this call (uinamespace getvariable 'RHS_fnc_effectFired')";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
			getOut = "_this call SLX_XEH_EH_GetOut;if((_this select 3) isEqualTo [0,1])then{[[(_this select 0),false],'rhs_fnc_t72_hatch',(_this select 0)] call BIS_fnc_MP}";
		};
		class UserActions
		{
			class trunk_open
			{
				displayName = "Use NSVT";
				position = "trunk_action";
				radius = 2;
				onlyForplayer = 0;
				condition = "this animationPhase 'HatchCommander'>0.5 and ((call rhs_fnc_findPlayer) == commander this)";
				statement = "(call rhs_fnc_findPlayer) action ['moveToTurret', this, [0,1]];[[this,true],'rhs_fnc_t72_hatch',this] call BIS_fnc_MP";
			};
			class trunk_close: trunk_open
			{
				displayName = "Leave NSVT";
				condition = "vehicle (call rhs_fnc_findPlayer) turretUnit [0,1] == (call rhs_fnc_findPlayer)";
				statement = "(call rhs_fnc_findPlayer) action ['moveToTurret', this, [0,0]];[[this,false],'rhs_fnc_t72_hatch',this] call BIS_fnc_MP";
			};
		};
	};
	class rhs_t72ba_tv: rhs_a3t72tank_base
	{
		displayName = "$STR_T72BA_Name";
	};
	class rhs_t72bb_tv: rhs_a3t72tank_base
	{
		displayName = "$STR_T72BB_Name";
	};
	class rhs_t72bc_tv: rhs_a3t72tank_base
	{
		displayName = "$STR_T72BC_Name";
	};
	class rhs_t72bd_tv: rhs_a3t72tank_base
	{
		displayName = "$STR_T72BD_Name";
	};
	class rhs_t90_tv: rhs_t72bd_tv
	{
		displayName = "T-90";
	};
};