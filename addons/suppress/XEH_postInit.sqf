#include "script_component.hpp"

if !(hasInterface) exitWith {};

// Create overlay and hide it
QGVAR(overlay) cutRsc [QGVAR(overlay), "PLAIN", -1, false];
private _display = uiNamespace getVariable QGVAR(overlay);
private _overlayCtrl = _display displayCtrl IDC_OVERLAY;
_overlayCtrl ctrlSetFade 1;
_overlayCtrl ctrlCommit 0;

["unit", {_this call FUNC(handlePlayerChanged)}, true] call CBA_fnc_addPlayerEventHandler;
