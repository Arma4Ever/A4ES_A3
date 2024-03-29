#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main", "A3_Ui_F"};
        author = ECSTRING(main,Author);
        authors[] = {"SzwedzikPL"};
        url = CSTRING(URL);
        VERSION_CONFIG;
    };
};

class CfgMods {
    class PREFIX {
        dir = "@A4ES";
        name = "Arma4Ever System";
        actionName = "Forum";
        action = CSTRING(URL);
        description = "Arma4Ever.pl";
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
