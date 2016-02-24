/*
 * Author: SzwedzikPL
 * Send SQL query to DB
 */
#include "script_component.hpp"

if(!isServer) exitWith {};

params [["_query", "", [""]]];
if(_query == "") exitWith {};

A3CS_LOGINFO_1("queryDB: %1",_query)

if(isDedicated) exitWith {
    "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['armalog', '%1']", _query]
};

""
