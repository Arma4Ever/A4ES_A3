class CfgVehicles {
    class House_Small_F;
    class GVAR(base): House_Small_F {
        mapSize = 2.79;
        author = "$STR_A3_Bohemia_Interactive";
        scope = 0;
        scopeCurator = 0;
        displayName = "";
        model = "\A3\Weapons_F\empty.p3d";
        vehicleClass = "Structures_Infrastructure";
        compatibleWires[] = {};
        cost = 100;
    };
    class GVAR(colorWhite): GVAR(base) {
        scope = 1;
        displayName = QGVAR(colorWhite);
        model = "\A3\weapons_f\acc\accv_Flashlight_F";
        cost = 1000;
        armorLights = 0.01;
        class Reflectors {
            class Light_1 {
                color[] = {1800,1500,1200};
                ambient[] = {9,7.5,6};
                intensity = 2.5;
                size = 1;
                innerAngle = 20;
                outerAngle = 80;
                coneFadeCoef = 5;
                name = "flash";
                position = "flash";
                direction = "flash dir";
                hitpoint = "flash";
                selection = "flash";
                useFlare = 1;
                flareSize = 0.4;
                flareMaxDistance = "100.0f";
                dayLight = 0;
                class Attenuation {
                    start = 0.5;
                    constant = 0;
                    linear = 0;
                    quadratic = 1;
                    hardLimitStart = 20;
                    hardLimitEnd = 30;
                };
                scale[] = {0};
            };
        };
    };
    class GVAR(colorRed): GVAR(personalFlashlight_base) {
        scope = 1;
        displayName = QGVAR(colorRed);
        model = "\A3\weapons_f\acc\accv_Flashlight_F";
        cost = 1000;
        armorLights = 0.01;
        class Reflectors {
            class Light_1 {
                color[] = {1000,250,250};
                ambient[] = {9,7.5,6};
                intensity = 2.5;
                size = 1;
                innerAngle = 20;
                outerAngle = 80;
                coneFadeCoef = 5;
                name = "flash";
                position = "flash";
                direction = "flash dir";
                hitpoint = "flash";
                selection = "flash";
                useFlare = 1;
                flareSize = 0.4;
                flareMaxDistance = "100.0f";
                dayLight = 0;
                class Attenuation {
                    start = 0.5;
                    constant = 0;
                    linear = 0;
                    quadratic = 1;
                    hardLimitStart = 20;
                    hardLimitEnd = 30;
                };
                scale[] = {0};
            };
        };
    };
};
