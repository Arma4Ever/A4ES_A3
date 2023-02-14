#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Spotlight button exit event
 */

params ["_ctrlButton"];
TRACE_1("spotlightExit", _ctrlButton);

private _ctrlGroup = ctrlParentControlsGroup _ctrlButton;
private _ctrlPicture = _ctrlGroup controlsGroupCtrl 1023;
private _ctrlHover = _ctrlGroup controlsGroupCtrl 1025;
private _ctrlGroupPos = ctrlposition _ctrlGroup;

_ctrlPicture ctrlsettextcolor [1, 1, 1, 1];
_ctrlHover ctrlsetfade 1;
_ctrlHover ctrlcommit 0.1;