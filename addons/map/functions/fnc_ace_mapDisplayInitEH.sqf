#include "\z\ace\addons\markers\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles XEH DisplayLoad for the various map displays (RscDiary)
 *
 * Arguments:
 * 0: Map Display (idd 12,37,52,53) <Display>
 *
 * Return Value:
 * None
 *
 * Example:
 * [display] call ace_markers_fnc_mapDisplayInitEH
 *
 * Public: No
 */

params ["_display"];
TRACE_1("params",_display);

// ---- EDIT
private _bisShapeLB = _display displayctrl 1091;
_bisShapeLB ctrlShow false;
_bisShapeLB ctrlCommit 0;
/*
private _curSelShape = missionNamespace getVariable [QGVAR(curSelMarkerShape), 0];
TRACE_2("shape",_bisShapeLB,_curSelShape);
_bisShapeLB ctrlAddEventHandler ["LBSelChanged", {_this call FUNC(onLBSelChangedShape)}];
_bisShapeLB lbSetCurSel _curSelShape;
*/

private _bisColorLB = _display displayctrl 1090;
_bisColorLB ctrlShow false;
_bisColorLB ctrlCommit 0;
/*
private _curSelColor = missionNamespace getVariable [QGVAR(curSelMarkerColor), 0];
TRACE_2("color",_bisColorLB,_curSelColor);
_bisColorLB ctrlAddEventHandler ["LBSelChanged", {_this call FUNC(onLBSelChangedColor)}];
_bisColorLB lbSetCurSel _curSelColor;
*/
// ---- !EDIT

// movable markers
private _ctrlMap = _display displayCtrl 51;
_ctrlMap ctrlAddEventHandler ["MouseButtonDown", {_this call FUNC(onMouseButtonDown)}];
_ctrlMap ctrlAddEventHandler ["MouseButtonUp", {_this call FUNC(onMouseButtonUp)}];

// ---- EDIT
GVAR(tmpMapDrawEH) = _ctrlMap ctrlAddEventHandler ["Draw", {
  params ["_ctrl"];

  setCurrentChannel 0;
  _ctrl ctrlMapAnimAdd [0, 1, [worldSize / 2, worldSize / 2, 0]];
  ctrlMapAnimCommit _ctrl;

  _ctrl ctrlRemoveEventHandler ["Draw", GVAR(tmpMapDrawEH)];
  GVAR(tmpMapDrawEH) = nil;
}];
// ---- !EDIT
