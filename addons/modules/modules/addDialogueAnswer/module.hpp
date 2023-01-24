class GVAR(addDialogueAnswer): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(addDialogueAnswer_displayName);
    icon = QPATHTOF(modules\addDialogueAnswer\data\icon.paa);
    category = QGVAR(dialogues);
    function = QFUNC(addDialogueAnswer_module);
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(addDialogueAnswer_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(createLogicFlag_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };

        // Read only task ID, auto generated in validator
        class GVAR(id): GVAR(dynamicEdit) {
            displayName = CSTRING(createLogicFlag_Attributes_id);
            tooltip = CSTRING(createLogicFlag_Attributes_id_tooltip);
            property = QGVAR(id);
            defaultValue = "''";
            unique = 1;
            GVAR(description) = CSTRING(createLogicFlag_Attributes_id_desc);
            GVAR(disabled) = 1;
            ATTRIBUTE_LOCAL;
        };

        class GVAR(title): GVAR(dynamicEdit) {
            displayName = CSTRING(createLogicFlag_Attributes_title);
            tooltip = CSTRING(createLogicFlag_Attributes_title_tooltip);
            property = QGVAR(title);
            GVAR(observeValue) = 1;
            GVAR(description) = CSTRING(createLogicFlag_Attributes_title_desc);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(text): GVAR(dynamicEditMulti5) {
            displayName = CSTRING(createTask_Attributes_description);
            tooltip = CSTRING(createTask_Attributes_description_tooltip);
            property = QGVAR(description);
            ATTRIBUTE_LOCAL;
        };

        // Add Condition
        //_condition


        //_onShowClientEH
        //_onShowServerEH
        //_changeLogicFlag

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(addDialogueAnswer_shortDescription);
        description = "";
    };
};
