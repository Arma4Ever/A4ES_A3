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
        //delete ModuleDescription;

        scope = 0;
        scopeCurator = 0;

        // Execution priority, modules with lower number are executed first. 0 is used when the attribute is undefined
        functionPriority = 10;

        // 0 for server only execution, 1 for global execution, 2 for persistent global execution
        isGlobal = 0;

        // Set to 1 for module waiting until all synced triggers are activated
        isTriggerActivated = 1;

        // Set to 1 if module is to be disabled after first activation (i.e., repeated trigger activation will not work)
        // This is bugged - always use 0, handle it in module function
        isDisposable = 0;

        // Set to 1 to run init function in Eden Editor as well
        // Always use 1 because of params format in functions
        is3DEN = 1;

        // Dialog displayed when the module is placed or double-clicked by zeus
		curatorInfoType = "";

        /*
        Area properties:

        canSetArea = 0;
		canSetAreaHeight = 0;
		canSetAreaShape = 0;

		class AttributeValues {
            size3[] = {5, 5, -1};
            isRectangle = 0;
		};
        */

        /*
         * Validator code, should return array of warnings (or empty array if none)
         *
         * Warnings should be returned in format:
         * [["Warning one title", "Warning one description", "attribute_class"], etc...]
         *
         * Note: Warning description is optional, use empty string if no description.
         *
         * Note: Attribute_class is a warning source. In case warning source is
         * not attribute (ie. warning about module synchrnizations) you can use
         * empty string.
         */
        GVAR(validator) = "";

        class AttributesBase: AttributesBase {
            //delete ModuleDescription;

            /*
             * Supported properties in attributes (besides vanilla ones):
             *
             * GVAR(conditionActive) - Condition code, if true attribute
             * will be active & editable. Condition is called when module
             * attributes dialog is open and after every change of dynamic attribute.
             *
             * Params passed to code: params ["_module", "_values"]
             * _module is currently edited module.
             * _values is namespace with *current* values of all observed attributes.
             * Access value with getVariable: _values getVariable 'attribute_class'
             *
             * Note: Use _values instead of '_module get3DENAttribute ...'
             * because get3DENAttribute will return already *saved* values of attributes,
             * _values namespace contains *current* values of observed attributes.
             *
             * Note: Values inside _values namespace are parsed just like
             * saved attributes, so type declared in attribute typeName
             * property is used.
             *
             * GVAR(observeValue) - Set to 1 if value should be added to _values
             * namespace and updated on value change (update will trigger
             * conditions check of all attributes)
             */

            class EditMulti3: Default {
                control = "EditMulti3";
            };
            class EditMulti5: Default {
                control = "EditMulti5";
            };
            class GVAR(subCategory) {
                control = QGVAR(subCategory);
                property = QGVAR(subCategory);
            };
            class GVAR(subCategoryWithDescription) {
                control = QGVAR(subCategoryWithDescription);
                property = QGVAR(subCategoryWithDescription);
            };
            class GVAR(moduleShortDescription) {
                control = QGVAR(moduleShortDescription);
                property = QGVAR(moduleShortDescription);
            };
            class GVAR(moduleWarnings) {
                control = QGVAR(moduleWarnings);
                property = QGVAR(moduleWarnings);
            };
            class GVAR(dynamicCombo): Combo {
                control = QGVAR(dynamicCombo);
                GVAR(activeCondition) = "";
                // Observe combo value by default
                GVAR(observeValue) = 1;
            };
            class GVAR(dynamicEdit): Edit {
                control = QGVAR(dynamicEdit);
                GVAR(activeCondition) = "";
                // Do not observe edit value by default
                GVAR(observeValue) = 0;
            };
            class GVAR(moduleDescription) {
                control = QGVAR(moduleDescription);
                property = QGVAR(moduleDescription);
            };
        };

        class GVAR(moduleDescription) {
            // Same as isDisposable above, except it is just for info in module description
            isDisposable = 1;

            // Same as is3DEN above, except it is just for info in module description
            is3DEN = 0;

            // Full module description shown below module attributes
            // Note: This will be parsed as structured text
            description = "";

            // Short module description shown above module attributes
            // Note: This will be parsed as structured text
            shortDescription = "";

            // Info about importance of module position. If module position do
            // not matter leave empty string - proper info will be added
            // in description
            // Note: This will be parsed as structured text
            positionInfo = "";

            /*
             * List of objects module can be synced with
             *
             * Supported values (will show localized info):
             * "<anyUnit>" - for info about supported sync with units
             * "<anyVehicle>" - for info about supported sync with any vehicle
             * "<anyPlane>" - for info about supported sync with planes
             * "<anyObject>" - for info about supported sync with object of any type
             * or
             * {"type", "className"} - this will add list of object names (displayName)
             * divided into type groups. Supported types:
             * "module" - for localized info about sync with another module
             *
             * Note: If module has property isTriggerActivated set to 1, info
             * about triggers will be automatically added to description, you
             * do NOT have to add it here.
             */
            canSyncWith[] = {};

            /*
             * Set to 1 if module requires sync with at least one of the
             * canSyncWith elements to work properly.
             *
             * Note: This is just for information in module description, you
             * still have to check synchronizations in validator to generate warnings.
             */
            syncRequired = 0;

            // List of photos (textures, jpg or paa) with module sync schemas
            schemas[] = {};
        };
    };

    class GVAR(standardModule): Module_F {
        scope = 2;
        author = ECSTRING(main,Author);
        displayName = "Standard module";
        category = QGVAR(test);
        function = "";

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

    #include "modules\dynamicModule\module.hpp"
};
