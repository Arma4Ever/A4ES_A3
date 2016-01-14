#include "script_component.hpp"
class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"A3_Map_Stratis", "A3_Map_Altis"};
        version = A3CS_VERSION;
        versionStr = QUOTE(A3CS_VERSION);
        versionAr[] = A3CS_VERSION_ARRAY;
        author[] = {"SzwedzikPL"};
        authorUrl = "http://arma3coop.pl";
    };
};
class CfgWorlds {
    class CAWorld;
    class Stratis: CAWorld {
        class AmbientA3 {
            maxCost = 0;
        };
    };
    class Altis: CAWorld {
        class AmbientA3 {
            maxCost = 0;
        };
    };
};
