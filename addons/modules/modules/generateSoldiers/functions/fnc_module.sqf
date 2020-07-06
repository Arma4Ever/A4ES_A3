#include "script_component.hpp"
#define EXEC_MODULE_NAME GVAR(generateSoldiers)
/*
 * Author: SzwedzikPL
 * generateSoldiers module function
 */

params ["_mode", "_input"];

// Exit if module executed inside editor, not on server or not in init mode
if (is3DEN || !(isServer) || !(_mode isEqualTo "init")) exitWith {};
_input params [
  ["_logic", objNull, [objNull]],
  ["_isActivated", false, [true]],
  ["_isCuratorPlaced", false, [true]]
];
// Exit if module is null, not local, is deactivated or placed by zeus (should not happen)
if (isNull _logic || !(local _logic) || !_isActivated || _isCuratorPlaced) exitWith {};

// Exit if module was executed before
if (_logic getVariable [QGVAR(executed), false]) exitWith {};

LOG('Starting execution of EXEC_MODULE_NAME.');

// Mark module as executed to prevent future executions
_logic setVariable [QGVAR(executed), true, true];

// Prep classed data vars
private _source = _logic getVariable [QGVAR(source), 0];
private _unitClassesData = [];
private _unitCount = 0;
private _randomWeighted = false;

