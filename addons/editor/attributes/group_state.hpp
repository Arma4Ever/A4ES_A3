class dynamicSimulation {
    control = QGVAR(hiddenCheckbox);
};
class GVAR(disableDynamicSimulation) {
    displayName = CSTRING(DisableDynamicSimulation);
    tooltip = CSTRING(DisableDynamicSimulation_Tooltip);
    property = QGVAR(disableDynamicSimulation);
    control = "Checkbox";
    expression = QUOTE(if (is3DEN) then {_this call FUNC(updateDynamicSimulation);};);
    defaultValue = "false";
    typeName = "BOOL";
};
class GVAR(enableGunLights) {
    displayName = CSTRING(enableGunLights);
    tooltip = CSTRING(enableGunLights_Tooltip);
    property = QGVAR(enableGunLights);
    control = "Checkbox";
    expression = "if (_value) then {_this enableGunLights 'ForceOn';};";
    defaultValue = "false";
    condition = "objectBrain";
};
