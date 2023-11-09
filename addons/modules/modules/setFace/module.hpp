class GVAR(setFace): GVAR(base) {
    scope = 2;
    author = "Krzyciu, SzwedzikPL";
    displayName = CSTRING(setFace_displayName);
    icon = "\a3\ui_f\data\igui\cfg\simpletasks\types\meet_ca.paa";
    category = QGVAR(ambient);
    function = QFUNC(setFace_module);
    isTriggerActivated = 0;

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(faceOrigin): GVAR(dynamicCombo) {
            displayName = CSTRING(setFace_Attributes_faceOrigin);
            tooltip = CSTRING(setFace_Attributes_faceOrigin_Tooltip);
            property = QGVAR(faceOrigin);
            typeName = "NUMBER";
            defaultValue = 0;
            class values {
                class white {
                    name = CSTRING(setFace_Attributes_white);
                    value = 0;
                };
                class black {
                    name = CSTRING(setFace_Attributes_black);
                    value = 1;
                };
                class asian {
                    name = CSTRING(setFace_Attributes_asian);
                    value = 2;
                };
                class arabic {
                    name = CSTRING(setFace_Attributes_arabic);
                    value = 3;
                };
                class whiteCamo {
                    name = CSTRING(setFace_Attributes_whiteCamo);
                    value = 4;
                };
            };
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(setFace_shortDescription);
        description = "";
        //schema = QPATHTOF(data\schema_placeholder.paa);
    };
};