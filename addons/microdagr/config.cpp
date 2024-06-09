#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a4es_common", "ace_microdagr"};
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL", "ACE-Team"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class a4es_functions_overrides {
    ace_microdagr_fnc_appMarkKeypadEntry = QPATHTOF(functions\fnc_ace_appMarkKeypadEntry.sqf);
    ace_microdagr_fnc_appSettingsLBClick = QPATHTOF(functions\fnc_ace_appSettingsLBClick.sqf);
    ace_microdagr_fnc_getMarkerData = QPATHTOF(functions\fnc_ace_getMarkerData.sqf);
    ace_microdagr_fnc_receivePFH = QPATHTOF(functions\fnc_ace_receivePFH.sqf);
    ace_microdagr_fnc_showApplicationPage = QPATHTOF(functions\fnc_ace_showApplicationPage.sqf);
    ace_microdagr_fnc_updateDisplay = QPATHTOF(functions\fnc_ace_updateDisplay.sqf);
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

class ace_microdagr_TheDialog {
    onLoad = "uiNamespace setVariable ['ace_microdagr_DialogDisplay', _this select 0];(_this select 0) spawn a4es_microdagr_fnc_onDialog;";
};
