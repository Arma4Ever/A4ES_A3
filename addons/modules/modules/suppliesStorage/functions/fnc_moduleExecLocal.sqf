#include "script_component.hpp"
/*
 * Author: Krzyciu, SzwedzikPL
 * suppliesStorage module local exec function
 */

params ["_target", "_storageID"];

if (!hasInterface) exitWith {
  TRACE_1("suppliesStorage_moduleExecLocal abort: no interface",_target);
};

private _validTargets = _target select {!(isNull _x)};
if (_validTargets isEqualTo []) exitWith {
  TRACE_1("suppliesStorage_moduleExecLocal abort: no valid target",_target);
};

LOG("suppliesStorage_moduleExecLocal - adding action");

// Child interactions - generated per each object
private _insertChildren = { 
  params ["_target", "_player", "_storageID"];
  private _actions = [];
  private _side = side _player;
  private _objects = missionNamespace getVariable [format [QGVAR(storage_%1_%2), _storageID, _side],[]];

  {  
    private _childStatement = {
      params ["", "_player", "_args"];
      _args#0 params ["_objectName", "_class", "_objectCount", "_pos", "_items", "_objectPostInit"];
      _args#1 params ["_storageID"];

      private _side = side _player; 
      [QGVAR(spawnSupply), [_objectName, _class, _objectCount, _pos, _items, _objectPostInit, _side, _storageID]] call CBA_fnc_serverEvent; 
    }; 
  
    private _childCondition = {
      params ["", "", "_args"];
      _args#0 params ["", "", "_objectCount"];
      _objectCount>0;
    }; 
  
    private _action = [ 
      format ["storage_%1",(_x #0)], 
      format ["%1 - %2 %3",(_x #0), LLSTRING(suppliesStorage_Action_Left),(_x #2)], 
      "", 
      _childStatement, 
      _childCondition, 
      {}, 
      [_x, _storageID] 
    ] call ACEFUNC(interact_menu,createAction);
  
    _actions pushBack [_action, [], _target];  
  } forEach _objects; 
 
  _actions 
}; 

// Base interaction
private _baseAction = [
  format ["storage_%1",(_this#2)], 
  LLSTRING(suppliesStorage_Action_Title),
  "",
  {true},
  {true},
  _insertChildren,
  _storageID
] call ACEFUNC(interact_menu,createAction); 

{
	[_x, 0, ["ACE_MainActions"], _baseAction] call ACEFUNC(interact_menu,addActionToObject); 
} forEach _validTargets;