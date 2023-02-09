#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Join dialog button handler
 */

params ["_ctrlButtonOk", ["_token", ""]];

private _ctrlEditToken = _ctrlButtonOk getVariable [QGVAR(ctrlEditToken), controlNull];
private _ctrlEditLabel = _ctrlButtonOk getVariable [QGVAR(ctrlEditLabel), controlNull];
private _ctrlSubtext = _ctrlButtonOk getVariable [QGVAR(ctrlSubtext), controlNull];
private _ctrlButtonCancel = _ctrlButtonOk getVariable [QGVAR(ctrlButtonCancel), controlNull];
private _ctrlLoadingText = _ctrlButtonOk getVariable [QGVAR(ctrlLoadingText), controlNull];

private _method = "connectAccessToken";

// If no access token, user has typed ID token
if (_token == "") then {
	_method = "connectIDToken";
	_token = ctrlText _ctrlEditToken;
};

_ctrlEditToken ctrlShow false;
_ctrlEditLabel ctrlShow false;
_ctrlButtonOk ctrlShow false;
_ctrlButtonCancel ctrlShow false;
_ctrlSubtext ctrlShow false;
_ctrlLoadingText ctrlShow true;
_ctrlLoadingText ctrlSetStructuredText parseText "<t font='RobotoCondensedBold'>Weryfikacja...</t>";

//sleep 0.1;

private _response = "a4es_common" callExtension [_method, [A4ES_C_G, _token, profileNameSteam]];
_response params ["_result", "_code"];

// Success
if (_code == 1) exitWith {
	private _resultArray = parseSimpleArray _result;

	_ctrlLoadingText ctrlSetStructuredText parseText "<t font='RobotoCondensedBold'><t color='#1ad40d'>Weryfikacja poprawna.</t></t>";

	//sleep 0.5;

	if (_method == "connectIDToken") then {
		private _token = _resultArray deleteAt 3;
		profileNamespace setVariable [QGVAR(actkn), _token];
		saveProfileNamespace;
	};

	(_ctrlButtonOk getVariable [QGVAR(display), displayNull]) closeDisplay 1;
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
	_ctrlSubtext ctrlSetStructuredText parseText "<t font='RobotoCondensedBold'><t color='#e01709'>Weryfikacja nie powiodła się.</t><br />Wygeneruj <a href='https://forum.arma4ever.pl/playercp#/server'>na forum</a> nowy token i spróbuj ponownie.</t>";
	profileNamespace setVariable [QGVAR(actkn), ""];
	saveProfileNamespace;
};

// Only cadre is allowed to enter
if (_code == 3) exitWith {
	_ctrlSubtext ctrlSetStructuredText parseText "<t font='RobotoCondensedBold'><t color='#e01709'>Serwer jest tymczasowo dostępny tylko dla członków kadry.</t><br />Po więcej informacji zgłoś się do dowolnego członka kadry.</t>";
};

// Only selected users are allowed to enter
if (_code == 4) exitWith {
	_ctrlSubtext ctrlSetStructuredText parseText "<t font='RobotoCondensedBold'><t color='#e01709'>Serwer jest tymczasowo dostępny tylko dla wybranej grupy osób.</t><br />Po więcej informacji zgłoś się do dowolnego członka kadry.</t>";
};

// Unknown code
_ctrlSubtext ctrlSetStructuredText parseText "<t font='RobotoCondensedBold'><t color='#e01709'>Błąd odpowiedzi z serwera.</t><br />Spróbuj ponownie, jeśli po kilku próbach wciąż widzisz ten komunikat, wygeneruj na forum nowy token i spróbuj ponownie.</t>";