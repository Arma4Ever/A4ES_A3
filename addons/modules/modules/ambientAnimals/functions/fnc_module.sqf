#include "script_component.hpp"
#define EXEC_MODULE_NAME GVAR(ambientFlyby)
/*
 * Author: Krzyciu, SzwedzikPL
 * Ambient animals module
 */

params ["_mode", "_input"];

// Exit if module executed inside editor, not on server or not in init mode
if (is3DEN || !(isServer) || !(_mode isEqualTo "init")) exitWith {};
_input params [
  ["_logic", objNull, [objNull]],
  ["_isActivated", false, [true]],
  ["_isCuratorPlaced", false, [true]]
];
// Exit if module is null, not local or placed by zeus (should not happen)
if (isNull _logic || !(local _logic) || _isCuratorPlaced) exitWith {};

  if (CBA_missionTime < 30) then {
    sleep 15;
  };

LOG_1('Starting execution of EXEC_MODULE_NAME (isActivated: %1).',str _isActivated);


if (_isActivated) then {
    private _mode = _logic getVariable [QGVAR(mode), 0];
    private _animalsClassesData = [];
    private _animalsCount = 0;
    private _randomWeighted = false;
    private _classListMode = _logic getVariable [QGVAR(classListMode), 0];
    private _classList = call compile (_logic getVariable [QGVAR(classList), "[]"]);

    if (!(_classList isEqualType []) || (count _classList) isEqualTo 0) exitWith {
      WARNING_2('EXEC_MODULE_NAME - classList is not array or array is empty (classList: %1).',str _classList);
    };

    // Calculate group units classes
    if (_classListMode isEqualTo 0) then {
      // Random classList mode
      _randomWeighted = true;
      _animalsCount = (_logic getVariable [QGVAR(animalsCount), 0]) max 1;
      {_animalsClassesData append _x;} forEach _classList;
    } else {
      // Strict classList mode
      {
        private _className = _x #0;
        private _count = (_x #1) max 1;

        for "_i" from 1 to _count do {
          _animalsClassesData pushBack _className;
        };
      } forEach _classList;
      _animalsCount = count _animalsClassesData;
    };

    if ((_animalsCount isEqualTo 0) || (_animalsClassesData isEqualTo [])) exitWith {
      ERROR_2('Execution of EXEC_MODULE_NAME aborted - no units or classes data (unitCount: %1 unitClassesData: %2).',str _animalsCount,str _animalsClassesData);
    };

    // Generate animals
    for "_animalIndex" from 0 to _animalIndex do {
      private _animalClass = if (_randomWeighted) then {
        // Get random class from classlist
        selectRandomWeighted _animalsClassesData
      } else {
        _animalsClassesData select _animalIndex
      };

      LOG_3('Generating animals #%1 (animalClass: "%2").',str _animalIndex,_animalClass);

      private _spawnPos = _logicArea call EFUNC(common,getAreaRandomPos);
      private _animal = createAgent [_animalClass,_spawnPos,[],0,"NONE"];
      _animal setDir (random 360);
    };
};

LOG('Execution of EXEC_MODULE_NAME finished.');
