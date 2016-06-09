#include "script_component.hpp"

[QGVAR(onPlayerConnected), "onPlayerConnected", {
    if (_jip) then {
        [time, {player setVariable [QGVAR(enterTime), _this, true];}] remoteExec ["bis_fnc_call", _owner, false];
    } else {
        [time, {player setVariable [QGVAR(enterTime), _this, true];}] remoteExec ["bis_fnc_call", _owner, false];
    };
}] call BIS_fnc_addStackedEventHandler;

//Server admin global info check
[{
    _serverAdmin = missionNamespace getVariable [QGVAR(serverAdmin), objNull];
    if (!(player isEqualTo _serverAdmin) && {[] call FUNC(isServerAdmin)}) then {
        missionNamespace setVariable [QGVAR(serverAdmin), player, true];
    };
}, 10, []] call CBA_fnc_addPerFrameHandler;
