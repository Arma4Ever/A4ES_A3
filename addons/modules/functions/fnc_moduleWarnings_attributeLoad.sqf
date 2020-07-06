#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * 3DEN moduleWarnings attributeLoad handler
 */

private _ctrlTextGroup = _this controlsGroupCtrl 101;
private _ctrlText = _ctrlTextGroup controlsGroupCtrl 100;

// Setup params for warnings updates
GVAR(moduleWarningsParams) = [_this, _ctrlTextGroup, _ctrlText];

// Initially set height 0
{
  private _controlPos = ctrlPosition _x;
  _controlPos set [3, 0];
  _x ctrlSetPosition _controlPos;
  _x ctrlCommit 0;
} forEach GVAR(moduleWarningsParams);

// Save config reference in control group
_this setVariable [QGVAR(attributeConfig), _config];

// Add control group to controls list
GVAR(allAttributesControls) pushBack _this;
