#include "script_component.hpp"

//don't show nametags in spectator or if RscDisplayMPInterrupt is open
if ((isNull ace_player) || {!alive ace_player} || {!isNull (findDisplay 49)}) exitWith {};

//don't show nametag if flexi/some dialog
if (dialog) exitWith {};

//don't show nametag in vehicle
if (vehicle ace_player != ace_player) exitWith {};

//cursortarget nametag
if(!freeLook && (GVAR(enableCursorNametag) || {GVAR(enable3dNametag) == 2})) then {
    private ["_target", "_distance"];
    _target = cursorTarget;
    if ((!isNull _target) &&
        (alive _target) &&
        {_target isKindOf "CAManBase"} &&
        {(side (group _target)) == (side (group ace_player))} &&
        {_target != ace_player}
        //{GVAR(showNamesForAI) || {[_target] call ace_common_fnc_isPlayer}} &&
    ) then {
        _distance = ace_player distance _target;
        if(_distance <= 5) then {
            //draw 2d nametag
            if(GVAR(enableCursorNametag)) then {[_target] call FUNC(drawNametag);};
            //draw 3d nametag
            if(GVAR(enable3dNametag) == 2) then {[_target] call FUNC(drawNametag3d);};
        };
    };
};

//don't show 3D nametag if acemenu enabled
if(ace_interact_menu_openedMenuType >= 0) exitWith {};

//freelok nametag
if(freeLook && {GVAR(enable3dNametag) == 1}) then {
    private ["_pos", "_targets"];
    _pos = positionCameraToWorld [0, 0, 0];
    _targets = _pos nearObjects ["CAManBase", 10];
    {
        private ["_target", "_targetEyePosASL"];
        _target = _x;
        if (
            (alive _target) &&
            {(side (group _target)) == (side (group ace_player))} &&
            {_target != ace_player}
        ) then {
             // Check if there is line of sight
             _playerEyePosASL = eyePos ace_player;
             _targetEyePosASL = eyePos _target;
             _intersects = lineIntersectsSurfaces [_playerEyePosASL, _targetEyePosASL, ace_player, _target, true, 1, "VIEW", "NONE"];

            if ((count _intersects) == 0) then {
                [_target] call FUNC(drawNametag3d);
            };
        };
        nil
    } count _targets;
};
