#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates overlay texture based on lighting conditions
 */

LOG("updateOverlayTexture");

private _display = uiNamespace getVariable [QGVAR(overlay), displayNull];
// Exit if no display - should not happen
if (isNull _display) exitWith {};

private _overlayCtrl = _display displayCtrl IDC_OVERLAY;

private _texture = ctrlText _overlayCtrl;
private _newTexture = QPATHTOF(data\overlay.paa);

// Set night overlay for low ambient light brightness
if ((getLighting # 1) < 25) then {
  _newTexture = QPATHTOF(data\overlay_night.paa);
};

// Exit if no change in texture
if (_texture isEqualTo _newTexture) exitWith {};

_overlayCtrl ctrlSetText _newTexture;
TRACE_1("Overlay texture updated",_newTexture);
