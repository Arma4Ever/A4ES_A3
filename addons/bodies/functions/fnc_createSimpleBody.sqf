#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Creates simple body
 */
params ["_pos", "_dir", "_uniform", "_face", "_name", "_bodyPos", "_gear"];
TRACE_6("createSimpleBody",_pos,_dir,_uniform,_face,_name,_bodyPos);

if (
  (_pos isEqualTo []) ||
  (GVAR(bodyAnims) isEqualTo [])
) exitWith {};

private _agent = createAgent ["C_man_1", [0,0,0], [], 0, "CAN_COLLIDE"];
removeFromRemainsCollector [_agent];

// Restore uniform and loadout
_agent forceAddUniform _uniform;
{_agent unlinkItem _x} forEach (assignedItems _agent);

// Remove elements that can have external models (optimize polygons count)
_agent unlinkItem (hmd _agent);
removeGoggles _agent;
removeHeadgear _agent;

// Move all loadout to inventory container (next frame)
[_agent, _gear] spawn FUNC(restoreGear);

// Restore face and name
[_agent, _face] remoteExec ["setFace", 0, _agent];
[_agent, _name] remoteExec ["setName", 0, _agent];

// Dead anim
private _animData = selectRandom (GVAR(bodyAnims) select _bodyPos);
_animData params ["_anim", "_dirFnc", "_posFnc"];

[_agent, _anim] remoteExecCall ["switchMove", 0, false];
_agent setDir (_dir call _dirFnc);
_pos = [_pos, _dir] call _posFnc;

_agent setVariable [QGVAR(anim), _anim];
_agent setVariable [QGVAR(isSimpleBody), true, true];

// Fix for resetting animation from explosions
_agent addEventHandler ["HandleDamage", {
	params ["_unit"];
  _unit call FUNC(resetSimpleBodyAnim);
  [{_this call FUNC(resetSimpleBodyAnim)}, _unit] call CBA_fnc_execNextFrame;
}];

// Update pos and simulation
[{
  (_this # 0) setDamage 1;

  [{
  	[{
  		params ["_agent", "_pos"];
  		_agent setPos _pos;
      // Remove simple body from curator objects
      {_x removeCuratorEditableObjects [[_agent], true]} forEach allCurators;
      removeFromRemainsCollector [_agent];

      [{
        _this enableSimulationGlobal false;
      }, _agent] call CBA_fnc_execNextFrame;
  	}, _this] call CBA_fnc_execNextFrame;
  }, _this] call CBA_fnc_execNextFrame;
}, [_agent, _pos]] call CBA_fnc_execNextFrame;

// Save body in list, remove oldest one if limit is reached
private _index = GVAR(simpleBodies) pushBack _agent;
if (_index >= GVAR(simpleBodiesLimit)) then {
  private _body = GVAR(simpleBodies) deleteAt 0;
  deleteVehicle _body;
};
