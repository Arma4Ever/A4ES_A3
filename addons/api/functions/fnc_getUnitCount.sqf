/*
 * Author: SzwedzikPL
 * Return count of alive units which were spawned by given module. Part of A3CS public API
 */
#include "script_component.hpp"

params [["_logic", objNull, [objNull]]];

if (isNull _logic) exitWith {-1};

private _return = -1;

if (_logic getVariable [QEGVAR(mm,genSoldiers_respawned), false]) then {
    _return = _logic getVariable [QEGVAR(mm,genSoldiers_aliveUnitsCount), 0];
};

_return
