#include "script_component.hpp"

if (isServer) then {

  // End talk if player is disconnected
  addMissionEventHandler ["HandleDisconnect", {
  	params ["_player"];

    private _unit = _player getVariable [QGVAR(talkingWith), objNull];
    if !(isNull _unit) then {
      [_unit, _player] call FUNC(endTalk);
    };

  	false
  }];
};
