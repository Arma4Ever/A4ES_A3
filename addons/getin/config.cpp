#include "script_component.hpp"
class CfgPatches
{
    class ADDON
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_main", "a3cs_common"};
        version = A3CS_VERSION;
        versionStr = QUOTE(A3CS_VERSION);
        versionAr[] = A3CS_VERSION_ARRAY;
        author[] = {"SzwedzikPL", "ACE3 Team"};
        authorUrl = "http://arma3coop.pl";
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class CfgActions
{
    class GetOut {show = 0;showWindow = 0;hideOnUse = 1;textSimple = "";shortcut = "";};
    class GetInCargo {show = 0;showWindow = 0;hideOnUse = 1;textSimple = "";shortcut = "";};
    class GetInCommander {show = 0;showWindow = 0;hideOnUse = 1;textSimple = "";shortcut = "";};
    class GetInDriver {show = 0;showWindow = 0;hideOnUse = 1;textSimple = "";shortcut = "";};
    class GetInGunner {show = 0;showWindow = 0;hideOnUse = 1;textSimple = "";shortcut = "";};
    class GetInPilot {show = 0;showWindow = 0;hideOnUse = 1;textSimple = "";shortcut = "";};
    class GetInTurret {show = 0;showWindow = 0;hideOnUse = 1;textSimple = "";shortcut = "";};
    class Eject {show = 0;showWindow = 0;hideOnUse = 1;textSimple = "";shortcut = "";};
    class MoveToCargo {show = 0;showWindow = 0;hideOnUse = 1;textSimple = "";shortcut = "";};
    class MoveToCommander {show = 0;showWindow = 0;hideOnUse = 1;textSimple = "";shortcut = "";};
    class MoveToDriver {show = 0;showWindow = 0;hideOnUse = 1;textSimple = "";shortcut = "";};
    class MoveToGunner {show = 0;showWindow = 0;hideOnUse = 1;textSimple = "";shortcut = "";};
    class MoveToPilot {show = 0;showWindow = 0;hideOnUse = 1;textSimple = "";shortcut = "";};
    class MoveToTurret {show = 0;showWindow = 0;hideOnUse = 1;textSimple = "";shortcut = "";};
};

class CfgVehicles {
    class LandVehicle;
    class Car: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(Getin) {
                    displayName = CSTRING(Getin);
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addGetinActions));
                };
            };
        };
        class ACE_SelfActions {
            class GVAR(Getout) {
                displayName = CSTRING(Getout);
                condition = "true";
                statement = QUOTE(_this call DFUNC(getOut));
            };
            class GVAR(Eject) {
                displayName = CSTRING(Eject);
                condition = "true";
                statement = QUOTE(_this call DFUNC(eject));
            };
            class GVAR(Move) {
                displayName = CSTRING(Move);
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addGetinActions));
            };
        };
    };

    class Tank: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(Getin) {
                    displayName = CSTRING(Getin);
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addGetinActions));
                };
            };
        };
        class ACE_SelfActions {
            class GVAR(Getout) {
                displayName = CSTRING(Getout);
                condition = "true";
                statement = QUOTE(_this call DFUNC(getOut));
            };
            class GVAR(Move) {
                displayName = CSTRING(Move);
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addGetinActions));
            };
        };
    };

    class Air;
    class Helicopter: Air {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(Getin) {
                    displayName = CSTRING(Getin);
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addGetinActions));
                };
            };
        };
        class ACE_SelfActions {
            class GVAR(Getout) {
                displayName = CSTRING(Getout);
                condition = "true";
                statement = QUOTE(_this call DFUNC(getOut));
            };
            class GVAR(Eject) {
                displayName = CSTRING(Eject);
                condition = "true";
                statement = QUOTE(_this call DFUNC(eject));
            };
            class GVAR(Move) {
                displayName = CSTRING(Move);
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addGetinActions));
            };
        };
    };

    class Plane: Air {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(Getin) {
                    displayName = CSTRING(Getin);
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addGetinActions));
                };
            };
        };
        class ACE_SelfActions {
            class GVAR(Getout) {
                displayName = CSTRING(Getout);
                condition = "true";
                statement = QUOTE(_this call DFUNC(getOut));
            };
            class GVAR(EjectPlane) {
                displayName = CSTRING(Eject);
                condition = "true";
                statement = QUOTE(_this call DFUNC(eject));
            };
            class GVAR(Move) {
                displayName = CSTRING(Move);
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addGetinActions));
            };
        };
    };

    class Ship;
    class Ship_F: Ship {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(Getin) {
                    displayName = CSTRING(Getin);
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addGetinActions));
                };
            };
        };
        class ACE_SelfActions {
            class GVAR(Getout) {
                displayName = CSTRING(Getout);
                condition = "true";
                statement = QUOTE(_this call DFUNC(getOut));
            };
            class GVAR(Move) {
                displayName = CSTRING(Move);
                condition = "true";
                statement = "";
                insertChildren = QUOTE(_this call DFUNC(addGetinActions));
            };
        };
    };

    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(Getin) {
                    displayName = CSTRING(Getin);
                    condition = "true";
                    statement = "";
                    insertChildren = QUOTE(_this call DFUNC(addGetinActions));
                };
            };
        };
        class ACE_SelfActions {
            class GVAR(Getout) {
                displayName = CSTRING(Getout);
                condition = "true";
                statement = QUOTE(_this call DFUNC(getOut));
            };
        };
    };
};