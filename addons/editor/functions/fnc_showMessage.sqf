/*
    Author: Bohemia Interactive

    Description:
    Show Eden Editor Message

    Parameter(s):
    0: STRING - message text
    1: NUMBER - how long message is present
    2: NUMBER - message type (0 - info, 1 - warning)

    Returns:
    None
*/


#include "\a3\3DEN\UI\resincl.inc"
#define COMMIT_TIME 0.1

if (is3DEN) then {
    params ["_text", ["_sleep", 1, [0]], ["_type", 0, [0]]];

    //--- Play sound
    private ["_sounds"];
    _sounds = ["3DEN_notificationDefault","3DEN_notificationWarning"];
    playsound [_sounds select _type, true];

    //--- Init notification
    private ["_colors","_display","_ctrlNotification","_ctrlNotificationPos"];
    _colors = ["colorNotificationDefault","colorNotificationWarning"];
    _display = finddisplay IDD_DISPLAY3DEN;
    _ctrlNotification = _display displayctrl IDC_DISPLAY3DEN_NOTIFICATION;
    _ctrlNotification ctrlsetstructuredtext parsetext "Schnobble";
    _ctrlNotificationTextHeight = ctrltextheight _ctrlNotification; //--- Measure single line height
    _ctrlNotification ctrlsetstructuredtext parsetext _text;
    _ctrlNotification ctrlsetbackgroundcolor ((configfile >> "Cfg3DEN" >> "Default" >> "Draw" >> (_colors select _type)) call bis_fnc_colorConfigToRGBA);
    _ctrlNotificationPos = ctrlposition _ctrlNotification;

    //--- Reset position
    _ctrlNotificationPos set [3,0];
    _ctrlNotification ctrlsetposition _ctrlNotificationPos;
    _ctrlNotification ctrlcommit 0;

    //--- Animate
    if !(isnil "bis_fnc_3DENNotification_spawn") then {terminate bis_fnc_3DENNotification_spawn;};
    bis_fnc_3DENNotification_spawn = [_ctrlNotification,_ctrlNotificationTextHeight, _sleep] spawn {
        scriptname "BIS_fnc_3DENNotification: Spawn";
        disableserialization;

        //--- Expand
        _ctrlNotification = _this select 0;
        _ctrlNotificationTextHeight = _this select 1;
        _ctrlNotificationPos = ctrlposition _ctrlNotification;
        _ctrlNotificationPos set [3,ctrltextheight _ctrlNotification];
        _ctrlNotification ctrlsetposition _ctrlNotificationPos;
        _ctrlNotification ctrlcommit COMMIT_TIME;

        uisleep ((_this select 2) + (ctrltextheight _ctrlNotification / _ctrlNotificationTextHeight)); //--- Sleep longer for eacg text line

        //--- Collapse
        _ctrlNotificationPos set [3,0];
        _ctrlNotification ctrlsetposition _ctrlNotificationPos;
        _ctrlNotification ctrlcommit COMMIT_TIME;
    };
};
