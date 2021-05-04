class GVAR(doStop) {
    displayName = CSTRING(doStop);
    tooltip = CSTRING(doStop_Tooltip);
    property = QGVAR(doStop);
    control = "Checkbox";
    expression = "if (_value) then {_this setVariable ['%s', true];};";
    defaultValue = "false";
    condition = "objectBrain";
};
class GVAR(forceGunLights) {
    displayName = CSTRING(forceGunLights);
    tooltip = CSTRING(forceGunLights_Tooltip);
    property = QGVAR(forceGunLights);
    control = "Checkbox";
    expression = "if (_value) then {_this setVariable ['%s', true];};";
    defaultValue = "false";
    condition = "objectBrain";
};
class GVAR(disableBISRandomization) {
    displayName = CSTRING(disableBISRandomization);
    tooltip = CSTRING(disableBISRandomization_Tooltip);
    property = QGVAR(disableBISRandomization);
    control = "Checkbox";
    expression = "if (_value) then {_this setVariable ['BIS_enableRandomization', false];};";
    defaultValue = "false";
};
