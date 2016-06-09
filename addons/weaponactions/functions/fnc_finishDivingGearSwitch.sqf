/*
 * Author: SzwedzikPL
 * End of diving gear switch action
 */
#include "script_component.hpp"

params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
_args params ["_gearType", "_gearClass", "_actionSuccessText", "_actionFailureText"];

private _items = [];

//Don't show anything if player can't interact:
if (!([ACE_player, objNull, []] call ace_common_fnc_canInteractWith)) exitWith {};

if (_errorCode == 0) then {
    if (_gearType == "uniform") then {
        _items = uniformItems ace_player;
        removeUniform ace_player;
        ace_player forceAddUniform _gearClass;
        if ((count uniformItems ace_player) > 0) then {
            {ace_player removeItemFromUniform _x;nil} count (uniformItems ace_player);
        };
        {ace_player addItemToUniform _x;nil} count _items;
    };
    if (_gearType == "vest") then {
        _items = vestItems ace_player;
        removeVest ace_player;
        ace_player addVest _gearClass;
        if ((count vestItems ace_player) > 0) then {
            {ace_player removeItemFromVest _x;nil} count (vestItems ace_player);
        };
        {ace_player addItemToVest _x;nil} count _items;
    };
    [parseText format ["<t align='center'>%1</t>", _actionSuccessText], 2] call ace_common_fnc_displayTextStructured;
} else {
    [parseText format ["<t align='center'>%1</t>", _actionFailureText], 2] call ace_common_fnc_displayTextStructured;
};
