#include "script_component.hpp"
/* ----------------------------------------------------------------------------
Function: CBA_fnc_compileFunction
Description:
    Compiles a function into mission namespace and into ui namespace for caching purposes.
    Recompiling can be enabled by inserting the CBA_cache_disable.pbo from the optionals folder.
Parameters:
    0: _funcFile - Path to function sqf file <STRING>
    1: _funcName - Final function name <STRING>
Returns:
    None
Examples:
    (begin example)
        [_funcFile, _funcName] call CBA_fnc_compileFunction;
    (end)
Author:
    commy2, edit by SzwedzikPL
---------------------------------------------------------------------------- */

params [["_funcFile", "", [""]], ["_funcName", "", [""]]];

if (isNil QGVAR(functionsOverridesCache)) then {
  // Create cache of functions overrides
  private _functions = createHashMapFromArray (
    (configProperties [configFile >> "a4es_functions_overrides", "true", true]) apply {[configName _x, getText _x]}
  );
  // Save cache so we can compile functions next
  GVAR(functionsOverridesCache) = _functions;

  // Compile all overriden functions
  {
    diag_log text format ["A4ES Override function compile: %1 - %2", _x, _y];
    [_y, _x] call CBA_fnc_compileFunction;
  } forEach _functions;
};

// Exit if function already exists
// Prevents "Attempt to override final function..." rpt spam
if !(isNil {missionNamespace getVariable _funcName}) exitWith {};

private _cachedFunc = uiNamespace getVariable _funcName;

if (isNil "_cachedFunc") then {
  _funcFile = GVAR(functionsOverridesCache) getOrDefault [_funcName, _funcFile];
  uiNamespace setVariable [_funcName, compileScript [_funcFile, true]];
  missionNamespace setVariable [_funcName, uiNamespace getVariable _funcName];
} else {
  if (["compile"] call CBA_fnc_isRecompileEnabled) then {
    _funcFile = GVAR(functionsOverridesCache) getOrDefault [_funcName, _funcFile];
    missionNamespace setVariable [_funcName, compileFinal preprocessFileLineNumbers _funcFile];
  } else {
    missionNamespace setVariable [_funcName, _cachedFunc];
  };
};