#include "script_component.hpp"

if(!hasInterface) exitWith {};

if(isMultiplayer) then {
    private ["_uid"];
    _uid = getPlayerUID player;

    //Save UID
    if((profilenamespace getVariable ["player_uid", "0"]) == "0") then {
        private ["_uid"];
        _uid = getPlayerUID player;
        profilenamespace setVariable ["player_uid", _uid];
        saveProfileNamespace;
    };

    //Block channels exept global & side
    [{
        if(currentChannel > 1) then {setCurrentChannel 0;};
    }, 0, []] call CBA_fnc_addPerFrameHandler;

    //3rd person debug
    if(_uid == "76561197998970466" || _uid == "76561198005080407") then {
        GVAR(lastInputPersonView) = 0;
        GVAR(enableForce3rd) = false;
        [{
            if(GVAR(lastInputPersonView) != inputAction "personView") then {
                if(GVAR(lastInputPersonView) == 1 && (inputAction "personView") == 0) then {
                    GVAR(enableForce3rd) = !GVAR(enableForce3rd);
                };
                GVAR(lastInputPersonView) = inputAction "personView";
            };
            if(GVAR(enableForce3rd) && (ace_player == player)) then {
                (vehicle player) switchCamera "External";
            };
        }, 0, []] call CBA_fnc_addPerFrameHandler;
    };
};
