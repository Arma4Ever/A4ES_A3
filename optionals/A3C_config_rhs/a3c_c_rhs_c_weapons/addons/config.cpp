class CfgPatches
{
	class a3c_c_rhs_c_weapons
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.32;
		requiredAddons[] = {"rhs_c_weapons"};
		version = "0.1.1.1";
		author = "SzwedzikPL";
	};
};
class RscInGameUI
{
	class RscUnitInfo;
	class RscWeaponZeroing: RscUnitInfo
	{
		class WeaponInfoControlsGroupLeft;
	};
	class rhs_rscOptics_kobra: RscWeaponZeroing
	{
		onLoad = "";
		//onLoad = "['onLoad',_this,'RscUnitInfo','IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); _this call RHS_fnc_sight_kobra";
	};
	class rhs_rscOptics_ak74: RscWeaponZeroing
	{
		onLoad = "";
		//onLoad = "['onLoad',_this,'RscUnitInfo','IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); _this call RHS_fnc_fold_AK";
	};
	class rhs_rscOptics_ak74_camo: rhs_rscOptics_ak74{};
	class rhs_rscOptics_ak74_desert: rhs_rscOptics_ak74{};
	class rhs_rscOptics_ak74_plummag: rhs_rscOptics_ak74{};
	class rhs_rscOptics_ak74_npz: RscWeaponZeroing
	{
		onLoad = "";
		//onLoad = "['onLoad',_this,'RscUnitInfo','IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); _this call RHS_fnc_acc_npz_handler";
	};
	class rhs_rscOptics_ak74_camo_npz: rhs_rscOptics_ak74_npz{};
	class rhs_rscOptics_ak74_desert_npz: rhs_rscOptics_ak74_npz{};
	class rhs_rscOptics_ak74_plummag_npz: rhs_rscOptics_ak74_npz{};
	class rhs_rscOptics_ak74_2mag_npz: rhs_rscOptics_ak74_npz{};
	class rhs_rscOptics_ak74_2mag_camo_npz: rhs_rscOptics_ak74_npz{};
	class rhs_rscOptics_ak74_gp25_npz: rhs_rscOptics_ak74_npz{};
	class rhs_rscOptics_ak103_npz: rhs_rscOptics_ak74_npz{};
	class rhs_rscOptics_svdp_npz: rhs_rscOptics_ak74_npz{};
	class rhs_rscOptics_svdp_wd_npz: rhs_rscOptics_ak74_npz{};
	class rhs_rscOptics_svds_npz: rhs_rscOptics_ak74_npz{};
	class rhs_rscOptics_disposable: RscWeaponZeroing
	{
		onLoad = "";
		//onLoad = "['onLoad',_this,'RscUnitInfo','IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); _this call RHS_fnc_disposable_load";
	};
	class rhs_rscOptics_acc_npz: RscWeaponZeroing
	{
		onLoad = "";
		//onLoad = "['onLoad',_this,'RscUnitInfo','IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); _this call RHS_fnc_acc_npz";
	};
	class rhs_rscOptics_rsp30: RscWeaponZeroing
	{
		onLoad = "";
		//onLoad = "['onLoad',_this,'RscUnitInfo','IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); _this call RHS_fnc_rsp30";
	};
	class rhs_rscOptics_acc_pso1: RscWeaponZeroing
	{
		onLoad = "";
		//onLoad = "['onLoad',_this,'RscUnitInfo','IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); [_this select 0, 'pso1'] call RHS_fnc_sight_pso1;";
	};
	class rhs_rscOptics_acc_pgo7: RscWeaponZeroing
	{
		onLoad = "";
		//onLoad = "['onLoad',_this,'RscUnitInfo','IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); [_this select 0, 'pgo7'] call RHS_fnc_sight_pso1;";
	};
	class rhs_rscOptics_acc_1p29: RscWeaponZeroing
	{
		onLoad = "";
		//onLoad = "['onLoad',_this,'RscUnitInfo','IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); _this call RHS_fnc_sight_1p29;";
	};
	class rhs_rscOptics_acc_1p78: RscWeaponZeroing
	{
		onLoad = "";
		//onLoad = "['onLoad',_this,'RscUnitInfo','IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); _this call RHS_fnc_sight_1p29;";
	};
	class rhs_tr8_pip_handler: RscWeaponZeroing
	{
		onLoad = "";
		//onLoad = "['onLoad',_this,'RscUnitInfo','IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); [_this select 0,8,'tr8']  call RHS_fnc_tr8_handler";
	};
	class rhs_gui_optic_pdu4_rangefinder: RscUnitInfo
	{
		onLoad = "";
		//onLoad = "['onLoad',_this,'RscUnitInfo','IGUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay'); _this call RHS_fnc_pdu4_rf";
	};
};