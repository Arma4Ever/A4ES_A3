#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Spawns saved 3DEN comp objects
 */

LOG("spawn3DENCompObjects");

private _lastUpdate = -1;

// Count objects from all entries
private _count = 0;
{
  _count = _count + (count (_x # 0));
} forEach GVAR(3DENCompObjects);

// Log starting obj spawn
["a4esserver_events_srcSimObjSpawnS", _count] call CBA_fnc_serverEvent;

private _counter = 0;
private _localObjectsData = [];

{
  _x params ["_data", "_initScript", "_spawnAsSuperSimple", "_spawnLocally"];

  private _localObjects = [];

  {
    _x params ["_class", "_model", "", "_posWorld", "", "_vectors"];
    private _object = objNull;
    if (_spawnAsSuperSimple) then {
      _object = createSimpleObject [_model, _posWorld, _spawnLocally];
      _object setVectorDirAndUp _vectors;
    } else {
      _object = createSimpleObject [_class, _posWorld, _spawnLocally];
      _object setPosWorld _posWorld;
      _object setVectorDirAndUp _vectors;
    };

    _object call _initScript;
    _counter = _counter + 1;

    if (_spawnLocally) then {
      // Prep optimized local objects data
      _localObjects pushBack [
        [_class, _model] select _spawnAsSuperSimple,
        _posWorld,
        _vectors
      ];
    };

    // Update global info for intro
    if ((CBA_missionTime - _lastUpdate) > 0.98) then {
      missionNamespace setVariable [QGVAR(3DENCompObjectsSpawn), [true, _counter, _count, false], true];
      _lastUpdate = CBA_missionTime;
    };

    // 2 objects per frame if creating objects globally
    if (!_spawnLocally && {(_counter mod 2) isEqualTo 0}) then {
      sleep 0.001;
    };
  } forEach _data;

  if (_localObjects isNotEqualTo []) then {
    _localObjectsData pushBack [_localObjects, _initScript];
  };
} forEach GVAR(3DENCompObjects);

// Send JIP event to spawn simple local objects
if (_localObjectsData isNotEqualTo []) then {
  [QGVAR(spawnSimpleObjects), _localObjectsData] call CBA_fnc_globalEventJIP;
  sleep 5;
};

// Save global info for intro
missionNamespace setVariable [QGVAR(3DENCompObjectsSpawn), [true, _count, _count, true], true];

// Release memory
GVAR(3DENCompObjects) = nil;

// Send log
["a4esserver_events_srcSimObjSpawnE", _counter] call CBA_fnc_serverEvent;
