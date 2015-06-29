class CfgPatches
{
	class a3c_c_rhs_main
	{
		units[] = {};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"rhs_main", "rhs_cti_insurgents", "rhsusf_main"};
		author[] = {"A3C"};
		authorUrl = "";
		versionDesc = "";
		version = "";
		text = "";
		magazines[] = {};
		ammo[] = {};
	};
};
class CfgVehicleClasses
{
	class a3c_rhs_vehclass_infantry_emr
	{
		displayName = "Piechota (EMR)";
	};
	class a3c_rhs_vehclass_infantry_msv
	{
		displayName = "Piechota MSV";
	};
	class a3c_rhs_vehclass_infantry_msv_emr
	{
		displayName = "Piechota MSV (EMR)";
	};
	class a3c_rhs_vehclass_infantry_vdv_emr
	{
		displayName = "Piechota VDV (EMR)";
	};
	class a3c_rhs_vehclass_infantry_vdv_flora
	{
		displayName = "Piechota VDV (Flora)";
	};
	class a3c_rhs_vehclass_infantry_vdv_mflora
	{
		displayName = "Piechota VDV (M Flora)";
	};
	class a3c_rhs_vehclass_infantry_recon
	{
		displayName = "Piechota (Zwiad)";
	};
	class a3c_rhs_vehclass_specnaz
	{
		displayName = "Piechota (Specnaz)";
	};	
	class a3c_rhs_vehclass_car
	{
		displayName = "Samochody";
	};
	class a3c_rhs_vehclass_truck
	{
		displayName = "Ciężarówki";
	};
	class a3c_rhs_vehclass_apc
	{
		displayName = "Pojazdy wsparcia piechoty";
	};
	class a3c_rhs_vehclass_aa
	{
		displayName = "Pojazdy przeciwlotnicze";
	};
	class a3c_rhs_vehclass_tank
	{
		displayName = "Czołgi";
	};
	class a3c_rhs_vehclass_static
	{
		displayName = "Broń statyczna";
	};
	class a3c_rhs_vehclass_heli
	{
		displayName = "Śmigłowce";
	};
	class a3c_rhs_vehclass_aircraft
	{
		displayName = "Samoloty";
	};
	class a3c_rhs_vehclass_art
	{
		displayName = "Artyleria";
	};
	class a3c_rhs_vehclass_autonomous
	{
		displayName = "Drony";
	};
};
class CfgFactionClasses
{
	class a3c_rhs_faction_russian
    {
        displayName = "Federacja Rosyjska"
        priority = -9;
        side = 0;
		icon = "\rhsafrf\addons\rhs_main\data\flag_map\flag_rus_co.paa";
		backpack_tf_faction_radio_api = "tf_bussole";
    };
   	class rhs_faction_insurgents
	{
		displayName = "Powstańcy";
	};
};
class RscStandardDisplay;
class RscDisplayMain: RscStandardDisplay
{
	onLoad = "[""onLoad"",_this,""RscDisplayMain"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
};
class rhs_rscWelcomeScreen
{
	idd = -1;
	onLoad = "";
};
class RscShortcutButton;
class RHS_Options_Button: RscShortcutButton
{
	text = "";
	action = "";
	x = "0";
	y = "0";
	w = "0";
	h = "0";
};
class RscDisplayMPInterrupt: RscStandardDisplay
{
	class controls
	{
		class RHS_Options: RHS_Options_Button{};
	};
};
class RscDisplayInterrupt: RscStandardDisplay
{
	class controls
	{
		class RHS_Options: RHS_Options_Button{};
	};
};
class RscDisplayInterruptEditor3D: RscStandardDisplay
{
	class controls
	{
		class RHS_Options: RHS_Options_Button{};
	};
};
class RscDisplayInterruptEditorPreview: RscStandardDisplay
{
	class controls
	{
		class RHS_Options: RHS_Options_Button{};
	};
};