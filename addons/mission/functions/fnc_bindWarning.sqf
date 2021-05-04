#include "script_component.hpp"

[{!isNull (findDisplay 46)}, {

    [
    localize LSTRING(Warning_Message),
    localize LSTRING(Warning_Message_Header),
    true
    ] spawn BIS_fnc_guiMessage;

}] call CBA_fnc_waitUntilAndExecute;
