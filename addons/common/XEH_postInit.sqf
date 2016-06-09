#include "script_component.hpp"

if (hasInterface && {isMultiplayer}) then {
    private _uid = getPlayerUID player;

    //Save UID
    if (!isNull player && _uid != "") then {
        profilenamespace setVariable ["player_uid", _uid];
        saveProfileNamespace;
    };

    //Block channels exept global & side
    //{_x enableChannel false} foreach [2,3,4,5]; - can't disable group chat
    [{if (currentChannel > 1) then {setCurrentChannel 0;};}, 0, []] call CBA_fnc_addPerFrameHandler;
};

if (isServer) then {
    [] call FUNC(resetScoreLoop);
};
