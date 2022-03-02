#include "script_component.hpp"
/*
 * Author: Krzyciu, SzwedzikPL
 * ambientFlyby module exec function
 */

params ["_logic"];
TRACE_1("ambientAnimals_moduleExec",_logic);

/*
TODO: Refactor
*/

if (isNull _logic || {!isServer}) exitWith {};
if (is3DENPreview) then {
  [_logic, true] call EFUNC(debug,updateModuleStatus);
};

_logic spawn {
  params ["_logic"];
  
  LOG('Starting execution of EXEC_MODULE_NAME.');

  private _animalsType = _logic getVariable [QGVAR(animalsType), ""];
  private _animalsCount = _logic getVariable [QGVAR(animalsCount), 0];

  if ((_animalsType isEqualTo "") || {_animalsCount isEqualTo 0}) exitWith {
    WARNING_2('EXEC_MODULE_NAME - animal type is empty or animal count is 0 (animalsType: %1, animalsCount: %2).',str _animalsType,str _animalsCount);
  };

  private _animalsMaxIndex = _animalsCount - 1;
  private _logicArea = _logic call EFUNC(common,getLogicArea);

  private _animals = [];

  // Generate animals
  for "_animalIndex" from 0 to _animalsMaxIndex do {
      private _spawnPos = _logicArea call EFUNC(common,getAreaRandomPos);
      private _animal = createAgent [_animalsType, [0,0,0], [], 0, "NONE"];
      _animal setPos _spawnPos;
      _animal setDir (random 360);
      _animal enableDynamicSimulation true;
      _animals pushBack _animal;
      sleep 0.05;
  };

  if (_logic getVariable [QGVAR(addToCurators), false]) then {
    {
      _x addCuratorEditableObjects [_animals, true];
    } forEach allCurators;
  };

  // Delete module
  deleteVehicle _logic;

  LOG('Execution of EXEC_MODULE_NAME finished.');
};
