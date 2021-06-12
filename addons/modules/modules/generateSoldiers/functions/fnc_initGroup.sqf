#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Inits generated group according to generateSoldiers module params
 */

params ["_group", "_groupPos", "_logic", "_boundaryArea"];

LOG_3('Starting init of %1 group (unitCount: %2 boundaryArea: %3).',str (groupId _group),str (count (units _group)),str _boundaryArea);

private _applyLoadout = (_logic getVariable [QGVAR(source), 0]) isEqualTo 1;
private ["_composition", "_unitInit"];

// Get unit skill
private _unitSkill = (_logic getVariable [QGVAR(skill), 0.5]) max 0.01;

// Get LAMBS vars
private _disableLambsAI = _logic getVariable [QGVAR(disableLambsAI), false];
private _enableLambsReinforce = _logic getVariable [QGVAR(enableLambsReinforce), true];
private _hasLambsRadio = _logic getVariable [QGVAR(hasLambsRadio), true];

// Prep unit init
private _execUnitInit = _logic getVariable [QGVAR(addUnitPostInit), false];
if (_execUnitInit) then {
  _unitInit = compile (_logic getVariable [QGVAR(unitPostInit), ""]);
};

// Get composition data
if (_applyLoadout) then {
  _composition = missionNamespace getVariable [
    format [
      QGVAR(generatorComposition_id_%1),
      _logic getVariable [QGVAR(composition), ""]
    ],
    []
  ];
};

if (_enableLambsReinforce) then {
  _group setVariable ["lambs_danger_enableGroupReinforce", true, true];
};

