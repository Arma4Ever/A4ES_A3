#include "script_component.hpp"

if((GVAR(fleximenuType) == 1 || vehicle ace_player != ace_player) && GVAR(fleximenuFirstRun)) then {
	GVAR(fleximenuActions) = ((GVAR(fleximenuActions) select 0) select 2) select 1;
};

GVAR(fleximenuFirstRun) = false;

_this call FUNC(flexiMenu);