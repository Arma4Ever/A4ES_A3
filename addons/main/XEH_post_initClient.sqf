#include "script_component.hpp"

if(!hasInterface) exitWith {};

if(isMultiplayer) then {
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
};
