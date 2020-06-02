class GVAR(dynamicModule): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = "Dynamic module";
    category = QGVAR(test);
    function = QFUNC(dynamicModule_dummy);

    GVAR(validator) = QFUNC(dynamicModule_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings) {};

        class useParam: GVAR(dynamicCombo) {
            displayName = "Use param";
            property = QGVAR(useParam);
            typeName = "NUMBER";
            defaultValue = 0;
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
            {"module", "A"},
            {"module", "B"}
        };
        schemas[] = {
            QPATHTOF(modules\dynamicModuledata\data\schema.jpg)
        };
    };
};
