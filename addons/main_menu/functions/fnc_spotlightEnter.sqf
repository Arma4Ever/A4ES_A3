#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Spotlight button enter event
 */

params ["_ctrlButton"];
TRACE_1("spotlightEnter", _ctrlButton);

private _ctrlGroup = ctrlParentControlsGroup _ctrlButton;
private _ctrlPicture = _ctrlGroup controlsGroupCtrl 1023;
private _ctrlHover = _ctrlGroup controlsGroupCtrl 1025;
private _ctrlGroupPos = ctrlposition _ctrlGroup;

_ctrlHover ctrlsetfade 0;
_ctrlHover ctrlcommit 0.1;