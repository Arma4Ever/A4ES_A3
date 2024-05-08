#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Join dialog button handler
 */

params ["_ctrlButtonOk"];
TRACE_1("joinClick",_ctrlButtonOk);

// Exit if dialog closed
if (isNull (uiNamespace getVariable [QGVAR(RscDisplayA4ESServerToken), displayNull])) exitWith {};

private _ctrlEditToken = _ctrlButtonOk getVariable [QGVAR(ctrlEditToken), controlNull];
private _ctrlEditLabel = _ctrlButtonOk getVariable [QGVAR(ctrlEditLabel), controlNull];
private _ctrlSubtext = _ctrlButtonOk getVariable [QGVAR(ctrlSubtext), controlNull];
private _ctrlButtonCancel = _ctrlButtonOk getVariable [QGVAR(ctrlButtonCancel), controlNull];
private _ctrlLoadingText = _ctrlButtonOk getVariable [QGVAR(ctrlLoadingText), controlNull];

_ctrlEditToken ctrlShow false;
_ctrlEditLabel ctrlShow false;
_ctrlButtonOk ctrlShow false;
_ctrlButtonCancel ctrlShow false;
_ctrlSubtext ctrlShow false;
_ctrlLoadingText ctrlShow true;
_ctrlLoadingText ctrlSetStructuredText parseText format["<t font='RobotoCondensedBold'>%1</t>", CSTRING(Verifying)];

private _response = "a4es_common" callExtension ["connectIDToken", [A4ES_C_G, ctrlText _ctrlEditToken, profileNameSteam]];
_response params ["_result", "_code"];

// Exit if dialog closed
if (isNull (uiNamespace getVariable [QGVAR(RscDisplayA4ESServerToken), displayNull])) exitWith {};

// Success
if (_code == 1) exitWith {
    private _resultArray = parseSimpleArray _result;

    _ctrlLoadingText ctrlSetStructuredText parseText format["<t font='RobotoCondensedBold'><t color='#1ad40d'>%1</t></t>", LLSTRING(VerificationCorrect)];

    profileNamespace setVariable [QGVAR(actkn), _resultArray deleteAt 3];
    saveProfileNamespace;

    // Update info spotlight
    if (uiNamespace getVariable [QGVAR(spotlightInfoError), false]) then {
        (findDisplay 0) call (uiNamespace getVariable QFUNC(updateInfoSpotlight));
    };

    (uiNamespace getVariable [QGVAR(RscDisplayA4ESServerToken), displayNull]) closeDisplay 1;
    connectToServer _resultArray;
};

_ctrlLoadingText ctrlShow false;
_ctrlEditToken ctrlShow true;
_ctrlEditLabel ctrlShow true;
_ctrlButtonOk ctrlShow true;
_ctrlButtonCancel ctrlShow true;
_ctrlSubtext ctrlShow true;

// Error
if (_code == 2) exitWith {
    _ctrlSubtext ctrlSetStructuredText parseText format["<t font='RobotoCondensedBold'><t color='#e01709'>%1</t>", LLSTRING(VerificationFail)];
    profileNamespace setVariable [QGVAR(actkn), ""];
    saveProfileNamespace;
};

// Only cadre is allowed to enter
if (_code == 3) exitWith {
    _ctrlSubtext ctrlSetStructuredText parseText format["<t font='RobotoCondensedBold'><t color='#e01709'>%1</t>", LLSTRING(ServerLockedCadre)];
};

// Only selected users are allowed to enter
if (_code == 4) exitWith {
    _ctrlSubtext ctrlSetStructuredText parseText format["<t font='RobotoCondensedBold'><t color='#e01709'>%1</t>", LLSTRING(ServerLockedGroup)];
};

// Unknown code
_ctrlSubtext ctrlSetStructuredText parseText format["<t font='RobotoCondensedBold'><t color='#e01709'>%1</t>", LLSTRING(ServerResponseError)];