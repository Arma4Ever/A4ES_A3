class GVAR(dynamicModule): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = "Dynamic module";
    category = QGVAR(test);
    function = QFUNC(dynamicModule_dummy);

    GVAR(validator) = QFUNC(dynamicModule_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class useParam: GVAR(dynamicCombo) {
            displayName = "Use param";
            GVAR(description) = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.";
            property = QGVAR(useParam);
            typeName = "NUMBER";
            defaultValue = 0;
            GVAR(insertValues) = QFUNC(dynamicModule_insertValues);
            class values {
                class usenone {
                    name = "None";
                    value = 0;
                    default = 1;
                };
                class useparam1 {
                    name = "Use param 1";
                    value = 1;
                    default = 0;
                };
                class useparam2 {
                    name = "Use param 2";
                    value = 2;
                    default = 0;
                };
                class useparam3 {
                    name = "Use param 3";
                    value = 3;
                    default = 0;
                };
            };
        };

        class param1: GVAR(dynamicEdit) {
            displayName = "Param1";
            property = QGVAR(param1);
            defaultValue = "''";
            GVAR(conditionActive) = QUOTE((_this getVariable 'useParam') isEqualTo 1);
        };
        class param2: GVAR(dynamicEdit) {
            displayName = "Param2";
            property = QGVAR(param2);
            defaultValue = "''";
            GVAR(conditionActive) = QUOTE((_this getVariable 'useParam') isEqualTo 2);
        };
        class param3: GVAR(dynamicEdit) {
            displayName = "Param3";
            GVAR(description) = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
            property = QGVAR(param3);
            defaultValue = "''";
            GVAR(conditionActive) = QUOTE((_this getVariable 'useParam') isEqualTo 3);
        };
        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = "This is test dynamic module. This is simple description.";
        description = "Full detailed module description...";
        canSyncWith[] = {
            "<anyUnit>",
            "<anyVehicle>",
            "<anyPlane>",
            "<anyObject>",
            {"module", QGVAR(dynamicModule)},
            {"module", QGVAR(dynamicModule)}
        };
        syncRequired = 1;
        schema = QPATHTOF(modules\dynamicModule\data\schema.jpg);
    };
};
