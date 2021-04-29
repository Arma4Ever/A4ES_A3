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
