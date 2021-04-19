#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_common"};
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class RscPicture;
class RscTitles {
    class GVAR(overlay) {
        idd=-1;
        movingEnable = 0;
        fadeIn = 0;
        fadeOut = 0;
        duration = 9.9999998e+010;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(overlay), _this select 0)]);
        class controls {
            class RscVignette: RscPicture {
                idc = IDC_OVERLAY;
            	x = "safezoneXAbs";
            	y = "safezoneY";
            	w = "safezoneWAbs";
            	h = "safezoneH";
            	text = QPATHTOF(data\overlay.paa);
            	colortext[] = {0, 0, 0, 0.92};
            };
    	};
    };
};
