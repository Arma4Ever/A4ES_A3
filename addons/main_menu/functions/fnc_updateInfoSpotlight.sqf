#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates info spotlight in game main menu
 */
params ["_display"];

if (isNull _display) exitWith {};

private _spotlightCenter = _display displayCtrl 71020;
private _spotlightCenterText = _spotlightCenter controlsGroupCtrl 1028;
private _spotlightCenterBackground = _spotlightCenter controlsGroupCtrl 1023;

uiNamespace setVariable [QGVAR(spotlightInfoError), true];

private _test = "a4es_common" callExtension "test";
if (_test == "true") then {
    private _accessToken = profileNamespace getVariable [QGVAR(actkn), ""];
    if (_accessToken == "") exitWith {
        _spotlightCenterText ctrlSetStructuredText (parseText format["<t font='PuristaBold' size='1' color='#e01709'>%1</t>", LLSTRING(NoToken)]);
    };

    private _response = "a4es_common" callExtension ["playerInfo", [A4ES_C_G, _accessToken, profileNameSteam]];
    _response params ["_result", "_code"];

    if (_code == 1) then {
        _spotlightCenterText ctrlSetStructuredText (parseText _result);
        _spotlightCenterBackground ctrlSetText QPATHTOF(data\spotlight_info_ca.paa);
        uiNamespace setVariable [QGVAR(spotlightInfoError), false];
    } else {
        _spotlightCenterText ctrlSetStructuredText (parseText format["<t font='PuristaBold' size='1' color='#e01709'>%1</t>", LLSTRING(VerificationError)]);
    };
} else {
    _spotlightCenterText ctrlSetStructuredText (parseText format["<t font='PuristaBold' size='1' color='#e01709'>%1</t>", LLSTRING(ExtensionError)]);
};

if (uiNamespace getVariable [QGVAR(spotlightInfoError), false]) then {
    _spotlightCenterBackground ctrlSetText QPATHTOF(data\spotlight_info_error_ca.paa);
};

private _spotlightCenterHeight = ctrlTextHeight _spotlightCenterText;
private _spotlightCenterPos = ctrlPosition _spotlightCenterText;

_spotlightCenterPos set [1, (((ctrlPosition _spotlightCenter) # 3) - _spotlightCenterHeight) / 2];
_spotlightCenterPos set [3, _spotlightCenterHeight];

_spotlightCenterText ctrlSetPosition _spotlightCenterPos;
_spotlightCenterText ctrlCommit 0;

_spotlightCenter ctrlSetFade 0;
_spotlightCenter ctrlCommit 0.1;