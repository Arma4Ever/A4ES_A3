class CfgPatches
{
	class a3c_c_rhsusf_c_m1a2
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhsusf_c_m1a2"};
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
	class MBT_01_base_F: Tank_F{};
	class rhsusf_m1a1tank_base: MBT_01_base_F
	{
		class AnimationSources;
		class HitPoints;
		class EventHandlers;
	};
	class rhsusf_m1a2tank_base: rhsusf_m1a1tank_base
	{
		displayName = "M1A2SEPv1";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
		class UserActions
		{
			class trunk_open
			{
				displayName = "Use M2";
				position = "trunk_action";
				radius = 2;
				onlyForplayer = 0;
				condition = "this animationPhase 'HatchCommander1'>0.5 and ((call rhsusf_fnc_findPlayer) == commander this)";
				statement = "(call rhsusf_fnc_findPlayer) action ['moveToTurret', this, [0,2]];[[this,true],'rhs_fnc_m1_hatch',this] call BIS_fnc_MP";
			};
			class trunk_close: trunk_open
			{
				displayName = "Leave M2";
				condition = "vehicle (call rhsusf_fnc_findPlayer) turretUnit [0,2] == (call rhsusf_fnc_findPlayer)";
				statement = "(call rhsusf_fnc_findPlayer) action ['moveToTurret', this, [0,0]];[[this,false],'rhs_fnc_m1_hatch',this] call BIS_fnc_MP;";
			};
		};
		class EventHandlers: EventHandlers
		{
			getOut = "_this call SLX_XEH_EH_GetOut;if((_this select 3) isEqualTo [0,2])then{[[(_this select 0),false],'rhs_fnc_m1_hatch',(_this select 0)] call BIS_fnc_MP;}";
		};
	};
	class rhsusf_m1a2sep1d_usarmy: rhsusf_m1a2tank_base
	{
		displayName = "M1A2SEPv1";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
	class rhsusf_m1a2sep1wd_usarmy: rhsusf_m1a2tank_base
	{
		displayName = "M1A2SEPv1 WD";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
	class rhsusf_m1a2sep1tuskid_usarmy: rhsusf_m1a2tank_base
	{
		displayName = "M1A2SEPv1 (TUSK I)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
	class rhsusf_m1a2sep1tuskiwd_usarmy: rhsusf_m1a2sep1tuskid_usarmy
	{
		displayName = "M1A2SEPv1 WD (TUSK I)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
	class rhsusf_m1a2sep1tuskiiwd_usarmy: rhsusf_m1a2sep1tuskid_usarmy
	{
		displayName = "M1A2SEPv1 WD (TUSK II)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
	class rhsusf_m1a2sep1tuskiid_usarmy: rhsusf_m1a2sep1tuskid_usarmy
	{
		displayName = "M1A2SEPv1 (TUSK II)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
};