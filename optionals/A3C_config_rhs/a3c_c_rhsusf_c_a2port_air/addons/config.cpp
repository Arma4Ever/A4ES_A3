class CfgPatches
{
	class a3c_c_rhsusf_c_a2port_air
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"RHS_US_A2_AirImport"};
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
	class Air;
	class Helicopter: Air
	{
		class Turrets;
		class HitPoints
		{
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitGlass6;
			class HitHull;
			class HitEngine;
			class HitAvionics;
		};
	};
	class Helicopter_Base_F: Helicopter
	{
		class Turrets: Turrets
		{
			class MainTurret;
		};
		class HitPoints: HitPoints
		{
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitGlass6;
			class HitMissiles;
			class HitHull;
			class HitEngine;
			class HitAvionics;
			class HitVRotor;
			class HitHRotor;
		};
		class AnimationSources;
		class Eventhandlers;
		class CargoTurret;
		class ViewOptics;
	};
	class Heli_Attack_01_base_F: Helicopter_Base_F
	{
		class HitPoints: HitPoints
		{
			class HitHull;
			class HitFuel;
			class HitAvionics;
			class HitMissiles;
			class HitEngine1;
			class HitEngine2;
			class HitEngine;
			class HitHRotor;
			class HitVRotor;
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitGlass6;
			class HitGlass7;
			class HitGlass8;
		};
		class Sounds;
	};
	class Helicopter_Base_H: Helicopter_Base_F
	{
		class Turrets: Turrets
		{
			class CopilotTurret;
		};
		class AnimationSources;
		class Eventhandlers;
		class Viewoptics;
		class Reflectors
		{
			class Right;
		};
		class SoundsExt;
	};
	class Heli_Transport_01_base_F: Helicopter_Base_H
	{
		class Sounds;
		class SoundsExt: SoundsExt
		{
			class Sounds;
		};
	};
	class Heli_Transport_02_base_F: Helicopter_Base_H{};
	class Heli_Transport_03_base_F: Helicopter_Base_H{};
	class Heli_Light_03_base_F: Helicopter_Base_F{};
	class HelicopterWreck;
	class Plane: Air
	{
		class HitPoints;
	};
	class Plane_Base_F: Plane
	{
		class NewTurret;
		class Turrets{};
		class ViewPilot;
		class ViewGunner;
		class AnimationSources;
		class HitPoints: HitPoints
		{
			class HitHull;
		};
	};
	class Plane_CAS_01_base_F: Plane_Base_F
	{
		class EventHandlers;
	};
	class RHS_AH64_base: Heli_Attack_01_base_F
	{
		scope = 0;
		displayName = "AH-64";
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
	};
	class RHS_AH64D: RHS_AH64_base
	{
		scope = 2;
		displayName = "AH-64D (Multi-Role)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
		class EventHandlers: EventHandlers
		{
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
			fired = "_this call SLX_XEH_EH_Fired;_this call RHS_fnc_ah64_shake; _this call (uinamespace getvariable 'BIS_fnc_effectFired')";
		};
	};
	class RHS_AH64DWreck: HelicopterWreck
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//typicalCargo[] = {};
	};
	class RHS_AH64D_GS: RHS_AH64D
	{
		displayName = "AH-64D (Ground-Suppression)";
	};
	class RHS_AH64D_CS: RHS_AH64D
	{
		displayName = "AH-64D (Close-Support)";
	};
	class RHS_AH64D_wd: RHS_AH64D
	{
		scope = 1;
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
	};
	class RHS_AH64D_wd_GS: RHS_AH64D_wd
	{
		scope = 1;
		displayName = "AH-64D (Ground-Suppression)";
	};
	class RHS_AH64D_wd_CS: RHS_AH64D_wd
	{
		scope = 1;
		displayName = "AH-64D (Close-Support)";
	};
	class RHS_AH64D_AA: RHS_AH64D
	{
		displayName = "AH-64D (AA)";
	};
	class RHS_AH64D_wd_AA: RHS_AH64D_wd
	{
		scope = 1;
		displayName = "AH-64D (AA)";
	};
	class RHS_AH64DGrey: RHS_AH64D
	{
		displayName = "AH-64D (OIF Grey)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
	};
	class RHS_AH1Z_base: Heli_Attack_01_base_F
	{
		displayName = "AH-1Z";
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
	};
	class RHS_AH1Z: RHS_AH1Z_base
	{
		displayName = "AH-1Z (Multi-Role)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
		class EventHandlers: EventHandlers
		{
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
			fired = "_this call SLX_XEH_EH_Fired;_this call RHS_fnc_ah1z_shake; _this call (uinamespace getvariable 'BIS_fnc_effectFired')";
		};
	};
	class RHS_AH1ZWreck: HelicopterWreck
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
	};
	class RHS_AH1Z_GS: RHS_AH1Z
	{
		displayName = "AH-1Z (Ground-Suppression)";
	};
	class RHS_AH1Z_CS: RHS_AH1Z
	{
		displayName = "AH-1Z (Close-Support)";
	};
	class RHS_AH1Z_wd: RHS_AH1Z
	{
		scope = 1;
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
	};
	class RHS_AH1Z_wd_GS: RHS_AH1Z_wd
	{
		scope = 1;
		displayName = "AH-1Z (Ground-Suppression)";
	};
	class RHS_AH1Z_wd_CS: RHS_AH1Z_wd
	{
		scope = 1;
		displayName = "AH-1Z (Close-Support)";
	};
	class RHS_CH_47F_base: Heli_Transport_02_base_F
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
		displayName = "CH-47F";
	};
	class RHS_CH_47F: RHS_CH_47F_base
	{
		displayName = "CH-47F";
		class UserActions
		{
			class OpenCargoDoor
			{
				displayName = "Open Ramp";
				position = "pos driver";
				radius = 15;
				showwindow = 0;
				condition = "this doorPhase 'ramp_anim' == 0 and (alive this) and ({player == _x} count [driver this,  this turretUnit [3], this turretUnit [4]] > 0)";
				statement = "this animateDoor ['ramp_anim', 1];";
				onlyforplayer = 1;
			};
			class CloseCargoDoor: OpenCargoDoor
			{
				displayName = "Close Ramp";
				condition = "this doorPhase 'ramp_anim' > 0 and (alive this) and (alive this) and ({player == _x} count [driver this,  this turretUnit [3], this turretUnit [4]] > 0);";
				statement = "this animateDoor ['ramp_anim', 0];";
			};
		};
	};
	class RHS_CH_47F_10: RHS_CH_47F
	{
		scope = 1;
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
	};
	class RHS_CH_47F_light: RHS_CH_47F
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
		displayName = "CH-47F (D)";
	};
	class CH_47FWreck: HelicopterWreck
	{

	};
	class RHS_UH60_Base: Heli_Transport_01_base_F
	{
		vehicleClass = "pojazdylatajace2";
	};
	class RHS_UH60M_base: RHS_UH60_Base
	{
		displayName = "UH-60";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us","obsluga_us"};
	};
	class RHS_UH60M_US_base: RHS_UH60M_base
	{
		side = 1;
	};
	class RHS_UH60M: RHS_UH60M_US_base
	{
		displayName = "UH-60M";
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
		class EventHandlers: EventHandlers
		{
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
			getIn = "_this call SLX_XEH_EH_GetIn;_this call rhs_fnc_uh60_doors";
			getOut = "_this call SLX_XEH_EH_GetOut;_this call rhs_fnc_uh60_doors";
		};
	};
	class RHS_UH60M_MEV: RHS_UH60M
	{
		displayName = "UH-60M MEV (ESSS)";
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
	};
	class RHS_UH60M_d: RHS_UH60M
	{
		scope = 1;
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
	};
	class RHS_UH60M_MEV_d: RHS_UH60M_MEV
	{
		scope = 1;
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
	};
	class RHS_UH60M_MEV2: RHS_UH60M_MEV
	{
		displayName = "UH-60M MEV";
	};
	class RHS_UH60M_MEV2_d: RHS_UH60M_MEV2
	{
		scope = 1;
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
	};
	class RHS_UH1_Base: Heli_Light_03_base_F
	{
		vehicleClass = "pojazdylatajace2";
	};
	class RHS_UH1Y_base: RHS_UH1_Base
	{
		displayName = "UH-1Y (FFAR/MG)";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us","obsluga_us"};
	};
	class RHS_UH1Y_US_base: RHS_UH1Y_base
	{
		side = 1;
	};
	class RHS_UH1Y: RHS_UH1Y_US_base
	{
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
		class UserActions
		{
			class HUDoff
			{
				displayName = "HUD on";
				displayNameDefault = "HUD on";
				position = "zamerny";
				radius = 1;
				onlyForPlayer = 1;
				condition = "(player==driver this)and(this animationphase 'HUDAction' !=1)";
				statement = "this animate ['HUDAction',1];this animate ['HUDAction_1',1]";
			};
			class HUDon: HUDoff
			{
				displayName = "HUD off";
				displayNameDefault = "HUD off";
				condition = "(player==driver this)and(this animationphase 'HUDAction' !=0)";
				statement = "this animate ['HUDAction',0];this animate ['HUDAction_1',0]";
			};
			class TogglePIP: HUDoff
			{
				displayName = "Toggle monitor";
				displayNameDefault = "Toggle monitor";
				condition = "( (call rhsusf_fnc_findPlayer)==driver this) or ((call rhsusf_fnc_findPlayer)==gunner this) ";
				statement = "call rhs_fnc_uh1_toggleCam";
			};
		};
		class EventHandlers: EventHandlers
		{
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
	};
	class RHS_UH1Y_d: RHS_UH1Y
	{
		scope = 1;
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
	};
	class RHS_UH1Y_FFAR: RHS_UH1Y
	{
		displayName = "UH-1Y (FFAR)";
		class UserActions: UserActions
		{
			class OpenCargoDoor
			{
				displayName = "Open right cargo door";
				position = "pos driver";
				radius = 15;
				showwindow = 0;
				condition = "this doorPhase 'doorRB' == 0 and (alive this) and player in this;";
				statement = "this animateDoor ['doorRB', 1];this animate ['doorHandler_R',1]";
				onlyforplayer = 1;
			};
			class CloseCargoDoor: OpenCargoDoor
			{
				displayName = "Close right cargo door";
				condition = "this doorPhase 'doorRB' > 0 and (alive this) and player in this;";
				statement = "this animateDoor ['doorRB', 0];this animate ['doorHandler_R',0];";
			};
			class OpenCargoLDoor: OpenCargoDoor
			{
				displayName = "Open left cargo door";
				condition = "this doorPhase 'doorLB' == 0 and (alive this) and player in this;";
				statement = "this animateDoor ['doorLB', 1];this animate ['doorHandler_L',1];";
				onlyforplayer = 1;
			};
			class CloseCargoLDoor: OpenCargoDoor
			{
				displayName = "Close left cargo door";
				condition = "this doorPhase 'doorLB' > 0 and (alive this) and player in this;";
				statement = "this animateDoor ['doorLB', 0];this animate ['doorHandler_L',0];";
			};
		};
		class EventHandlers: EventHandlers
		{
			getIn = "_this call SLX_XEH_EH_GetIn;_this call rhs_fnc_UH60_doors";
			getOut = "_this call SLX_XEH_EH_GetOut;_this call rhs_fnc_UH60_doors";
		};
	};
	class RHS_UH1Y_FFAR_d: RHS_UH1Y_FFAR
	{
		scope = 1;
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
	};
	class RHS_UH1Y_UNARMED: RHS_UH1Y_FFAR
	{
		displayName = "UH-1Y (Unarmed)";
	};
	class RHS_UH1Y_UNARMED_d: RHS_UH1Y_UNARMED
	{
		scope = 1;
		faction = "Faction_USAM";
		vehicleClass = "pojazdylatajace2";
		//crew = "pilot_us";
		//typicalCargo[] = {"obsluga_us"};
	};
	class RHS_C130J_Base: Plane_Base_F
	{
	};
	class RHS_C130J: RHS_C130J_Base
	{
		displayname = "C-130J";
		vehicleClass = "pojazdylatajace2";
		faction = "Faction_USAM";
		//crew = "pilot_us";
		//typicalCargo[] = {"pilot_us","pilot_us"};
		class UserActions
		{
			class OpenRamp
			{
				displayName = "Open Cargo Ramp";
				position = "pos_gunner";
				onlyforplayer = 1;
				radius = 6;
				condition = "(this doorPhase 'ramp' == 0) AND Alive(this)";
				statement = "this animateDoor ['ramp',1];{if(not(_x isKindOf 'Man'))then{detach _x}}foreach attachedObjects this";
			};
			class CloseRamp: OpenRamp
			{
				displayName = "Close Cargo Ramp";
				condition = "(this doorPhase 'ramp' == 1) AND Alive(this)";
				statement = "this animateDoor ['ramp',0];[this] call rhs_fnc_cargoAttach";
			};
			class MoveInside: OpenRamp
			{
				displayName = "Move inside";
				condition = "player in this and ((getpos this select 2)>50)";
				statement = "[this] spawn rhs_fnc_moveInside";
			};
			class VehicleParadrop: OpenRamp
			{
				displayName = "Paradrop cargo";
				condition = "(count (attachedObjects this) > 0) AND ('man' countType (attachedObjects this) == 0) AND Alive(this)";
				statement = "[this] spawn rhs_fnc_vehPara";
			};
			class OpenLdoor: OpenRamp
			{
				displayName = "Open Left Door";
				condition = "(this doorPhase 'door_2_1' == 0) AND Alive(this)";
				statement = "this animateDoor ['door_2_1',1]";
			};
			class OpenRdoor: OpenLdoor
			{
				displayName = "Open Right Door";
				condition = "(this doorPhase 'door_2_2' == 0) AND Alive(this)";
				statement = "this animateDoor ['door_2_2',1]";
			};
			class Closeldoor: OpenLdoor
			{
				displayName = "Close Left Door";
				condition = "(this doorPhase 'door_2_1' == 1) AND Alive(this)";
				statement = "this animateDoor ['door_2_1',0]";
			};
			class Closerdoor: OpenLdoor
			{
				displayName = "Close Right Door";
				condition = "(this doorPhase 'door_2_2' == 1) AND Alive(this)";
				statement = "this animateDoor ['door_2_2',0]";
			};
			class openfdoor: OpenLdoor
			{
				displayName = "Open Crew Door";
				condition = "(this doorPhase 'door_1' == 0) AND Alive(this)";
				statement = "this animateDoor ['door_1',1]";
			};
			class closefdoor: OpenLdoor
			{
				displayName = "Close Crew Door";
				condition = "(this doorPhase 'door_1' == 1) AND Alive(this)";
				statement = "this animateDoor ['door_1',0]";
			};
		};
	};
	class RHS_A10: Plane_CAS_01_base_F
	{
		//crew = "pilot_us";
		//typicalCargo[] = {"pilot_us"};
		vehicleClass = "pojazdylatajace2";
		faction = "Faction_USAM";
		displayName = "A-10A";
	};
};