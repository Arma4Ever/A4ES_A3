class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class AttributesBase {
            class Default;
            class Edit;
            class Combo;
            class Checkbox;
            class CheckboxNumber;
            class ModuleDescription;
        };
        class ModuleDescription;
    };

    class GVAR(base): Module_F {
        scope = 0;
        scopeCurator = 0;
        functionPriority = 8;
        isGlobal = 0;
        isTriggerActivated = 1;
        isDisposable = 0;
        is3DEN = 1;

        GVAR(isDisposable) = 1;
        GVAR(is3DEN) = 0;

        class AttributesBase: AttributesBase {
            class EditMulti3: Default {
                control = "EditMulti3";
            };
            class EditMulti5: Default {
                control = "EditMulti5";
            };
            class GVAR(dynamicCombo): Combo {
                control = QGVAR(dynamicCombo);
            };
            class GVAR(dynamicEdit): Edit {
                control = QGVAR(editor,dynamicEdit);
            };
            class GVAR(moduleDescription) {
                control = QGVAR(moduleDescription);
                property = QGVAR(moduleDescription);
            };
            delete ModuleDescription;
        };

        class GVAR(moduleDescription) {
            description = "";
            shortDescription = "";
            validate = "";
            canSyncWith[] = {};
            schemas[] = {};
        };
        delete ModuleDescription;
    };

    class GVAR(standardModule): Module_F {
        scope = 2;
        author = ECSTRING(main,Author);
        displayName = "Standard module";
        category = QGVAR(test);
        function = QFUNC(dummy);

        class Attributes: AttributesBase {
            class useParam: Combo {
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

            class param1: Edit {
                displayName = "Param1";
                property = QGVAR(param1);
                defaultValue = "''";
            };
            class param2: Edit {
                displayName = "Param2";
                property = QGVAR(param2);
                defaultValue = "''";
            };
            class param3: Edit {
                displayName = "Param3";
                property = QGVAR(param3);
                defaultValue = "''";
            };
            class ModuleDescription: ModuleDescription {};
        };
        class ModuleDescription: ModuleDescription {
            description = "Standard module description. Values below tell little to nothing...";
        };
    };

    class GVAR(dynamicModule): GVAR(base) {
        scope = 2;
        author = ECSTRING(main,Author);
        displayName = "Dynamic module";
        category = QGVAR(test);
        function = QFUNC(dummy);
        GVAR(onAttributesEditOpened) = QUOTE(_thic call FUNC(onAttributesEditOpened));

        class Attributes: AttributesBase {
            class ModuleDescription2: ModuleDescription {
                property = "ModuleInfo2";
            };
            class useParam: GVAR(dynamicCombo) {
                displayName = "Use param";
                property = QGVAR(useParam);
                typeName = "NUMBER";
                defaultValue = 0;
                GVAR(activeCondition) = "true";
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
                GVAR(activeCondition) = QUOTE((_this getVariable 'useParam') isEqualTo 1);
            };
            class param2: GVAR(dynamicEdit) {
                displayName = "Param2";
                property = QGVAR(param2);
                defaultValue = "''";
                GVAR(activeCondition) = QUOTE((_this getVariable 'useParam') isEqualTo 2);
            };
            class param3: GVAR(dynamicEdit) {
                displayName = "Param3";
                property = QGVAR(param3);
                defaultValue = "''";
                GVAR(activeCondition) = QUOTE((_this getVariable 'useParam') isEqualTo 3);
            };
            class GVAR(moduleDescription): GVAR(moduleDescription) {};
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {
            shortDescription = "This is test dynamic module. This is simple description.";
            description = "Full detailed module description...";
            canSyncWith[] = {
                "trigger",
                {"module", "A"},
                {"module", "B"}
            };
            schemas[] = {QPATHTOF(data\dynamicModuleSchema.jpg)};
        };
    };

};
