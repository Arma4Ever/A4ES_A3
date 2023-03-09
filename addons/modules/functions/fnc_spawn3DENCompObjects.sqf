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
["a4es_simpleObjectsCreating", _count] call CBA_fnc_serverEvent;

private _counter = 0;

{
  _x params ["_data", "_initScript", "_spawnAsSuperSimple"];

  {
    _x params ["_class", "_model", "", "_posWorld", "", "_vectors"];
    private _object = objNull;
    if (_spawnAsSuperSimple) then {
      _object = createSimpleObject [_model, _posWorld];
      _object setVectorDirAndUp _vectors;
    } else {
      _object = createSimpleObject [_class, _posWorld];
      _object setPosWorld _posWorld;
      _object setVectorDirAndUp _vectors;
    };

    _object call _initScript;
    _counter = _counter + 1;

    // Update global info for intro
    if ((CBA_missionTime - _lastUpdate) > 0.98) then {
      missionNamespace setVariable [QGVAR(3DENCompObjectsSpawn), [true, _counter, _count, false], true];
      _lastUpdate = CBA_missionTime;
    };

    // 2 objects per frame if creating objects globally
    if ((_counter mod 2) isEqualTo 0) then {
      sleep 0.001;
    };
  } forEach _data;
} forEach GVAR(3DENCompObjects);

// Save global info for intro
missionNamespace setVariable [QGVAR(3DENCompObjectsSpawn), [true, _count, _count, true], true];

// Release memory
GVAR(3DENCompObjects) = nil;

// Log finished creating objects
["a4es_simpleObjectsCreated", _counter] call CBA_fnc_localEvent;

