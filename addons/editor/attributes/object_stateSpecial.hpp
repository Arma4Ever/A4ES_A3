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
class GVAR(disableRandomization) {
    displayName = CSTRING(disableRandomization);
    tooltip = CSTRING(disableRandomization_Tooltip);
    property = QGVAR(disableRandomization);
    control = "Checkbox";
    expression = "if (_value) then {_this setVariable ['BIS_enableRandomization', false];_this setVariable ['ALiVE_OverrideLoadout', true];_this setVariable ['CFP_DisableRandom', true];_this setVariable ['NoRandom', true]};";
    defaultValue = "false";
};
