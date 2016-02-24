/*
 * Author: SzwedzikPL
 * Show vanilla notification
 */
#include "script_component.hpp"

params [["_class", "", [""]], ["_text", "", [""]]];

if(_class == "") then {
    _class = "";
};

[_class,["", _text]] call bis_fnc_shownotification;
