#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles unit CBA player EH
 */

params ["_newPlayer", "_oldPlayer"];

TRACE_2("handlePlayerChanged",_newPlayer,_oldPlayer);

if (!(isNull _oldPlayer) && (GVAR(suppressedEH) isNotEqualTo -1)) then {
  _oldPlayer removeEventHandler ["Suppressed", GVAR(suppressedEH)];
};

0 call FUNC(resetEffects);
0 call FUNC(updateOverlayTexture);

// Don't add EH for curators
if ((side (group _newPlayer)) isEqualTo sideLogic) exitWith {
  GVAR(suppressedEH) = -1;
};

GVAR(suppressedEH) = _newPlayer addEventHandler ["Suppressed", {_this call FUNC(handleSuppressed)}];
