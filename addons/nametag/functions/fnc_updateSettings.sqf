#include "script_component.hpp"

params ["_option"];

if(_option == "init" || _option == QGVAR(enableSthud)) then {
    0 spawn FUNC(sthud_init);
};

if(_option == "init" || _option == QGVAR(enableCommandBar)) then {
    private ["_hud", "_info", "_radar", "_compass", "_direction", "_menu", "_group", "_cursor"];
    _hud = true; //show scripted HUD (same as normal showHUD true/false)
    _info = true; //show vehicle + soldier info (hides weapon info from the HUD as well)
    _radar = true; //show vehicle radar
    _compass = true; //show vehicle compass
    _direction = true; //show tank direction indicator (not present in vanilla Arma 3)
    _menu = true; //show commanding menu (hides HC related menus)
    _group = GVAR(enableCommandBar); //show group info bar (hides squad leader info bar)
    _cursor = true; //show HUD weapon cursors (connected with scripted HUD)
    showHUD [_hud, _info, _radar, _compass, _direction, _menu, _group, _cursor];
};

if(_option == "init" || _option == QGVAR(enableCursorNametag) || _option == QGVAR(enable3dNametag)) then {
    if (isNil QGVAR(drawHandler) && {GVAR(enable3dNametag) > 0} && GVAR(enableCursorNametag)) then {
        GVAR(drawHandler) = addMissionEventHandler ["Draw3D", {_this call FUNC(onDraw3D);}];
    } else {
        if (!isNil QGVAR(drawHandler) && {GVAR(enable3dNametag) == 0} && !GVAR(enableCursorNametag)) then {
            removeMissionEventHandler ["Draw3D", GVAR(drawHandler)];
            GVAR(drawHandler) = nil;
        };
    };
};
