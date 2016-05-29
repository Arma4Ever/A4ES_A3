/*
 * Author: SzwedzikPL
 * Adds action to object (local)
 */
#include "script_component.hpp"

params ["_time", "_showNotification"];

if (_showNotification) then {
    [_time] spawn {
        params ["_time"];
        if (hasInterface) then {
            disableSerialization;

            private _layer = QGVAR(skipTime) cutText ["", "BLACK OUT", 2, true];
            sleep 2;

            _layer = QGVAR(skipTime) cutRsc ["RscTime", "BLACK", 0, true];
            private _display = uiNamespace getVariable ['BIS_InfoTime', displayNull];
            private _textControl = _display displayCtrl 112301;

            private _text = parseText format["<t size='2'>%1</t>", format [localize LSTRING(SkipTime_LaterInfo), _time]];
        	_textControl ctrlSetStructuredText _text;

            skipTime _time;

            sleep 4;

            _layer = QGVAR(skipTime) cutText ["", "BLACK IN", 2, true];
            sleep 2;

            _layer = QGVAR(skipTime) cutText ["", "PLAIN"];
        } else {
            sleep 2;
            skipTime _time;
        };
    };
} else {
    skipTime _time;
};
