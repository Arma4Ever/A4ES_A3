#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles incoming ace finger
 */

params ["", "_fingerPos"];

// Exit if radar disabled in settings
if !(GVAR(enabled) && GVAR(showRadar) && GVAR(showFingerPointers)) exitWith {};

private _display = uiNamespace getVariable [QGVAR(rscRadar), displayNull];
// Exit if radar not created
if (isNull _display) exitWith {
  LOG("Skipping handling ace finger, RscRadar is null");
};

LOG("Handling ace finger");

private _ctrlFingerPointers = _display displayCtrl IDC_RSCRADAR_FINGER_POINTERS;
private _ctrlFingerPointersPos = ctrlPosition _ctrlFingerPointers;

private _pointer = _display ctrlCreate ["RscPicture", -1, _ctrlFingerPointers];
_pointer ctrlSetPosition [
  0,
  0,
  _ctrlFingerPointersPos # 2,
  _ctrlFingerPointersPos # 3
];
_pointer ctrlSetTextColor GVAR(fingerPointerColor);
_pointer ctrlSetText QPATHTOF(data\radar\pointer.paa);
_pointer ctrlCommit 0;

private _cameraDirVector = (positionCameraToWorld [0, 0, 1]) vectorDiff (positionCameraToWorld [0, 0, 0]);
private _cameraDir = (_cameraDirVector # 0) atan2 (_cameraDirVector # 1);
_pointer ctrlSetAngle [(ace_player getDir _fingerPos) - _cameraDir, 0.5, 0.5];

// Add fade anim
[
  {
    params ["_pointer"];
    _pointer ctrlSetFade 1;
    _pointer ctrlCommit 0.5;
  },
  [_pointer],
  1.5
] call CBA_fnc_waitAndExecute;

[
  // Update pointer on each frame until timeout
  {
    params ["_pointer", "_fingerPos"];
    private _cameraDirVector = (positionCameraToWorld [0, 0, 1]) vectorDiff (positionCameraToWorld [0, 0, 0]);
    _pointer ctrlSetAngle [
      (ace_player getDir _fingerPos) - ((_cameraDirVector # 0) atan2 (_cameraDirVector # 1)),
      0.5,
      0.5
    ];
    false
  },
  {},
  [_pointer, _fingerPos],
  2,
  // Remove control on timeout
  {
    params ["_pointer"];
    ctrlDelete _pointer;
  }
] call CBA_fnc_waitUntilAndExecute;
