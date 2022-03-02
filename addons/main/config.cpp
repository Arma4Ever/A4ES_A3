#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main", "A3_Ui_F"};
        author = CSTRING(Author);
        authors[] = {"SzwedzikPL"};
        url = CSTRING(URL);
        VERSION_CONFIG;
    };
};

class CfgMods {
    class PREFIX {
        dir = "@A3CS";
        name = "Arma3Coop System";
        actionName = "Forum";
        action = CSTRING(URL);
        description = "Arma3Coop.pl";
    };
};

class CfgSettings {
    class CBA {
        class Versioning {
            class PREFIX {
                class dependencies {
                    CBA[] = {"cba_main", REQUIRED_CBA_VERSION, "(true)"};
                };
            };
        };
    };
};

class RscStandardDisplay;
class RscControlsGroupNoScrollbars;
class RscPictureKeepAspect;
class RscActivePicture;

class RscDisplayStart: RscStandardDisplay {
    class controls {
        class LoadingStart: RscControlsGroupNoScrollbars {
            class controls {
                class Logo: RscPictureKeepAspect {
                    text = PATHTOF(data\a3c_logo_512.paa);
                    x="0.125 * safezoneW";
					y="0.234375 * safezoneH";
					w="0.75 * safezoneW";
					h="0.375 * safezoneH";
                };
            };
        };
    };
};
class RscDisplayNotFreeze: RscStandardDisplay {
    class controls {
        class LoadingStart: RscControlsGroupNoScrollbars {
            class controls {
                class Logo: RscPictureKeepAspect {
                    text = PATHTOF(data\a3c_logo_512.paa);
                    x="0.125 * safezoneW";
					y="0.234375 * safezoneH";
					w="0.75 * safezoneW";
					h="0.375 * safezoneH";
                };
            };
        };
    };
};
class RscDisplayLoadMission: RscStandardDisplay {
    class controls {
        class LoadingStart: RscControlsGroupNoScrollbars {
            class controls {
                class Logo: RscPictureKeepAspect {
                    text = PATHTOF(data\a3c_logo_512.paa);
                    x="0.125 * safezoneW";
					y="0.234375 * safezoneH";
					w="0.75 * safezoneW";
					h="0.375 * safezoneH";
                };
            };
        };
    };
};



class RscDisplayMain: RscStandardDisplay {
	class Controls {
        delete Spotlight;
        delete LogoApex;
		class Logo: RscActivePicture {
			text = PATHTOF(data\a3c_logo_shadow.paa);
			tooltip = "Arma3Coop.pl";
			color[] = {0.89999998,0.89999998,0.89999998,1};
			colorActive[] = {1,1,1,1};
			shadow = 0;
            url = "https://arma3coop.pl";
			onButtonClick = "";
			onSetFocus = "(_this select 0) ctrlsettextcolor [1,1,1,1];";
			onKillFocus = "(_this select 0) ctrlsettextcolor [0.9,0.9,0.9,1];";
			onLoad = "";
		};
    };
};
