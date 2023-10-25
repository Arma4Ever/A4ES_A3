#include "script_component.hpp"
/*
 * Author: Krzyciu, SzwedzikPL
 * suppliesStorage module local exec function
 */

params ["_logic", "_target", "_condition"];
TRACE_3("suppliesStorage_moduleExecLocal",_logic,_targets,_condition);

if (!hasInterface || {isNull _logic}) exitWith {
  TRACE_1("suppliesStorage_moduleExecLocal abort: no interface or logic null",_logic);
};

private _validTargets = _target select {!(isNull _x)};
if (_validTargets isEqualTo []) exitWith {
  TRACE_1("suppliesStorage_moduleExecLocal abort: no valid target",_target);
};

TRACE_6("suppliesStorage_moduleExecLocal - adding action");

private _insertChildren = { 
  params ["_target", "_player", "_params"];  

  private _actions = [];
  private _side = side _player;   
  private _objects = missionNamespace getVariable [format [QGVAR(supplies_%1), _side], []];
  {  
    private _childStatement = {
      // Everytime you do this, hamster dies:
      _this#2 params ["_objectName", "_class", "_objectCount", "_pos", "_items", "_objectPostInit"];
      private _side = side _player; 
      [QGVAR(spawnSupply), [_objectName, _class, _objectCount, _pos, _items, _objectPostInit, _side]] call CBA_fnc_serverEvent; 
    }; 
  
    private _childCondition = { 
      _this#2 params ["", "", "_objectCount"]; 
      _objectCount>0;
    }; 
  
    private _action = [ 
      format ["storage:%1",(_x select 0)], 
      format ["%1 - %2 %3",(_x select 0), LLSTRING(suppliesStorage_Action_Left), (_x select 2)], 
      "", 
      _childStatement, 
      _childCondition, 
      {}, 
      _x 
    ] call ACEFUNC(interact_menu,createAction);
  
    _actions pushBack [_action, [], _target];  
  } forEach _objects; 
 
  _actions 
}; 


private _baseAction = [
  QGVAR(suppliesStorage), 
  LLSTRING(suppliesStorage_Action_Title),
  "",
  {true},
  {true},
  _insertChildren
] call ACEFUNC(interact_menu,createAction); 

{
	[_x, 0, ["ACE_MainActions"], _baseAction] call ACEFUNC(interact_menu,addActionToObject); 
} forEach _validTargets;
