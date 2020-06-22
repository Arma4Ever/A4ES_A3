#include "\x\cba\addons\xeh\script_component.hpp"
/*
 * Author: commy2, modified by SzwedzikPL
 * Modified version of CBA_fnc_startFallbackLoop for 3DEN purpose
 */

if !(GVAR(fallbackRunning)) exitWith {};

GVAR(entities) = [];

0 spawn {
  SCRIPT(fallbackLoopPFEH);
  while {true} do {
    private _entities = entities [["CAManBase"], [], true, false];

    if !(_entities isEqualTo GVAR(entities)) then {
        private _newEntities = _entities - GVAR(entities);
        GVAR(entities) = _entities;
        {
            if !(ISPROCESSED(_x)) then {
                _x call CBA_fnc_initEvents;

                if !(ISINITIALIZED(_x)) then {
                    _x call CBA_fnc_init;
                };
            };
        } forEach _newEntities;
    };
    sleep 1;
  };
};