// Calc unit classes data
if (_source isEqualTo 0) then {
    // Based on class list
    private _classListMode = _logic getVariable [QGVAR(classListMode), 0];
    private _classList = call compile (_logic getVariable [QGVAR(classList), "[]"]);

    // Exit if classList is not array or array is empty
    if (!(_classList isEqualType []) || (count _classList) isEqualTo 0) exitWith {
      WARNING_2('EXEC_MODULE_NAME - classList is not array or array is empty (classList: %1).',str _classList);
    };

    // Calculate group units classes
    if (_classListMode isEqualTo 0) then {
      // Random classList mode
      _randomWeighted = true;
      _unitCount = (_logic getVariable [QGVAR(unitCount), 0]) max 1;
      {_unitClassesData append _x;} forEach _classList;
    } else {
      // Strict classList mode
      {
        private _className = _x # 0;
        private _count = (_x # 1) max 1;

        for "_i" from 1 to _count do {
          _unitClassesData pushBack _className;
        };
      } forEach _classList;
      _unitCount = count _unitClassesData;
    };

} else {
  // Based on composition
  private _compositionId = _logic getVariable [QGVAR(composition), ""];
  if (_compositionId isEqualTo "") exitWith {};

  private _composition = missionNamespace getVariable [
    format [QGVAR(generatorComposition_id_%1), _compositionId],
    []
  ];
  // Exit if composition is empty
  if (_composition isEqualTo []) exitWith {
    WARNING_2('EXEC_MODULE_NAME - empty composition (compositionId: "%1" composition: %2).',_compositionId,str _composition);
  };

  // For now select only classes from composition
  // Loadout will be assigned in group init (where unit is local)
  _unitClassesData = _composition apply {_x # 0};
  _unitCount = count _unitClassesData;
};

// Exit if no classes data - some module configuration error or non existing composition
if ((_unitCount isEqualTo 0) || (_unitClassesData isEqualTo [])) exitWith {
  ERROR_2('Execution of EXEC_MODULE_NAME aborted - no units or classes data (unitCount: %1 unitClassesData: %2).',str _unitCount,str _unitClassesData);
};

// Get spawn params
private _side = [west, east, independent] select (_logic getVariable [QGVAR(side), 0]);
private _groupCount = (_logic getVariable [QGVAR(groupCount), 1]) max 1;
private _spawnPosMode = _logic getVariable [QGVAR(spawnPosMode), 0];
private _unitSkill = (_logic getVariable [QGVAR(skill), 0.5]) max 0.01;
private _enableDynSim = !(_logic getVariable [QGVAR(disableDynamicSim), false]);
private _transferToHeadless = !(_logic getVariable [QGVAR(disableHeadless), false]);
private _addToCurators = _logic getVariable [QGVAR(addToCurators), false];

// Get logic area
private _logicArea = [getPos _logic];
_logicArea append (_logic getVariable ["objectarea", []]);

// Calc behaviour boundary area
private _boundaryArea = switch (side player) do {
    case 0: {[]};
    case 1: {_logicArea};
    case 2: {
      private _syncedTriggers = (synchronizedObjects _logic) select {
        _x isKindOf "EmptyDetector"
      };
      if (_syncedTriggers isEqualTo []) then {
        []
      } else {
        private _trigger = _syncedTriggers # 0;
        private _triggerArea = [getPos _trigger];
        _triggerArea append (triggerArea _trigger);
        _triggerArea
      };
    };
    default {[]}
};

// Prep units init based on source & disableBISRandomization params
private _unitInit = if (
  (_logic getVariable [QGVAR(disableBISRandomization), false])
  // Randomization is disabled for compositions
  || (_source isEqualTo 1)
) then {"this setVariable [""BIS_enableRandomization"", false];"} else {""};

// Calc unit spawn range based on unit count
private _unitSpawnRange = _unitCount * 1.5;
private _unitMaxIndex = _unitCount - 1;


#ifdef DEBUG_MODE_FULL
private _logCompositionId = _logic getVariable [QGVAR(composition), ""];
LOG_4('Starting generating groups of EXEC_MODULE_NAME (groupCount: %1 unitCount: %2 source: %3 composition: "%4").',str _groupCount,str _unitCount,str _source,_logCompositionId);
#endif

// Generate groups
for "_i" from 1 to _groupCount do {
  private _group = createGroup [_side, true];
  // Exit if new group is null - means we reached game group limit in selected side
  if (isNull _group) exitWith {
    LOG('Generating groups for EXEC_MODULE_NAME aborted - createdGroup is null: probably side group limit is reached.');
  };

  // Set group ID
  #ifdef DEBUG_MODE_FULL
  private _groupId = format ["generateSoldiers #%1", _i - 1];
  _group setGroupId [_groupId];
  #endif

  LOG_1('Generating "%1" group.',_groupId);

  // Get group spawn position
  private _groupPos = if (_spawnPosMode isEqualTo 0) then {
    _logicArea call EFUNC(common,getAreaRandomPos);
  } else {
    getPos _logic
  };

  // Generate units
  for "_unitIndex" from 0 to _unitMaxIndex do {
    private _unitClass = if (_randomWeighted) then {
      // Get random class from classlist
      selectRandomWeighted _unitClassesData
    } else {
      _unitClassesData select _unitIndex
    };

    LOG_3('Generating unit #%1 in "%2" group (unitClass: "%3").',str _unitIndex,_groupId,_unitClass);

    _unitClass createUnit [
      _groupPos getPos [random _unitSpawnRange, random 360],
      _group,
      _unitInit,
      _unitSkill
    ];
  };

  // Dynamic simulation
  _group enableDynamicSimulation _enableDynSim;

  // Curators
  if (_addToCurators) then {
    private _units = units _group;
    {
      _x addCuratorEditableObjects [_units, true];
    } forEach allCurators;
  };

  //if (isMultiplayer && headless?) then {
    // transfer group to headless
    // on confirmation send initGroup remoteExec
  //} else {
  [_group, _groupPos, _logic, _boundaryArea] call FUNC(generateSoldiers_initGroup);
  //};

  // Wait a while to avoid sync problems
  sleep 0.5;
};

LOG('Generating groups of EXEC_MODULE_NAME finished.');

// Wait for group inits to execute and sync
sleep 5;

// Save info about units generated for api
_logic setVariable [QGVAR(unitsGenerated), true, true];

// Exec module postExec
if (_logic getVariable [QGVAR(addModulePostExec), false]) then {
  LOG('Executing EXEC_MODULE_NAME modulePostExec handler.');
  _logic call (compile (_logic getVariable [QGVAR(modulePostExec), ""]));
};

LOG('Execution of EXEC_MODULE_NAME finished.');

true