// Setup units & exec init
{
  _x setSkill _unitSkill;

  // Apply unit loadout from composition
  if (_applyLoadout) then {
    LOG_2('Applying loadout for %1 group unit #%2.',str (groupId _group),str _forEachIndex);
    _x setUnitLoadout [(_composition # _forEachIndex) # 1, true];
  };

  // Apply lambs vars
  if (_disableLambsAI) then {
    _x setVariable ["lambs_danger_disableAI", true, true];
  };
  if (_hasLambsRadio) then {
    _x setVariable ["lambs_danger_dangerRadio", true, true];
  };

  // Exec unit init
  if (_execUnitInit) then {
    LOG_2('Executing unitPostInit handler for %1 group unit #%2.',str (groupId _group),str _forEachIndex);
    _x call _unitInit;
  };

} forEach (units _group);

// Exec group init
if (_logic getVariable [QGVAR(addGroupPostInit), false]) then {
  LOG_1('Executing groupPostInit handler for %1 group.',str (groupId _group));
  _group call (compile (_logic getVariable [QGVAR(groupPostInit), ""]));
};

// Exec selected behaviour script
private _behaviour = _logic getVariable [QGVAR(behaviour), 0];

LOG_2('Init of %1 group finished. Selecting behaviour script (behaviourId: %2).',str (groupId _group),str _behaviour);

// Patrol
if (_behaviour isEqualto 0) exitWith {
  LOG_1('Executing patrol behaviour for %1 group',str (groupId _group));

  [
    _group,
    _groupPos,
    (_logic getVariable [QGVAR(patrolRange), 200]) max 100,
    (_logic getVariable [QGVAR(patrolWaypointsCount), 4]) max 1,
    _boundaryArea,
    _logic getVariable [QGVAR(patrolDynamicPattern), false]
  ] call lambs_wp_fnc_taskPatrol;
};

// Camp
if (_behaviour isEqualto 1) exitWith {
  LOG_1('Executing camp behaviour for %1 group.',str (groupId _group));

  [
    _group,
    _groupPos,
    (_logic getVariable [QGVAR(campRange), 50]) max 20,
    _boundaryArea,
    _logic getVariable [QGVAR(campTeleportUnits), false]
  ] call lambs_wp_fnc_taskCamp;
};

// Garrison
if (_behaviour isEqualto 2) exitWith {
  LOG_1('Executing garrison behaviour for %1 group.',str (groupId _group));

  private _exitCondition = [
    3, // None
    -2, // Random
    2, // FiredNear
    1, // Fired
    0, // Hit
    -1 // All
  ] select (((_logic getVariable [QGVAR(garrisonExitTrigger), 0]) max 0) min 5);

  [
    _group,
    _groupPos,
    (_logic getVariable [QGVAR(garrisonRange), 50]) max 20,
    _boundaryArea,
    _logic getVariable [QGVAR(garrisonTeleportUnits), false],
    _logic getVariable [QGVAR(garrisonSortPosByHeight), false],
    _exitCondition
  ] call lambs_wp_fnc_taskGarrison;
};

// Get Hunt/Creep/Rush common params
private _hcrRange = (_logic getVariable [QGVAR(hcrRange), 500]) max 200;
private _hcrTargetOnlyPlayers = _logic getVariable [QGVAR(hcrTargetOnlyPlayers), false];

// Remove groupPos if leader should be treated as group center pos
if (_logic getVariable [QGVAR(hcrLeaderAsCenter), false]) then {
  _groupPos = [];
};

// Hunt
if (_behaviour isEqualto 3) exitWith {
  LOG_1('Executing hunt behaviour for %1 group.',str (groupId _group));

  [
    _group,
    _hcrRange,
    (_logic getVariable [QGVAR(huntScriptInterval), 70]) max 10,
    _boundaryArea,
    _groupPos,
    _hcrTargetOnlyPlayers
  ] spawn lambs_wp_fnc_taskHunt;
};

// Creep
if (_behaviour isEqualto 4) exitWith {
  LOG_1('Executing creep behaviour for %1 group.',str (groupId _group));

  [
    _group,
    _hcrRange,
    (_logic getVariable [QGVAR(creepScriptInterval), 10]) max 5,
    _boundaryArea,
    _groupPos,
    _hcrTargetOnlyPlayers
  ] spawn lambs_wp_fnc_taskCreep;
};

// Rush
if (_behaviour isEqualto 5) exitWith {
  LOG_1('Executing rush behaviour for %1 group.',str (groupId _group));

  [
    _group,
    _hcrRange,
    (_logic getVariable [QGVAR(rushScriptInterval), 15]) max 10,
    _boundaryArea,
    _groupPos,
    _hcrTargetOnlyPlayers
  ] spawn lambs_wp_fnc_taskHunt;
};

private _movePos = getMarkerPos (_logic getVariable [QGVAR(maMovePosition), ""]);
private _moveDistanceTreshold = (_logic getVariable [QGVAR(maDistanceThreshold), 50]) max 20;

// Move
if (_behaviour isEqualto 6) exitWith {
  LOG_1('Executing move behaviour for %1 group.',str (groupId _group));

  [_group, _movePos, _moveDistanceTreshold] spawn {
    params ["_group", "_movePos", "_moveDistanceTreshold"];
    sleep 2;
    private _wp = _group addWaypoint [_movePos, 10];
    _wp setWaypointType "MOVE";
    _wp setWaypointSpeed "FULL";
    _wp setWaypointCombatMode "RED";
    _wp setWaypointBehaviour "AWARE";
    _wp setWaypointCompletionRadius _moveDistanceTreshold;
    _wp setWaypointPosition [_movePos, 10];
    _group setCurrentWaypoint _wp;
  };
};

// Assault
if (_behaviour isEqualto 7) exitWith {
  LOG_1('Executing assault behaviour for %1 group.',str (groupId _group));

  [
    _group,
    _movePos,
    _logic getVariable [QGVAR(assaultForcedRetreat), false],
    _moveDistanceTreshold,
    (_logic getVariable [QGVAR(assaultScriptInterval), 10]) max 5,
    false
  ] spawn lambs_wp_fnc_taskAssault;
};

// Log error if no behaviour script was selected
ERROR_2('Unsupported behaviour of %1 group (behaviourId: %2).',str (groupId _group),str _behaviour);
