class CfgPatches
{
	class a3c_c_rhsusf_c_a2port_armor
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"RHS_US_A2Port_Armor"};
		magazines[] = {};
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
		class CommanderOptics;
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
	class APC_Tracked_03_base_F: Tank_F{};
	class RHS_M2A2_Base: APC_Tracked_03_base_F
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
		displayname = "M2 Bradley";
		class EventHandlers: EventHandlers
		{
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
			getIn = "_this call SLX_XEH_EH_GetIn;_this call rhs_fnc_m2_doors";
			getOut = "_this call SLX_XEH_EH_GetOut;_this call rhs_fnc_m2_doors";
		};
		class UserActions
		{
			class OpenCargoDoor
			{
				displayName = "Open ramp";
				position = "pos driver";
				radius = 15;
				showwindow = 0;
				condition = "this doorPhase 'ramp' == 0 and {(call rhsusf_fnc_findPlayer) in this};";
				statement = "this animateDoor ['ramp', 1];";
				onlyforplayer = 1;
			};
			class CloseCargoDoor: OpenCargoDoor
			{
				displayName = "Close ramp";
				condition = "this doorPhase 'ramp' > 0 and {(call rhsusf_fnc_findPlayer) in this};";
				statement = "this animateDoor ['ramp', 0];";
			};
		};
	};
	class RHS_M2A2: RHS_M2A2_Base
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
		displayName = "M2A2ODS";	
	};
	class RHS_M2A2_BUSKI: RHS_M2A2
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
		displayName = "M2A2ODS (BUSK I)";
	};
	class RHS_M2A3: RHS_M2A2
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
		displayName = "M2A3";
	};
	class RHS_M2A3_BUSKI: RHS_M2A3
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
		displayName = "M2A3 (BUSK I)";
	};
	class RHS_M2A3_BUSKIII: RHS_M2A3_BUSKI
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
		displayName = "M2A3 (BUSK III)";
	};
	class RHS_M2A3_BUSKIII_wd: RHS_M2A3_BUSKIII
	{
		displayName = "M2A3 WD (BUSK III)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
	class RHS_M6: RHS_M2A2_Base
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
		displayName = "M6A2";
	};
	class RHS_M2A2_wd: RHS_M2A2
	{
		scope = 2;
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
		displayName = "M2A2ODS WD";
	};
	class RHS_M2A2_BUSKI_WD: RHS_M2A2_BUSKI
	{
		scope = 2;
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
		displayName = "M2A2ODS WD (BUSK I)";
	};
	class RHS_M2A3_BUSKI_wd: RHS_M2A3_BUSKI
	{
		scope = 2;
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
		displayName = "M2A3 WD (BUSK I)";
	};
	class RHS_M2A3_wd: RHS_M2A3
	{
		scope = 2;
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
		displayName = "M2A3 WD";
	};
	class RHS_M6_wd: RHS_M6
	{
		scope = 2;
		displayName = "M6A2 WD";
		faction = "Faction_USAM";
		vehicleClass = "pojazdyopancerzone2";
		//crew = "tank_crew_1_us";
	};
};