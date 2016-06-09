/*
 * Author: SzwedzikPL
 * Send SQL query to DB
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

params [["_query", "", [""]]];
if (_query == "") exitWith {};
TRACE_1("queryDB",_query);

private _result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand [""a3c_server"", ""%1""]", _query];

_result
