class CfgPatches
{
	class a3c_c_rhsusf_c_uav
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.32;
		requiredAddons[] = {"rhsusf_c_uav"};
		version = "0.1.1.1";
		author = "SzwedzikPL";
	};
};
class CfgVehicleClasses
{
	class rq11
	{
		displayName = "RHS RQ-11 Parts";
	};
};
class CfgVehicles
{
	class rhsusf_assault_eagleaiii_ocp;
	class Building;
	class Thing;
	class RoadCone_F;
	class rq11_base_object: RoadCone_F
	{
		scope = 1;
	};
	class rhsusf_RQ11MONITOR: rq11_base_object
	{
		scope = 1;
	};
	class rhsusf_RQ11RAVEN_STATIC: rq11_base_object
	{
		scope = 1;
	};
	class rhsusf_RQ11RAVEN_B_STATIC: rq11_base_object
	{
		scope = 1;
	};
	class rq11_zerlegt: rq11_base_object
	{
		scope = 1;
	};
	class rq11b_zerlegt: rq11_base_object
	{
		scope = 1;
	};
	class carpet_empty: rq11_base_object
	{
		scope = 1;
	};
	class rq11_body: rq11_base_object
	{
		scope = 1;
	};
	class rq11_camera: rq11_base_object
	{
		scope = 1;
	};
	class rq11b_camera: rq11_base_object
	{
		scope = 1;
	};
	class rq11_paddle: rq11_base_object
	{
		scope = 1;
	};
	class rq11_rotor: rq11_base_object
	{
		scope = 1;
	};
	class rq11_tail: rq11_base_object
	{
		scope = 1;
	};
	class rq11_wing_m: rq11_base_object
	{
		scope = 1;
	};
	class rq11_wing_lr: rq11_base_object
	{
		scope = 1;
	};
	class ContainerSupply;
	class Bag_Base;
	class B_Kitbag_Base;
	class B_rhsusf_BACKPACK: B_Kitbag_Base
	{
		scope = 1;
	};
	class B_rhsusf_B_BACKPACK: rhsusf_assault_eagleaiii_ocp
	{
		scope = 1;
		class UserActions
		{
			class UNPACKRAVENACTION
			{
				displayName = "Assemble RQ-11 B Raven";
				condition = "false";
				statement = "";
			};
		};
	};
};
class RscTitles
{
	class rhsusf_RQ11_display
	{
		onLoad = "";
		//onLoad = "uiNamespace setVariable ['d_rhsusf_RQ11_display', _this select 0]";
	};
};