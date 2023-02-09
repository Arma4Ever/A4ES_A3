#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Join dialog
 */

private _currentDisplay = uiNamespace getVariable [QGVAR(RscDisplayA4ESServerToken), displayNull];
if !(isNull _currentDisplay) exitWith {};

private _display = createDialog ["RscDisplayA4ESServerToken", true];
if (isNull _display) exitWith {};

uiNamespace setVariable [QGVAR(RscDisplayA4ESServerToken), _display];
_display displayAddEventHandler ["unload", {
	private _mainDisplay = findDisplay 0;
	if (isNull _mainDisplay) exitWith {};
	(_mainDisplay displayCtrl 1021) ctrlShow true;
	(_mainDisplay displayCtrl 1020) ctrlShow true;
	(_mainDisplay displayCtrl 1022) ctrlShow true;
	(_mainDisplay displayCtrl 1123) ctrlShow true;
}];

private _mainDisplay = findDisplay 0;
if !(isNull _mainDisplay) then {
	(_mainDisplay displayCtrl 1021) ctrlShow false;
	(_mainDisplay displayCtrl 1020) ctrlShow false;
	(_mainDisplay displayCtrl 1022) ctrlShow false;
	(_mainDisplay displayCtrl 1123) ctrlShow false;
};

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
	_ctrlLoadingText ctrlSetStructuredText parseText "<t font='RobotoCondensedBold'><t color='#e01709'>Błąd odpowiedzi rozszerzenia ""a4es_common"".</t><br/>Sprawdź poprawność zainstalowanych modów.</t>";
};

_ctrlSubtext ctrlSetStructuredText parseText "<t font='RobotoCondensedBold'>Podaj swój token weryfikacyjny. Możesz go wygenerować na forum w panelu gracza, <a href='https://forum.arma4ever.pl/playercp#/server'>zakładka serwer</a>.</t>";

_ctrlButtonCancel ctrlAddEventHandler ["buttonClick", {
	params ["_ctrlButtonCancel"];
	(_ctrlButtonCancel getVariable [QGVAR(display), displayNull]) closeDisplay 2;
}];
_ctrlButtonOk ctrlAddEventHandler ["buttonClick", {
	_this call FUNC(joinClick);
}];

private _accessToken = profileNamespace getVariable [QGVAR(actkn), ""];
if (_accessToken != "") then {
	_ctrlEditToken ctrlShow false;
	_ctrlEditLabel ctrlShow false;
	_ctrlButtonOk ctrlShow false;
	_ctrlButtonCancel ctrlShow false;
	_ctrlSubtext ctrlShow false;
	_ctrlLoadingText ctrlShow true;
	_ctrlLoadingText ctrlSetStructuredText parseText "<t font='RobotoCondensedBold'>Weryfikacja...</t>";

	[_ctrlButtonOk, _accessToken] call FUNC(joinClick);
};

