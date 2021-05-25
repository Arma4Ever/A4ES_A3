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
            class GVAR(moduleSubCategory) {
                control = QGVAR(moduleSubCategory);
                property = QGVAR(moduleSubCategory);
            };
            class GVAR(moduleWarnings) {
                control = QGVAR(moduleWarnings);
                property = QGVAR(moduleWarnings);
            };
            class GVAR(moduleDescription) {
                control = QGVAR(moduleDescription);
                property = QGVAR(moduleDescription);
            };

            class GVAR(dynamicCombo): Combo {
                control = QGVAR(dynamicCombo);
                // Observe combo value by default
                GVAR(observeValue) = 1;
            };

            class GVAR(dynamicEdit): Edit {
                control = QGVAR(dynamicEdit);
            };
            class GVAR(dynamicEditMulti3): Edit {
                control = QGVAR(dynamicEditMulti3);
            };
            class GVAR(dynamicEditMulti5): Edit {
                control = QGVAR(dynamicEditMulti5);
            };
            class GVAR(dynamicEditCode): Edit {
                control = QGVAR(dynamicEditCode);
                validate = "";
            };
            class GVAR(dynamicEditCodeMulti3): Edit {
                control = QGVAR(dynamicEditCodeMulti3);
                validate = "";
            };
            class GVAR(dynamicEditCodeMulti5): Edit {
                control = QGVAR(dynamicEditCodeMulti5);
                validate = "";
            };

            class GVAR(dynamicCheckbox): Checkbox {
                control = QGVAR(dynamicCheckbox);
                // Observe checkbox value by default
                GVAR(observeValue) = 1;
            };

            class GVAR(dynamicToolboxSide): Default {
                control = QGVAR(dynamicToolboxSide);
                typeName = "NUMBER";
            };

            class GVAR(dynamicToolboxTaskState): Default {
                control = QGVAR(dynamicToolboxTaskState);
                typeName = "NUMBER";
            };

            class GVAR(dynamicToolboxUnitStance): Default {
                control = QGVAR(dynamicToolboxUnitStance);
                typeName = "NUMBER";
            };

            class GVAR(dynamicSlider): Default {
                control = QGVAR(dynamicSlider);
                typeName = "NUMBER";
                GVAR(range[]) = {0, 1};
                GVAR(valueUnit) = "";
            };
            class GVAR(dynamicSliderPercent): GVAR(dynamicSlider) {
                control = QGVAR(dynamicSliderPercent);
                GVAR(valueUnit) = "%";
            };
            class GVAR(dynamicSkillSlider): Default {
                control = QGVAR(dynamicSkillSlider);
                typeName = "NUMBER";
            };
        };

        class GVAR(moduleDescription) {
            // Same as isDisposable above, except it is just for info in module description
            isDisposable = 1;

            // Set 1 if module effect is hidden/deactivated upon synced trigger deactivation
            deactivationDisablesEffect = 0;

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

            // Info about sync requirements, replaces standard syncRequired info, requires syncRequired param to be greater than 0
            syncRequiredInfo = "";

            // List of photos (textures, jpg or paa) with module use schemas
            schemas[] = {};

            // API functions related to this module, in format {{"name", "desc"}, {"name", "desc"}}
            apiFunctions[] = {};
        };
    };

    // Base class for curator modules
    class GVAR(baseCurator): Module_F {
        scope = 0;
        scopeCurator = 0;
        is3DEN = 0;
        isGlobal = 1;
        isTriggerActivated = 0;
        curatorCanAttach = 1;
        curatorCost = 0;
        curatorInfoType = "";
    };

    #include "modules\coverMap\module.hpp"
    #include "modules\curator\module.hpp"
    #include "modules\generateSoldiers\module.hpp"
    #include "modules\generatorComposition\module.hpp"
    #include "modules\registerArtilleryUnits\module.hpp"
    #include "modules\switchLights\module.hpp"
    #include "modules\ambientFlyby\module.hpp"
    #include "modules\fireArtillery\module.hpp"
    #include "modules\aiNightvision\module.hpp"
    #include "modules\addCuratorModule\module.hpp"
    #include "modules\radioJammer\module.hpp"
    #include "modules\createTask\module.hpp"
    #include "modules\setTaskState\module.hpp"

    // #include "modules\spawnUnits\module.hpp"

    /*#include "hiddenModules.hpp"*/
};
