/*
 * Author: SzwedzikPL
 * Send nametag data to all clients
 */
#include "script_component.hpp"

private _sql = ["SELECT * FROM members WHERE 1"] call FUNC(queryDB);
private _sqlArray = call compile _sql;

if(isNil "_sqlArray" || {!(_sqlArray isEqualType [])}) exitWith {A3CS_LOGWARN("sendNametagData: Niepoprawny typ danych")};

private _membersArray = _sqlArray param [0, [], [[]]];

private _uids = [];
private _classes = [];

{
    _x params ["", "", "_memberUID", "_memberStatus"];
    _uids pushback _memberUID;
    _classes pushback "_memberStatus";
} forEach _membersArray;

EGVAR(nametag,members) = [_uids, _classes];
publicVariable QEGVAR(nametag,members);
