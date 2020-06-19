#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

ADDON = true;

if (isNil QGVAR(isEditorPreview)) then {
  GVAR(isEditorPreview) = false;
};

if !(is3DEN) exitWith {};

// Check for incompatible 3DEN mods
private _incompatibleMods = [];
if (isClass (configFile >> "CfgPatches" >> "3denEnhanced")) then {
  _incompatibleMods pushBack "3DEN Enhanced";
};

// Show info and force 3DEN close if there are incompatible mods
if !(_incompatibleMods isEqualTo []) then {
  private _modsNames = "";
  {
    _modsNames = _modsNames + format [
      "%1%2",
      [", ", ""] select (_modsNames isEqualTo ""),
      _x
    ];
  } forEach _incompatibleMods;

  _modsNames spawn {
    params ["_modsNames"];
    private _display = [
      format [
        localize LSTRING(IncompatibleModsDetected_Message),
        _modsNames
      ],
      localize LSTRING(IncompatibleModsDetected_Title),
      false,
      'OK'
    ] call BIS_fnc_3DENShowMessage;
    waitUntil {isNull _display};
    while {true} do {
      do3DENAction "Exit3DEN";
      sleep 0.001;
    };
  };
};

// Setup mission attributes
call FUNC(setupMissionAttributes);

// Add units init EH for setup of dynamic simulation
["CAManBase", "init", {
  _this spawn {
    sleep 0.001;
    _this call FUNC(updateDynamicSimulation);
  };
}, true, [], true] call CBA_fnc_addClassEventHandler;
