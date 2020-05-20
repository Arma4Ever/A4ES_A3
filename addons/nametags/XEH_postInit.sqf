#include "script_component.hpp"

["CBA_settingsInitialized", {
  call FUNC(onDrawSettingsChanged);
}] call CBA_fnc_addEventHandler;

if !(isNil "TFAR_fnc_addEventHandler") then {
  [QGVAR(onSpeak), "OnSpeak", {
    params ["_unit", "_isSpeaking"];
    _unit setVariable [QGVAR(isSpeaking), _isSpeaking];
  }, ObjNull] call TFAR_fnc_addEventHandler;
};

["CBA_teamColorChanged", {
    params ["_unit", "_team"];

    private _color = ([
        [[1.00, 1.00, 1.00], '#ffffff'],
        [[1.00, 0.67, 0.67], '#ffabab'],
        [[0.67, 1.00, 0.67], '#abffab'],
        [[0.67, 0.67, 1.00], '#ababff'],
        [[1.00, 1.00, 0.67], '#ffffab']
    ] select (
        (["MAIN", "RED", "GREEN", "BLUE", "YELLOW"] find ([_team] param [0, "MAIN"])) max 0
    ));

    _unit setVariable [QGVAR(unitColor), _color];
}] call CBA_fnc_addEventHandler;

["ace_interactMenuOpened", {
    'ACEInteractMenu' call FUNC(displayLoad);
}] call CBA_fnc_addEventHandler;

["ace_interactMenuClosed", {
    'ACEInteractMenu' call FUNC(displayUnload);
}] call CBA_fnc_addEventHandler;
