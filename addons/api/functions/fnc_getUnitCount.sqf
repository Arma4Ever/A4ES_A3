/*
 * Author: SzwedzikPL
 * Return count of alive units which were spawned on given trigger. Part of A3CS public API
 */
#include "script_component.hpp"

params [["_place", objNull, [objNull]]];

if(isNull _place || {!(_place isKindOf "EmptyDetector")}) exitWith {-1};

private _return = -1;

if(_place getVariable [QEGVAR(mm,genSoldiers_respawned), false]) then {
    _return = _place getVariable [QEGVAR(mm,genSoldiers_aliveUnitsCount), 0];
};

_return
