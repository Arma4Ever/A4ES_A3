#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Main menu display onLoad handler
 */

params ["_display"];
TRACE_1("onLoadDisplayMain", _display);

/* Spotlight info box */

_this call (uiNamespace getVariable QFUNC(updateInfoSpotlight));

/* Spotlight buttons */

private _spotlightGroupLeft = _display displayCtrl 71021;
private _spotlightGroupRight = _display displayCtrl 71022;

private _spotlightButtonLeft = _spotlightGroupLeft controlsGroupCtrl 1026;
_spotlightButtonLeft ctrlAddEventHandler ["buttonClick", {
	_this call (uiNamespace getVariable QFUNC(join));
}];

private _spotlightButtonRight = _spotlightGroupRight controlsGroupCtrl 1026;
_spotlightButtonRight ctrlAddEventHandler ["buttonClick", {
	params ["_ctrlButton"];
	ctrlActivate ((ctrlParent _ctrlButton) displayCtrl 142);
}];

{
	_x params ["_title", "_ctrlGroup"];

	_ctrlGroup ctrlSetFade 0;
	_ctrlGroup ctrlCommit 0.1;

	private _ctrlText = _ctrlGroup controlsGroupCtrl 1028;
	_ctrlText ctrlSetStructuredText (parseText _title);

	private _ctrlTextHeight = ctrlTextHeight _ctrlText;
	private _ctrlTextPos = ctrlPosition _ctrlText;

	_ctrlTextPos set [1, (((ctrlPosition _ctrlGroup) # 3) - _ctrlTextHeight) / 2];
	_ctrlTextPos set [3, _ctrlTextHeight];

	_ctrlText ctrlSetPosition _ctrlTextPos;
	_ctrlText ctrlCommit 0;
	_ctrlText ctrlEnable false;
	_ctrlText setVariable ["pos", _ctrlTextPos];

	private _ctrlButton = _ctrlGroup controlsGroupCtrl 1026;

	_ctrlButton ctrlAddEventHandler ["mouseEnter", {_this call (uiNamespace getVariable QFUNC(spotlightEnter))}];
	_ctrlButton ctrlAddEventHandler ["setFocus", {_this call (uiNamespace getVariable QFUNC(spotlightEnter))}];
	
	_ctrlButton ctrlAddEventHandler ["mouseExit", {_this call (uiNamespace getVariable QFUNC(spotlightExit))}];
	_ctrlButton ctrlAddEventHandler ["killFocus", {_this call (uiNamespace getVariable QFUNC(spotlightExit))}];
	
} forEach [
	["DOŁĄCZ", _spotlightGroupLeft],
	["EDYTOR", _spotlightGroupRight]
];