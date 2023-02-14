#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Join dialog
 */

LOG("join");

private _accessToken = profileNamespace getVariable [QGVAR(actkn), ""];
private _createDisplay = true;

if (_accessToken != "") then {
    private _response = "a4es_common" callExtension ["connectAccessToken", [A4ES_C_G, _accessToken, profileNameSteam]];
    _response params ["_result", "_code"];

    if (_code == 1) exitWith {
        _createDisplay = false;
        connectToServer (parseSimpleArray _result);
    };
};

if !(_createDisplay) exitWith {};

private _mainDisplay = findDisplay 0;
if (isNull _mainDisplay) exitWith {};

_mainDisplay createDisplay "RscDisplayA4ESServerToken";