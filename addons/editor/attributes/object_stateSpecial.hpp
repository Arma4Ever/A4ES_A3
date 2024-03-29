
class GVAR(dynamicSimulationInited) {
    displayName = QGVAR(dynamicSimulationInited);
    control = QGVAR(hiddenCheckbox);
    property = QGVAR(dynamicSimulationInited);
    expression = "";
    defaultValue = "false";
};
class GVAR(disableRandomization) {
    displayName = CSTRING(disableRandomization);
    tooltip = CSTRING(disableRandomization_Tooltip);
    property = QGVAR(disableRandomization);
    control = "Checkbox";
    expression = "if (_value) then {_this setVariable ['BIS_enableRandomization', false, true];_this setVariable ['ALiVE_OverrideLoadout', true, true];_this setVariable ['CFP_DisableRandom', true, true];_this setVariable ['NoRandom', true, true];};";
    defaultValue = "false";
};
class GVAR(isStationary) {
    displayName = CSTRING(isStationary);
    tooltip = CSTRING(isStationary_Tooltip);
    property = QGVAR(isStationary);
    control = "Checkbox";
    expression = QUOTE(if (is3DEN) then {[ARR_2(_this,_value)] call FUNC(isStationaryAttribute)});
    defaultValue = "false";
    condition = "objectBrain";
};
class GVAR(doStop) {
    displayName = CSTRING(doStop);
    tooltip = CSTRING(doStop_Tooltip);
    property = QGVAR(doStop);
    control = "Checkbox";
    expression = "if (_value) then {_this spawn {sleep 0.001;doStop _this;};};";
    defaultValue = "false";
    condition = "objectBrain";
};
class GVAR(disableTIEquipment) {
    displayName = CSTRING(disableTIEquipment);
    tooltip = CSTRING(disableTIEquipment_Tooltip);
    property = QGVAR(disableTIEquipment);
    control = "Checkbox";
    expression = "if (_value) then {_this disableTIEquipment _value;};";
    defaultValue = "false";
    condition = "objectVehicle";
};
class GVAR(disableNVGEquipment) {
    displayName = CSTRING(disableNVGEquipment);
    tooltip = CSTRING(disableNVGEquipment_Tooltip);
    property = QGVAR(disableNVGEquipment);
    control = "Checkbox";
    expression = "if (_value) then {_this disableNVGEquipment _value;};";
    defaultValue = "false";
    condition = "objectVehicle";
};
class GVAR(engineOn) {
    displayName = CSTRING(engineOn);
    tooltip = CSTRING(engineOn_Tooltip);
    property = QGVAR(engineOn);
    control = "Checkbox";
    expression = "if (!is3DEN && _value) then {_this engineOn _value;};";
    defaultValue = "false";
    condition = "objectVehicle";
};
class GVAR(enableHeadlights) {
    displayName = CSTRING(enableHeadlights);
    tooltip = CSTRING(enableHeadlights_Tooltip);
    property = QGVAR(enableHeadlights);
    control = "Checkbox";
    expression = "if (!is3DEN && _value) then {_this setPilotLight _value;};";
    defaultValue = "false";
    condition = "objectVehicle";
};
class GVAR(removeFromRemainsCollector) {
    displayName = CSTRING(removeFromRemainsCollector);
    tooltip = CSTRING(removeFromRemainsCollector_Tooltip);
    property = QGVAR(removeFromRemainsCollector);
    control = "Checkbox";
    expression = "if (!is3DEN && _value) then {_this spawn {sleep 0.001;removeFromRemainsCollector [_this];};};";
    defaultValue = "false";
};
class GVAR(maximumCargoLoad) {
    displayName = CSTRING(maximumCargoLoad);
    tooltip = CSTRING(maximumCargoLoad_Tooltip);
    property = QGVAR(maximumCargoLoad);
    control = "Edit";
    expression = "if (_value != (getNumber (configOf _this >> ""maximumLoad""))) then {_this setMaxLoad _value};";
    defaultValue = "(getNumber (configOf _this >> ""maximumLoad""))";
    condition = "objectHasInventoryCargo";
    typeName = "NUMBER";
    validate = "number";
};
