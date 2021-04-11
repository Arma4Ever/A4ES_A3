#include "script_component.hpp"
#define EXEC_MODULE_NAME GVAR(switchLights)
/*
 * Author: SzwedzikPL
 * switchLights module function
 */

params ["_mode", "_input"];

// Exit if module executed inside editor, not on server or not in init mode
if (is3DEN || !(isServer) || (_mode isNotEqualTo "init")) exitWith {};
_input params [
  ["_logic", objNull, [objNull]],
  ["_isActivated", false, [true]],
  ["_isCuratorPlaced", false, [true]]
];
// Exit if module is null, not local, is deactivated or placed by zeus (should not happen)
if (isNull _logic || !(local _logic) || _isCuratorPlaced) exitWith {};

LOG_1('Starting execution of EXEC_MODULE_NAME (isActivated: %1).',str _isActivated);

// ---------------------------
// Get assigned lamps
private _lamps = _logic getVariable QGVAR(lamps);

// Collect lamps if not collected before
if (isNil "_lamps") then {
  // Get logic area
  private _logicArea = [getPos _logic];
  _logicArea append (_logic getvariable "objectArea");
  private _logicRange = (_logicArea # 1) max (_logicArea # 2);

  // Collect lamps and reflector hit indexes
  _lamps = [];
  {
    if (_x inArea _logicArea) then {
      // Get reflectors
      private _reflectors = configProperties [
        (configOf _x) >> "Reflectors",
        "isClass _x"
      ];
      // Collect hit indexes of reflectors
      if (_reflectors isNotEqualTo []) then {
        private _hitIndexes = [];
        private _hitPoints = (getAllHitPointsDamage _x) param [0, []];
        {
          private _selection = toLower _x;
          {
            if (_selection in (toLower _x)) then {
              _hitIndexes pushBack _forEachIndex;
            };
          } forEach _hitPoints;
        } forEach (_reflectors apply {getText (_x >> "hitpoint")});

        if (_hitIndexes isNotEqualTo []) then {
          _lamps pushBack [_x, _hitIndexes];
        };
      };
    };
  } forEach (nearestObjects [
    _logic,
    ["house"],
    _logicRange,
    true,
    false
  ]);

  // Sort lamps by pos if segments are enabled
  if (_logic getVariable [QGVAR(segments), false]) then {
    private _segmentDir = _logic getVariable [QGVAR(segmentDir), 0];
    private _startPos = _logic getPos [_logicRange, _segmentDir + 180];
    _lamps = [_lamps, [_startPos], {_input0 distance (_x # 0)}, "ASCEND"] call BIS_fnc_sortBy;
  };

  // Save collected lamps
  _logic setVariable [QGVAR(lamps), _lamps];
};

// Terminate current switch script if present
private _currentSwitchScript = _logic getVariable [QGVAR(switchScript), scriptNull];
terminate _currentSwitchScript;

// Switch lights
private _switchScript = [_logic, _isActivated] spawn FUNC(switchLights_switchLights);
// Save script handler
_logic setVariable [QGVAR(switchScript), _switchScript];

// ---------------------------

LOG('Execution of EXEC_MODULE_NAME finished.');

true
