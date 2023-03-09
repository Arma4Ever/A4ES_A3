#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Validator for objects3DENComp module
 */

params ["_module", "_values"];

private _warnings = [];

private _dataSaved = (_module get3DENAttribute QGVAR(dataSaved)) # 0;
private _spawnLocally = (_module get3DENAttribute QGVAR(spawnLocally)) # 0;
private _mode = _values getVariable [QGVAR(mode), 0];

if (_spawnLocally && {("a4es_editor" callExtension "test") != "true"}) then {
  _warnings pushBack [
    LLSTRING(Warning_ModuleHasNoEffect),
    LLSTRING(objects3DENComp_Warning_NoExtension_Desc)
  ];
};

if (_mode isEqualTo 0) then {
  _warnings pushBack [
    LLSTRING(objects3DENComp_Warning_EditMode),
    LLSTRING(objects3DENComp_Warning_EditMode_Desc),
    QGVAR(mode)
  ];

  private _validEntityIndex = (get3DENConnections _module) findIf {
    _x params ["_type", "_entity"];
    (_type isEqualTo "Sync" && {
      (_entity isKindOf "CAManBase") || {_entity isKindOf "AllVehicles"}
    })
  };
  if (_validEntityIndex isEqualTo -1) then {
    _warnings pushBack [
      LLSTRING(Warning_ModuleHasNoEffect),
      LLSTRING(objects3DENComp_Warning_NoObjects_Desc)
    ];
  };
};

if ((_mode isEqualTo 1) && _dataSaved) then {
  private _data = (_module get3DENAttribute QGVAR(data)) # 0;

  if (_data isEqualTo "" || {_data isEqualTo "[[],[]]"}) then {
    _warnings pushBack [
      LLSTRING(Warning_ModuleHasNoEffect),
      LLSTRING(objects3DENComp_Warning_NoSavedObjects_Desc)
    ];
  };
};

_warnings
