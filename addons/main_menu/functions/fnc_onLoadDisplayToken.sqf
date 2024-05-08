#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Token dialog onLoad handler
 */

params ["_display"];
TRACE_1("onLoadDisplayToken",_display);

if (isNull _display) exitWith {};

private _currentDisplay = uiNamespace getVariable [QGVAR(RscDisplayA4ESServerToken), displayNull];
if !(isNull _currentDisplay) exitWith {};

uiNamespace setVariable [QGVAR(RscDisplayA4ESServerToken), _display];

private _ctrlEditToken = _display displayCtrl 101;
private _ctrlEditLabel = _display displayCtrl 1002;
private _ctrlSubtext = _display displayCtrl 1003;
private _ctrlLoadingText = _display displayCtrl 1004;
_ctrlLoadingText ctrlShow false;

private _ctrlButtonCancel = _display displayCtrl 103;
_ctrlButtonCancel setVariable [QGVAR(display), _display];

private _ctrlButtonOk = _display displayCtrl 102;
_ctrlButtonOk setVariable [QGVAR(display), _display];
_ctrlButtonOk setVariable [QGVAR(ctrlEditToken), _ctrlEditToken];
_ctrlButtonOk setVariable [QGVAR(ctrlEditLabel), _ctrlEditLabel];
_ctrlButtonOk setVariable [QGVAR(ctrlSubtext), _ctrlSubtext];
_ctrlButtonOk setVariable [QGVAR(ctrlButtonCancel), _ctrlButtonCancel];
_ctrlButtonOk setVariable [QGVAR(ctrlLoadingText), _ctrlLoadingText];

private _test = "a4es_common" callExtension "test";
if (_test != "true") exitWith {
    _ctrlEditToken ctrlShow false;
    _ctrlEditLabel ctrlShow false;
    _ctrlButtonOk ctrlShow false;
    _ctrlButtonCancel ctrlShow false;
    _ctrlSubtext ctrlShow false;
    _ctrlLoadingText ctrlShow true;
    _ctrlLoadingText ctrlSetStructuredText parseText format["<t font='RobotoCondensedBold'><t color='#e01709'>%1</t>", LLSTRING(ExtensionResponseError)];
};

_ctrlSubtext ctrlSetStructuredText parseText format["<t font='RobotoCondensedBold'>%1</t>", LLSTRING(EnterToken)];

_ctrlButtonCancel ctrlAddEventHandler ["buttonClick", {
    (uiNamespace getVariable [QGVAR(RscDisplayA4ESServerToken), displayNull]) closeDisplay 2;
}];
_ctrlButtonOk ctrlAddEventHandler ["buttonClick", {
    _this call (uiNamespace getVariable QFUNC(joinClick));
}];