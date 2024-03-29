class GVAR(addDialogue): GVAR(base) {
    scope = 2;
    author = "SzwedzikPL";
    displayName = CSTRING(addDialogue_displayName);
    icon = QPATHTOF(modules\addDialogue\data\icon.paa);
    category = QGVAR(dialogues);
    function = QFUNC(addDialogue_module);
    isTriggerActivated = 0;
    GVAR(validator) = QFUNC(addDialogue_validate);

    class Attributes: AttributesBase {
        class GVAR(moduleShortDescription): GVAR(moduleShortDescription) {};
        class GVAR(moduleWarnings): GVAR(moduleWarnings) {};

        class GVAR(baseSettingsSubCategory): GVAR(moduleSubCategory) {
            displayName = CSTRING(addDialogue_Attributes_baseSettingsSubCategory);
            property = QGVAR(baseSettingsSubCategory);
        };

        // Read only task ID, auto generated in validator
        class GVAR(id): GVAR(dynamicEdit) {
            displayName = CSTRING(addDialogue_Attributes_id);
            tooltip = CSTRING(addDialogue_Attributes_id_tooltip);
            property = QGVAR(id);
            defaultValue = "''";
            unique = 1;
            GVAR(description) = CSTRING(addDialogue_Attributes_id_desc);
            GVAR(disabled) = 1;
            ATTRIBUTE_LOCAL;
        };

        class GVAR(name): GVAR(dynamicEdit) {
            displayName = CSTRING(addDialogue_Attributes_name);
            tooltip = CSTRING(addDialogue_Attributes_name_tooltip);
            property = QGVAR(name);
            defaultValue = "";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(title): GVAR(dynamicEdit) {
            displayName = CSTRING(addDialogue_Attributes_title);
            tooltip = CSTRING(addDialogue_Attributes_title_tooltip);
            property = QGVAR(uiTitle);
            defaultValue = "'%1'";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(initialMessage): GVAR(dynamicEditMulti5) {
            displayName = CSTRING(addDialogue_Attributes_initialMessage);
            tooltip = CSTRING(addDialogue_Attributes_initialMessage_tooltip);
            property = QGVAR(initialMessage);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(addCondition): GVAR(dynamicCheckbox) {
            displayName = CSTRING(addDialogue_Attributes_addCondition);
            tooltip = CSTRING(addDialogue_Attributes_addCondition_tooltip);
            property = QGVAR(addCondition);
            defaultValue = "false";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(conditionType): GVAR(dynamicToolboxActionConditionType) {
            displayName = CSTRING(addDialogue_Attributes_conditionType);
            tooltip = CSTRING(addDialogue_Attributes_conditionType_tooltip);
            property = QGVAR(conditionType);
            defaultValue = "1";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addCondition)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(conditionLogicFlags): GVAR(dynamicLogicFlagCond) {
            displayName = CSTRING(addDialogue_Attributes_conditionLogicFlags);
            tooltip = CSTRING(addDialogue_Attributes_conditionLogicFlags_tooltip);
            property = QGVAR(conditionLogicFlags);
            defaultValue = QUOTE('[]');
            GVAR(conditionActive) = QUOTE(((_this getVariable QQGVAR(addCondition)) isEqualTo true) && {(_this getVariable QQGVAR(conditionType)) isEqualTo 0});
            ATTRIBUTE_LOCAL;
        };

        class GVAR(conditionScript): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(addDialogue_Attributes_conditionScript);
            tooltip = CSTRING(addDialogue_Attributes_conditionScript_tooltip);
            GVAR(description) = CSTRING(addDialogue_Attributes_conditionScript_desc);
            property = QGVAR(conditionScript);
            defaultValue = "'true'";
            typeName = "STRING";
            validate = "condition";
            GVAR(conditionActive) = QUOTE(((_this getVariable QQGVAR(addCondition)) isEqualTo true) && {(_this getVariable QQGVAR(conditionType)) isEqualTo 1});
            ATTRIBUTE_LOCAL;
        };

        class GVAR(rejectionMessage): GVAR(dynamicEditMulti5) {
            displayName = CSTRING(addDialogue_Attributes_rejectionMessage);
            tooltip = CSTRING(addDialogue_Attributes_rejectionMessage_tooltip);
            property = QGVAR(rejectionMessage);
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addCondition)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(addStartClientHandler): GVAR(dynamicCheckbox) {
            displayName = CSTRING(addDialogue_Attributes_addStartClientHandler);
            tooltip = CSTRING(addDialogue_Attributes_addStartClientHandler_tooltip);
            property = QGVAR(addStartClientHandler);
            defaultValue = "false";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(startClientHandler): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(addDialogue_Attributes_startClientHandler);
            tooltip = CSTRING(addDialogue_Attributes_startClientHandler_tooltip);
            GVAR(description) = CSTRING(addDialogue_Attributes_startClientHandler_desc);
            property = QGVAR(startClientHandler);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addStartClientHandler)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(addStartServerHandler): GVAR(dynamicCheckbox) {
            displayName = CSTRING(addDialogue_Attributes_addStartServerHandler);
            tooltip = CSTRING(addDialogue_Attributes_addStartServerHandler_tooltip);
            property = QGVAR(addStartServerHandler);
            defaultValue = "false";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(startServerHandler): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(addDialogue_Attributes_startServerHandler);
            tooltip = CSTRING(addDialogue_Attributes_startServerHandler_tooltip);
            GVAR(description) = CSTRING(addDialogue_Attributes_startServerHandler_desc);
            property = QGVAR(startServerHandler);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addStartServerHandler)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(changeLogicFlagOnStart): GVAR(dynamicCheckbox) {
            displayName = CSTRING(addDialogue_Attributes_changeLogicFlagOnStart);
            tooltip = CSTRING(addDialogue_Attributes_changeLogicFlagOnStart_tooltip);
            property = QGVAR(changeLogicFlagOnStart);
            defaultValue = "false";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(changeLogicFlag): GVAR(dynamicCombo) {
            displayName = CSTRING(addDialogue_Attributes_changeLogicFlag);
            tooltip = CSTRING(addDialogue_Attributes_changeLogicFlag_tooltip);
            property = QGVAR(logicFlag);
            typeName = "STRING";
            defaultValue = "''";
            GVAR(insertValues) = QFUNC(setLogicFlagValue_logicFlag_insertValues);
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(changeLogicFlagOnStart)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(changeLogicFlagValue): GVAR(dynamicCombo) {
            displayName = CSTRING(addDialogue_Attributes_changeLogicFlagValue);
            tooltip = CSTRING(addDialogue_Attributes_changeLogicFlagValue_tooltip);
            property = QGVAR(logicFlagValue);
            typeName = "NUMBER";
            defaultValue = "0";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(changeLogicFlagOnStart)) isEqualTo true);
            ATTRIBUTE_LOCAL;
            class values {
                class valueFalse {
                    name = ECSTRING(common,False);
                    value = 0;
                    default = 1;
                };
                class valueTrue {
                    name = ECSTRING(common,True);
                    value = 1;
                };
            };
        };

        class GVAR(addEndClientHandler): GVAR(dynamicCheckbox) {
            displayName = CSTRING(addDialogue_Attributes_addEndClientHandler);
            tooltip = CSTRING(addDialogue_Attributes_addEndClientHandler_tooltip);
            property = QGVAR(addEndClientHandler);
            defaultValue = "false";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(endClientHandler): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(addDialogue_Attributes_endClientHandler);
            tooltip = CSTRING(addDialogue_Attributes_endClientHandler_tooltip);
            GVAR(description) = CSTRING(addDialogue_Attributes_endClientHandler_desc);
            property = QGVAR(endClientHandler);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addEndClientHandler)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(addEndServerHandler): GVAR(dynamicCheckbox) {
            displayName = CSTRING(addDialogue_Attributes_addEndServerHandler);
            tooltip = CSTRING(addDialogue_Attributes_addEndServerHandler_tooltip);
            property = QGVAR(addEndServerHandler);
            defaultValue = "false";
            ATTRIBUTE_LOCAL;
        };

        class GVAR(endServerHandler): GVAR(dynamicEditCodeMulti5) {
            displayName = CSTRING(addDialogue_Attributes_endServerHandler);
            tooltip = CSTRING(addDialogue_Attributes_endServerHandler_tooltip);
            GVAR(description) = CSTRING(addDialogue_Attributes_endServerHandler_desc);
            property = QGVAR(endServerHandler);
            defaultValue = "''";
            typeName = "STRING";
            GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(addEndServerHandler)) isEqualTo true);
            ATTRIBUTE_LOCAL;
        };

        class GVAR(moduleDescription): GVAR(moduleDescription) {};
    };

    class GVAR(moduleDescription): GVAR(moduleDescription) {
        shortDescription = CSTRING(addDialogue_shortDescription);
        description = "";
    };
};
