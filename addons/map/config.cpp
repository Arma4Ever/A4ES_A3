#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a4es_common", "ace_markers", "A3_Ui_F"};
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class a4es_functions_overrides {
    ace_markers_fnc_initInsertMarker = QPATHTOF(functions\fnc_ace_initInsertMarker.sqf);
    ace_markers_fnc_mapDisplayInitEH = QPATHTOF(functions\fnc_ace_mapDisplayInitEH.sqf);
    ace_markers_fnc_onLBSelChangedShape = QPATHTOF(functions\fnc_ace_onLBSelChangedShape.sqf);
};

#include "CfgEventHandlers.hpp"
#include "InsertMarker.hpp"
#include "CfgMarkers.hpp"
