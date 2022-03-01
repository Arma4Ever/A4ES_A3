#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common", "ace_microdagr"};
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL", "ACE-Team"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"

class ace_microdagr_TheDialog {
    onLoad = "uiNamespace setVariable ['ace_microdagr_DialogDisplay', _this select 0];(_this select 0) spawn a3cs_microdagr_fnc_onDialog;";
};
