class GVAR(dynamicSimulationInited) {
    displayName = QGVAR(dynamicSimulationInited);
    control = QGVAR(hiddenCheckbox);
    property = QGVAR(dynamicSimulationInited);
    expression = "";
    defaultValue = "false";
};
class GVAR(enableGunLights) {
    displayName = CSTRING(enableGunLights);
    tooltip = CSTRING(enableGunLights_Tooltip);
    property = QGVAR(enableGunLights);
    control = "Checkbox";
    expression = "if (_value) then {_this enableGunLights 'ForceOn';};";
    defaultValue = "false";
};
