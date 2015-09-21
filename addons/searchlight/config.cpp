#include "script_component.hpp"
class CfgPatches
{
    class ADDON
    {
        units[] = {"a3cs_searchlight"};
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

class CfgMovesBasic {
    class ManActions {
        searchlight_Gunner = "searchlight_Gunner";
    };
};

class CfgMovesMaleSdr: CfgMovesBasic {
    class States {
        class Crew;
        class searchlight_Gunner: Crew {
            file = PATHTOF(data\searchlight_Gunner.rtm);
            connectTo[] = {"Static_Dead",1};
        };
    };
};

class CfgVehicles {
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class Turrets {
            class MainTurret;
        };
        class UserActions;
    };
    class StaticSEARCHLight: StaticWeapon {
        class Turrets: Turrets
        {
            class MainTurret: MainTurret {};
        };
        class UserActions: UserActions {};
    };
    class SearchLight_Base: StaticSEARCHLight {
        scope = 0;
        model = PATHTOF(data\searchlight_manual.p3d);
        picture = PATHTOF(data\searchlight_manual_CA.paa);
        mapSize = 3;
        nameSound = "light";
        //BIS uses "Search Light" :^)
        displayName = "Searchlight";
        typicalCargo[] = {};

        class Turrets: Turrets {
            class MainTurret: MainTurret {
                weapons[] = {"SEARCHLIGHT"};
                minElev = -25;
                maxElev = 85;
                initElev= 0;
                minTurn = -180;
                maxTurn = 180;
                initTurn = 0;
                gunnerAction = "searchlight_Gunner";
                //Reversed by default so when player exits he is looking forward
                //memoryPointsGetInGunner = "pos_gunner_dir";
                //memoryPointsGetInGunnerDir = "pos_gunner";
                ejectDeadGunner = true;
            };
        };

        class Reflectors {
            class main_reflector {
                color[] = {9500,9000,8500};
                ambient[] = {85,85,85};
                position = "light";
                direction = "lightEnd";
                hitpoint = "light";
                selection = "light";
                size = 1;
                intensity = 50;
                innerAngle = 15;
                outerAngle = 65;
                coneFadeCoef = 10;
                useFlare = true;
                dayLight = false;
                flareSize = 10;
                flareMaxDistance = 250;
                class Attenuation {
                    start = 0;
                    constant = 0;
                    linear = 1;
                    quadratic = 1;
                    hardLimitStart = 100;
                    hardLimitEnd = 200;
                };
            };
            class sub_reflector: main_reflector {
                flareSize = 5;
            };
        };
        aggregateReflectors[] = {{"main_reflector","sub_reflector"}};

        class Damage {
            tex[] = {};
            mat[] = {
                PATHTOF(data\searchlight_manual.rvmat),
                PATHTOF(data\searchlight_manual_damage.rvmat),
                PATHTOF(data\searchlight_manual_damage.rvmat),
                PATHTOF(data\m2_stojan.rvmat),
                PATHTOF(data\m2_stojan_damage.rvmat),
                PATHTOF(data\m2_stojan_damage.rvmat),
                PATHTOF(data\searchlight_manual_glass.rvmat),
                PATHTOF(data\searchlight_manual_glass_destruct.rvmat),
                PATHTOF(data\searchlight_manual_glass_destruct.rvmat)
            };
        };

        class UserActions: UserActions {
            class lightOn {
                displayName = "Lights On";
                shortcut = "Headlights";
                condition = "player in this && {!(this getVariable ['a2LightOn', false])}";
                statement = "player action ['lightOn', this]; this setVariable ['a2LightOn', true]";
                position = "pos_gunner";
                radius = 2;
                onlyforplayer = 1;
                showWindow = 0;
                hideOnUse = 1;
            };
            class lightOff {
                displayName = "Lights Off";
                shortcut = "Headlights";
                condition = "player in this && {(this getVariable ['a2LightOn', false])}";
                statement = "player action ['lightOff', this]; this setVariable ['a2LightOn', false]";
                position = "pos_gunner";
                radius = 2;
                onlyforplayer = 1;
                showWindow = 0;
                hideOnUse = 1;
            };
        };

        class assembleInfo {
            primary = 0;
            base = "";
            assembleTo = "";
            dissasembleTo[] = {};
            displayName = "";
        };
    };

    class a3cs_searchlight: SearchLight_base {
        scope = 2;
        side = 1;
        faction = "BLU_F";
        crew = "B_Soldier_lite_F";
    };
};
