#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_main", "a3cs_common"};
        version = A3CS_VERSION;
        versionStr = QUOTE(A3CS_VERSION);
        versionAr[] = A3CS_VERSION_ARRAY;
        author[] = {"SzwedzikPL", "Dslyecxi", "ACE3 Team"};
        authorUrl = "http://arma3coop.pl";
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};
class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_clientInit));
    };
};

class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(takeCommand) {
                    displayName = "$STR_A3CS_Nametag_Actions_displayName_takeCommand";
                    condition = QUOTE(leader _player == _player && !isPlayer _target && {[ARR_2(_player,_target)] call ace_interaction_fnc_canJoinGroup});
                    statement = QUOTE([_target] joinSilent group _player);
                    showDisabled = 0;
                    priority = 2.6;
                    icon = "\z\ace\addons\interaction\UI\team\team_management_ca.paa";
                };
                class GVAR(checkGear) {
                    displayName = "$STR_A3CS_Nametag_Actions_displayName_checkGear";
                    distance = 5;
                    condition = "alive _target";
                    statement = QUOTE([ARR_2(_player, _target)] call DFUNC(checkGear));
                    showDisabled = 0;
                    priority = 8;
                };
                class GVAR(checkId) {
                    displayName = "$STR_A3CS_Nametag_Actions_displayName_checkId";
                    distance = 5;
                    condition = "alive _target";
                    statement = QUOTE([ARR_2(_player, _target)] call DFUNC(checkId));
                    showDisabled = 0;
                    priority = 8;
                };
            };
        };
        class ACE_SelfActions {
            class GVAR(checkId) {
                displayName = "$STR_A3CS_Nametag_Actions_displayName_checkId";
                condition = "true";
                statement = QUOTE([ARR_2(_player, _target)] call DFUNC(checkId));
                showDisabled = 0;
                priority = 8;
            };
        };
    };
};

class ACE_Settings {
    class GVAR(enableSthud) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = "$STR_A3CS_Nametag_Settings_displayName_enableSthud";
        category = "$STR_A3CS_Nametag_Settings_category";
    };
    class GVAR(enableCommandBar) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = "$STR_A3CS_Nametag_Settings_displayName_enableCommandBar";
        description = "$STR_A3CS_Nametag_Settings_description_enableCommandBar";
        category = "$STR_A3CS_Nametag_Settings_category";
    };
    class GVAR(enableCursorNametag) {
        value = 1;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = "$STR_A3CS_Nametag_Settings_displayName_enableCursorNametag";
        description = "$STR_A3CS_Nametag_Settings_description_enableCursorNametag";
        category = "$STR_A3CS_Nametag_Settings_category";
    };
    class GVAR(enable3dNametag) {
        value = 1;
        typeName = "SCALAR";
        isClientSettable = 1;
        displayName = "$STR_A3CS_Nametag_Settings_displayName_enable3dNametag";
        values[] = {
            "$STR_A3CS_Nametag_no",
            "$STR_A3CS_Nametag_Settings_value_enable3dNametag_1_duringfreelook",
            "$STR_A3CS_Nametag_Settings_value_enable3dNametag_2_oncursortarget"
        };
        category = "$STR_A3CS_Nametag_Settings_category";
    };
    class GVAR(addSpecialItems) {
        value = 0;
        typeName = "BOOL";
        isClientSettable = 1;
        displayName = "$STR_A3CS_Nametag_Settings_displayName_addSpecialItems";
        category = "$STR_A3CS_Nametag_Settings_category";
    };
};

class CfgInGameUI
{
	class Cursor
	{
		select = "#(argb,1,1,1)color(0,0,0,0)";
		outArrow = "#(argb,1,1,1)color(0,0,0,0)";
		leader = "#(argb,1,1,1)color(0,0,0,0)";
		mission = "#(argb,1,1,1)color(0,0,0,0)";
	};
};

#include "gui.hpp"

//sthud
class ST_STHudM_Base
{
	color[] = {0.97,0.78,0.13,1};
	size = 24;
	scope = 0;
	shadow = "false";
};
class CfgMarkers
{
	class ST_STHudM_Rifleman: ST_STHudM_Base
	{
		name = "zzzSTHud - Rifleman";
		icon = "\a3\ui_f\data\map\vehicleicons\iconMan_ca.paa";
	};
	class ST_STHudM_Medic: ST_STHudM_Base
	{
		name = "zzzSTHud - Medic";
		icon = "\a3\ui_f\data\map\vehicleicons\iconManMedic_ca.paa";
	};
	class ST_STHudM_Engineer: ST_STHudM_Base
	{
		name = "zzzSTHud - Engineer";
		icon = "\a3\ui_f\data\map\vehicleicons\iconManEngineer_ca.paa";
	};
	class ST_STHudM_Explosive: ST_STHudM_Base
	{
		name = "zzzSTHud - Explosive";
		icon = "\a3\ui_f\data\map\vehicleicons\iconmanexplosive_ca.paa";
	};
	class ST_STHudM_Recon: ST_STHudM_Base
	{
		name = "zzzSTHud - Recon";
		icon = "\a3\ui_f\data\map\vehicleicons\iconmanrecon_ca.paa";
	};
	class ST_STHudM_AT: ST_STHudM_Base
	{
		name = "zzzSTHud - AT";
		icon = "\a3\ui_f\data\map\vehicleicons\iconManAT_ca.paa";
	};
	class ST_STHudM_Leader: ST_STHudM_Base
	{
		name = "zzzSTHud - Leader";
		icon = "\a3\ui_f\data\map\vehicleicons\iconManLeader_ca.paa";
	};
	class ST_STHudM_MG: ST_STHudM_Base
	{
		name = "zzzSTHud - MG";
		icon = "\a3\ui_f\data\map\vehicleicons\iconManMG_ca.paa";
	};
	class ST_STHudM_Officer: ST_STHudM_Base
	{
		name = "zzzSTHud - Officer";
		icon = "\a3\ui_f\data\map\vehicleicons\iconManOfficer_ca.paa";
	};
};
