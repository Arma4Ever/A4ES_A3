/*
 * Author: SzwedzikPL
 * Show admin message
 */
#include "script_component.hpp"

params [["_author", "", [""]], ["_message", "", [""]]];
if (_author == "" || _message == "") exitWith {};

private _messageTitle = format [localize LSTRING(Module_AdminMessages_MessageTitle), _author];
["a4es_adminMessage", [_messageTitle, _message]] call bis_fnc_shownotification;
