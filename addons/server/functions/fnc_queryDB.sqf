/*
 * Author: SzwedzikPL
 * Send SQL query to DB
 */
#include "script_component.hpp"

if(!isServer) exitWith {};

params [["_query", "", [""]]];
if(_query == "") exitWith {};

A3CS_LOGINFO_1("queryDB: %1",_query)

private _result = "";
if(isDedicated) then {
    _result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand [""a3cs_server"", ""%1""]", _query];
};

_result
