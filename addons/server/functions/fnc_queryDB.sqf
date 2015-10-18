/*
 * Author: SzwedzikPL
 *
 * Send SQL query to DB
 */
#include "script_component.hpp"

if(hasInterface) exitWith {};

params [["_query", "", [""]]];
if(_query == "") exitWith {};

"Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['armalog', '%1']", _query]
