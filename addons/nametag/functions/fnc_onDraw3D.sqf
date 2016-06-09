#include "script_component.hpp"

//don't show nametags in spectator or if RscDisplayInterrupt is open
if ((isNull ace_player) || {!alive ace_player} || {!isNull curatorCamera} || {GVAR(displayInterrupt)} || {EGVAR(admin,debugCameraEnabled)}) exitWith {};

//don't show nametag if flexi/some dialog
if (dialog) exitWith {};

//don't show nametag in vehicle
if (!isNull objectParent ace_player) exitWith {};

//don't show nametag if acemenu enabled
if (ace_interact_menu_openedMenuType >= 0) exitWith {};

//cursortarget nametag
if (!freeLook && {GVAR(enableCursorNametag) || GVAR(enable3dNametag) == 2}) then {
    private _target = cursorObject;
    if ((!isNull _target) && {_target isKindOf "CAManBase"} && {alive _target} && {(side group _target) isEqualTo (side group ace_player)} && {!(_target isEqualTo ace_player)}) then {
        private _distance = ace_player distance _target;
        if (_distance <= 5) then {
            //draw 2d nametag
            if (GVAR(enableCursorNametag)) then {_target call FUNC(drawNametag);};
            //draw 3d nametag
            if (GVAR(enable3dNametag) isEqualTo 2) then {_target call FUNC(drawNametag3d);};
        };
    };
};

//freelok nametag
if (freeLook && {GVAR(enable3dNametag) isEqualTo 1}) then {
    if (CBA_missionTime - GVAR(nametagObjectsCacheTime) > 2) then {
        GVAR(nametagObjectsCache) = (positionCameraToWorld [0, 0, 0]) nearEntities ["Man", 10];
        GVAR(nametagObjectsCacheTime) = CBA_missionTime;
    };
    {
        private _target = _x;
        if ((alive _target) && {(side group _target) isEqualTo (side group ace_player)} && {_target != ace_player}) then {
             // Check if there is line of sight
             private _playerEyePosASL = eyePos ace_player;
             private _targetEyePosASL = eyePos _target;
             private _intersects = lineIntersectsSurfaces [_playerEyePosASL, _targetEyePosASL, ace_player, _target, true, 1, "VIEW", "NONE"];

            if ((count _intersects) isEqualTo 0) then {
                _target call FUNC(drawNametag3d);
            };
        };
    } forEach GVAR(nametagObjectsCache);
};
