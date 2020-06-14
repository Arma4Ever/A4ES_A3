#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Draws squad memberlist
 */

params [["_refreshMembersCache", false, [false]]];

LOG_1("Drawing memberlist (refeshCache: %1)",str _refreshCache);

if (_refreshMembersCache) then {
  call FUNC(refreshMembersCache);
};

// TODO: draw memberlist
