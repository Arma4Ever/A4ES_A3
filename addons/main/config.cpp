#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"cba_main"};
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
        picture = "A3\Ui_f\data\Logos\arma3_expansion_alpha_ca";
        actionName = "Forum";
        action = CSTRING(URL);
        description = "Arma3Coop.pl";
    };
};
