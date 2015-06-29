class CfgPatches
{
	class a3c_c_rhs_c_rva
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhs_c_rva"};
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
	class Car: LandVehicle
	{
		class HitPoints;
		class NewTurret;
	};
	class Car_F: Car
	{
		class Turrets
		{
			class MainTurret: NewTurret
			{
				disableSoundAttenuation = 1;
				class ViewOptics;
			};
		};
		class HitPoints
		{
			class HitLFWheel;
			class HitLF2Wheel;
			class HitRFWheel;
			class HitRF2Wheel;
			class HitBody;
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
			class HitGlass5;
			class HitGlass6;
		};
		class EventHandlers;
		class AnimationSources;
	};
	class Truck_F: Car_F
	{
		class ViewPilot;
		class HitPoints: HitPoints
		{
			class HitLFWheel;
			class HitLBWheel;
			class HitLMWheel;
			class HitLF2Wheel;
			class HitRFWheel;
			class HitRBWheel;
			class HitRMWheel;
			class HitRF2Wheel;
		};
		class AnimationSources;
	};
	class OTR21_Base: Truck_F
	{
		displayName = "$STR_RHS_ss21";
		vehicleClass = "a3c_rhs_vehclass_art";
		faction = "a3c_rhs_faction_russian";
		class UserActions
		{
			class WiperOn
			{
				displayName = "$STR_RHS_ss21_Wiper_On";
				position = "zamerny";
				radius = 0.01;
				onlyForplayer = 0;
				condition = "(alive this)&&(player == driver this)&&!(this getVariable 'wiper_on')";
				statement = "[3,1,this] spawn (RHS_ss21_logic getVariable 'anim_ss21');";
			};
			class WiperOff
			{
				displayName = "$STR_RHS_ss21_Wiper_Off";
				position = "zamerny";
				radius = 0.01;
				onlyForplayer = 0;
				condition = "(alive this)&&(player == driver this)&&(this getVariable 'wiper_on')";
				statement = "[3,0,this] call (RHS_ss21_logic getVariable 'anim_ss21');";
			};
			class ControlPanel
			{
				displayName = "$STR_RHS_ss21_control_panel";
				position = "zamerny";
				radius = 0.01;
				onlyForplayer = 0;
				condition = "(alive this)&&(player==(gunner this))";
				statement = "createDialog 'ss21_main_dialog'";
			};
		};
		class EventHandlers: DefaultEventhandlers
		{
			init = "_this call SLX_XEH_EH_Init;[_this select 0] execVM 'rhsafrf\addons\rhs_c_rva\scripts\init.sqf';(_this select 0) addeventhandler ['HandleDamage',{[_this,0.5,0.025,0.8,0.2] spawn rhs_fnc_activeTirePressure; _this select 2;}];";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
	};
	class rhs_9k79: OTR21_Base
	{

	};
	class rhs_9k79_K: rhs_9k79
	{
		displayName = "$STR_RHS_ss21K";
	};
	class rhs_9k79_B: rhs_9k79
	{
		displayName = "$STR_RHS_ss21B";
	};
};