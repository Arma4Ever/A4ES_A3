/*
 * Author: SzwedzikPL
 *
 * Send nametag data to all clients
 */
#include "script_component.hpp"

private ["_sql", "_sqlArray", "_membersArray", "_uids", "_classes"];

_sql = ["SELECT * FROM members WHERE 1"] call FUNC(queryDB);
_sqlArray = call compile _sql;
_membersArray = _sqlArray param [0, [], [[]]];

_uids = [];
_classes = [];

{
    _uids pushback (_x select 2);
    _classes pushback (_x select 3);
    nil
} count _membersArray;

a3cs_nametag_members = [_uids, _classes];
publicVariable "a3cs_nametag_members";
