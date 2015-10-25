class CfgPatches
{
	class a3c_c_rhs_c_trucks
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhs_c_trucks"};
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
		class HitPoints
		{
			class HitLFWheel;
			class HitLF2Wheel;
			class HitRFWheel;
			class HitRF2Wheel;
			class HitBody;
			class HitFuel;
			class HitEngine;
			class HitGlass1;
			class HitGlass2;
			class HitGlass3;
			class HitGlass4;
		};
		class EventHandlers;
	};
	class Truck_F: Car_F{};
	class rhs_truck: Truck_F
	{
		vehicleClass = "a3c_rhs_vehclass_truck";
		displayName = "$STR_RHS_GAZ66";
		faction = "a3c_rhs_faction_russian";

		class UserActions
		{
			class wiperson
			{
				displayName = "$STR_RHS_WIPERSON";
				position = "";
				radius = 2;
				priority = 0.05;
				onlyForplayer = 1;
				condition = "Alive(this) AND (player == driver this) AND isengineon (this) AND this animationPhase 'wipers' < 0.5";
				statement = "[this,0] spawn rhs_fnc_wipers";
			};
			class wipersoff
			{
				displayName = "$STR_RHS_WIPERSOFF";
				position = "";
				radius = 2;
				onlyForplayer = 1;
				condition = "Alive(this) AND (player == driver this) AND this animationPhase 'wipers' > 0.5";
				statement = "[this,1] spawn rhs_fnc_wipers";
			};
		};
		transportSoldier = 11;
		cargoProxyIndexes[] = {1,2,3,4,5,6,7,8,10,11};
		getInProxyOrder[] = {1,2,3,4,5,6,7,8,9,10,11,12,13};
		class CargoTurret;
		class Turrets
		{
			class CargoTurret_01: CargoTurret
			{
				gunnerAction = "passenger_inside_2";
				gunnerGetInAction = "GetInMRAP_01_cargo";
				gunnerGetOutAction = "GetOutHelicopterCargo";
				memoryPointsGetInGunner = "pos cargo LR";
				memoryPointsGetInGunnerDir = "pos cargo LR dir";
				gunnerName = "Passenger (Left Seat)";
				gunnerCompartments = "Compartment2";
				proxyIndex = 13;
				maxElev = 15;
				minElev = -15;
				maxTurn = -40;
				minTurn = -115;
				isPersonTurret = 1;
			};
			class CargoTurret_02: CargoTurret_01
			{
				gunnerName = "Passenger (Right Seat)";
				memoryPointsGetInGunner = "pos cargo RR";
				memoryPointsGetInGunnerDir = "pos cargo RR dir";
				proxyIndex = 9;
				maxTurn = 95;
				minTurn = 20;
				minElev = -45;
			};
		};
		class EventHandlers: EventHandlers
		{
			init = "_this call SLX_XEH_EH_Init;_this call rhs_fnc_gaz66_init";
			hitpart = "_this call SLX_XEH_EH_HitPart;_this call rhs_fnc_hitHandler";
		};
	};
	class rhs_gaz66_vmf: rhs_truck
	{
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_vdv: rhs_gaz66_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_vv: rhs_gaz66_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_msv: rhs_gaz66_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_flat_vmf: rhs_gaz66_vmf
	{
		displayName = "GAZ-66 (Flatbed)";
	};
	class rhs_gaz66_flat_vdv: rhs_gaz66_flat_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_flat_vv: rhs_gaz66_flat_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_flat_msv: rhs_gaz66_flat_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66o_vmf: rhs_gaz66_vmf
	{
		displayName = "$STR_RHS_GAZ66OPEN";
	};
	class rhs_gaz66o_vdv: rhs_gaz66o_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66o_vv: rhs_gaz66o_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66o_msv: rhs_gaz66o_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66o_flat_vmf: rhs_gaz66o_vmf
	{
		displayName = "GAZ-66 (Open/Flatbed)";
	};
	class rhs_gaz66o_flat_vdv: rhs_gaz66o_flat_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66o_flat_vv: rhs_gaz66o_flat_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66o_flat_msv: rhs_gaz66o_flat_vmf
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_r142_base: rhs_gaz66_vmf
	{
		displayName = "$STR_RHS_GAZ66R";
		class UserActions
		{
			class deployMast
			{
				displayName = "Deploy Mast";
				position = "";
				radius = 2;
				priority = 0.05;
				onlyForplayer = 1;
				condition = "(player == driver this) AND this doorPhase 'mast_source' < 0.01 and (speed this < 1)";
				statement = "[this,1] spawn rhs_fnc_gaz66_radioDeploy";
			};
			class foldMast: deployMast
			{
				displayName = "Fold Mast";
				condition = "(player == driver this) AND this doorPhase 'mast_source' > 0.99";
				statement = "[this,0] spawn rhs_fnc_gaz66_radioDeploy";
			};
		};
	};
	class rhs_gaz66_r142_vmf: rhs_gaz66_r142_base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_r142_vdv: rhs_gaz66_r142_base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_r142_msv: rhs_gaz66_r142_base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_r142_vv: rhs_gaz66_r142_base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_repair_base: rhs_gaz66_vmf
	{
		displayName = "$STR_RHS_GAZ66REP";
	};
	class rhs_gaz66_repair_vmf: rhs_gaz66_repair_base
	{
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_repair_vdv: rhs_gaz66_repair_base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_repair_vv: rhs_gaz66_repair_base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_repair_msv: rhs_gaz66_repair_base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_ap2_base: rhs_gaz66_vmf
	{
		displayName = "$STR_RHS_GAZ66AP2";
	};
	class rhs_gaz66_ap2_vmf: rhs_gaz66_ap2_base
	{

	};
	class rhs_gaz66_ap2_vdv: rhs_gaz66_ap2_base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_ap2_vv: rhs_gaz66_ap2_base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_ap2_msv: rhs_gaz66_ap2_base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_ammo_base: rhs_gaz66_vmf
	{
		displayName = "$STR_RHS_GAZ66AMMO";
	};
	class rhs_gaz66_ammo_vmf: rhs_gaz66_ammo_base
	{

	};
	class rhs_gaz66_ammo_vdv: rhs_gaz66_ammo_base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_ammo_vv: rhs_gaz66_ammo_base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
	class rhs_gaz66_ammo_msv: rhs_gaz66_ammo_base
	{
		scope = 1;
		faction = "a3c_rhs_faction_russian";
	};
};