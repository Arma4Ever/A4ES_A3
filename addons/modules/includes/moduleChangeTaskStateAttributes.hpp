
class GVAR(changeTaskStateSettingsSubCategory): GVAR(moduleSubCategory) {
    displayName = CSTRING(Attributes_changeTaskStateSettingsSubCategory);
    property = QGVAR(changeTaskStateSettingsSubCategory);
};

class GVAR(changeTaskState): GVAR(dynamicCheckbox) {
    displayName = CSTRING(Attributes_changeTaskState);
    tooltip = CSTRING(Attributes_changeTaskState_tooltip);
    property = QGVAR(changeTaskState);
    defaultValue = "false";
    ATTRIBUTE_LOCAL;
};

class GVAR(task): GVAR(dynamicCombo) {
    displayName = CSTRING(setTaskState_Attributes_task);
    tooltip = CSTRING(setTaskState_Attributes_task_tooltip);
    property = QGVAR(task);
    typeName = "STRING";
    defaultValue = "''";
    GVAR(insertValues) = QFUNC(setTaskState_task_insertValues);
    GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(changeTaskState)) isEqualTo true);
    ATTRIBUTE_LOCAL;
};

class GVAR(taskState): GVAR(dynamicToolboxTaskState) {
    displayName = CSTRING(setTaskState_Attributes_state);
    tooltip = CSTRING(setTaskState_Attributes_state_tooltip);
    property = QGVAR(taskState);
    defaultValue = "0";
    GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(changeTaskState)) isEqualTo true);
    ATTRIBUTE_LOCAL;
};

class GVAR(taskStateDelay): GVAR(dynamicEdit) {
    displayName = CSTRING(Attributes_taskStateDelay);
    tooltip = CSTRING(Attributes_taskStateDelay_tooltip);
    property = QGVAR(taskStateDelay);
    typeName = "NUMBER";
    defaultValue = "0";
    validate = "number";
    GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(changeTaskState)) isEqualTo true);
    ATTRIBUTE_LOCAL;
};

class GVAR(taskShowNotification): GVAR(dynamicCheckbox) {
    displayName = CSTRING(setTaskState_Attributes_showNotification);
    tooltip = CSTRING(setTaskState_Attributes_showNotification_tooltip);
    property = QGVAR(taskShowNotification);
    defaultValue = "true";
    GVAR(observeValue) = 0;
    GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(changeTaskState)) isEqualTo true);
    ATTRIBUTE_LOCAL;
};
