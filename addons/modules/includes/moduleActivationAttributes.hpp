class GVAR(activationSettingsSubCategory): GVAR(moduleSubCategory) {
    displayName = CSTRING(Attributes_activationSettingsSubCategory);
    property = QGVAR(activationSettingsSubCategory);
};
class GVAR(activationMode): GVAR(dynamicToolboxActivationMode) {
    displayName = CSTRING(Attributes_activationMode);
    tooltip = CSTRING(Attributes_activationMode_Tooltip);
    property = QGVAR(activationMode);
    defaultValue = "0";
};
class GVAR(activationNearestPlayerDistance): GVAR(dynamicSlider) {
    displayName = CSTRING(Attributes_activationNearestPlayerDistance);
    tooltip = CSTRING(Attributes_activationNearestPlayerDistance_Tooltip);
    property = QGVAR(activationNearestPlayerDistance);
    defaultValue = "800";
    typeName = "NUMBER";
    GVAR(range[]) = {1, 3000};
    GVAR(valueUnit) = "m";
    GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(activationMode)) isEqualTo 0);
};
class GVAR(activationIgnoreHelicopters): GVAR(dynamicCheckbox) {
    displayName = CSTRING(Attributes_activationIgnoreHelicopters);
    tooltip = CSTRING(Attributes_activationIgnoreHelicopters_tooltip);
    property = QGVAR(activationIgnoreHelicopters);
    GVAR(observeValue) = 0;
    GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(activationMode)) isEqualTo 0);
};
class GVAR(activationIgnorePlanes): GVAR(dynamicCheckbox) {
    displayName = CSTRING(Attributes_activationIgnorePlanes);
    tooltip = CSTRING(Attributes_activationIgnorePlanes_tooltip);
    property = QGVAR(activationIgnorePlanes);
    GVAR(observeValue) = 0;
    GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(activationMode)) isEqualTo 0);
};
class GVAR(activationCondition): GVAR(dynamicEditCodeMulti5) {
    displayName = CSTRING(Attributes_activationCondition);
    tooltip = CSTRING(Attributes_activationCondition_Tooltip);
    property = QGVAR(activationCondition);
    defaultValue = "'true'";
    typeName = "STRING";
    validate = "condition";
    GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(activationMode)) isEqualTo 1);
};
class GVAR(activationDelay): GVAR(dynamicCheckbox) {
    displayName = CSTRING(Attributes_activationDelay);
    tooltip = CSTRING(Attributes_activationDelay_tooltip);
    property = QGVAR(activationDelay);
    GVAR(conditionActive) = QUOTE((_this getVariable QQGVAR(activationMode)) isNotEqualTo 2);
};
class GVAR(activationDelayTime): GVAR(dynamicEdit) {
    displayName = CSTRING(Attributes_activationDelayTime);
    tooltip = CSTRING(Attributes_activationDelayTime_Tooltip);
    property = QGVAR(activationDelayTime);
    defaultValue = "'0'";
    validate = "NUMBER";
    GVAR(conditionActive) = QUOTE(((_this getVariable QQGVAR(activationDelay)) isEqualTo true) && ((_this getVariable QQGVAR(activationMode)) isNotEqualTo 2));
};
