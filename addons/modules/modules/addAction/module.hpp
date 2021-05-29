class GVAR(addAction): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(addAction_displayName);
    icon = QPATHTOF(modules\addAction\data\icon.paa);
    category = QGVAR(actions);
    function = QFUNC(addAction_module);
    functionPriority = 1;
    isTriggerActivated = 1;
    GVAR(validator) = QFUNC(addAction_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        // Attributes for module activator
        #define MODULE_ACTIVATOR_CONTROL QGVAR(dynamicToolboxActivationModeMissionStart)
        #define MODULE_ACTIVATOR_DEFAULT_VALUE QUOTE(-1)
        #include "\z\a3cs\addons\modules\includes\moduleActivationAttributes.hpp"

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(addAction_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };

        // Read only action ID, auto generated in validator
        class GVAR(id): GVAR(dynamicEdit) {
            displayName = CSTRING(addAction_Attributes_id);
            tooltip = CSTRING(addAction_Attributes_id_tooltip);
            property = QGVAR(id);
            defaultValue = "''";
            unique = 1;
            GVAR(description) = CSTRING(addAction_Attributes_id_desc);
            GVAR(disabled) = 1;
        };

        class GVAR(owner): GVAR(dynamicOwnerToolbox) {
            displayName = CSTRING(addAction_Attributes_owner);
            tooltip = CSTRING(addAction_Attributes_owner_tooltip);
            property = QGVAR(owner);
            typeName = "NUMBER";
            defaultValue = "0";
        };


        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(createTask_shortDescription);
    };
};
