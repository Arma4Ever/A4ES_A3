#include "script_component.hpp"

if !(hasInterface) exitWith {};

// Create overlay and hide it
QGVAR(overlay) cutRsc [QGVAR(overlay), "PLAIN", -1, false];
private _display = uiNamespace getVariable QGVAR(overlay);
private _overlayCtrl = _display displayCtrl IDC_OVERLAY;
_overlayCtrl ctrlSetFade 1;
_overlayCtrl ctrlCommit 0;

GVAR(ppEffectCC) = ppEffectCreate ["colorCorrections", 1498];
GVAR(ppEffectCC) ppEffectAdjust [1, 1, 0, [0, 0, 0, 0], [1, 1, 1, 1],[1, 1, 1, 0]];
GVAR(ppEffectCC) ppEffectEnable true;
GVAR(ppEffectCC) ppEffectCommit 0;

GVAR(ppEffectBlur) = ppEffectCreate ["DynamicBlur", 807];
GVAR(ppEffectBlur) ppEffectAdjust [0];
GVAR(ppEffectBlur) ppEffectCommit 0.3;
GVAR(ppEffectBlur) ppEffectEnable true;

GVAR(lastSuppress) = -10;

["unit", {_this call FUNC(handlePlayerChanged)}, true] call CBA_fnc_addPlayerEventHandler;

// Update overlay texture based on map lighting conditions every 60 sec
[{0 call FUNC(updateOverlayTexture)}, 60] call CBA_fnc_addPerFrameHandler;
