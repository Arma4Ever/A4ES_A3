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
    class GVAR(base): StaticSEARCHLight {
        scope = 0;
        model = QPATHTOF(data\searchlight_manual.p3d);
        picture = QPATHTOF(data\searchlight_manual_CA.paa);
        mapSize = 3;
        nameSound = "light";
        displayName = CSTRING(SearchLight_DisplayName);
        typicalCargo[] = {};
        editorSubcategory = "EdSubcat_Turrets";

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
                "z\a3cs\addons\searchlight\data\searchlight_manual.rvmat",
                "z\a3cs\addons\searchlight\data\searchlight_manual_damage.rvmat",
                "z\a3cs\addons\searchlight\data\searchlight_manual_damage.rvmat",
                "z\a3cs\addons\searchlight\data\m2_stojan.rvmat",
                "z\a3cs\addons\searchlight\data\m2_stojan_damage.rvmat",
                "z\a3cs\addons\searchlight\data\m2_stojan_damage.rvmat",
                "z\a3cs\addons\searchlight\data\searchlight_manual_glass.rvmat",
                "z\a3cs\addons\searchlight\data\searchlight_manual_glass_destruct.rvmat",
                "z\a3cs\addons\searchlight\data\searchlight_manual_glass_destruct.rvmat"
            };
        };
        class UserActions: UserActions {
            class lightOn {
                displayName = CSTRING(Action_LightOn);
                shortcut = "Headlights";
                condition = "(vehicle ace_player) isEqualTo this && {!isLightOn this}";
                statement = "ace_player action ['lightOn', this];";
                position = "pos_gunner";
                radius = 2;
                onlyforplayer = 1;
                showWindow = 0;
                hideOnUse = 1;
            };
            class lightOff {
                displayName = CSTRING(Action_LightOff);
                shortcut = "Headlights";
                condition = "(vehicle ace_player) isEqualTo this && {isLightOn this}";
                statement = "ace_player action ['lightOff', this];";
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
    class GVAR(B): GVAR(base) {
        scope = 2;
        side = 1;
        faction = "BLU_F";
        crew = "B_Soldier_F";
    };
    class GVAR(O): GVAR(base) {
        scope = 2;
        side = 0;
        faction = "OPF_F";
        crew = "O_Soldier_F";
    };
    class GVAR(I): GVAR(base) {
        scope = 2;
        side = 2;
        faction = "IND_F";
        crew = "I_soldier_F";
    };
};
