class GVAR(doStop) {
    displayName = CSTRING(doStop);
    tooltip = CSTRING(doStop_Tooltip);
    property = QGVAR(doStop);
    control = "Checkbox";
    expression = "if (_value) then {doStop _this;};";
    defaultValue = "false";
    condition = "objectBrain";
};
class GVAR(disableRandomization) {
    displayName = CSTRING(disableRandomization);
    tooltip = CSTRING(disableRandomization_Tooltip);
    property = QGVAR(disableRandomization);
    control = "Checkbox";
    expression = QUOTE(if (_value) then {_this call EFUNC(common,disableRandomization)};);
    defaultValue = "false";
};
