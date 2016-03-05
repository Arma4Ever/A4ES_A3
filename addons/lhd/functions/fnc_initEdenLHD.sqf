/*
 * Author: SzwedzikPL
 * Creates LHD object in eden on loading mission
 */
#include "script_component.hpp"

private _lhds = (all3DENEntities select 0) select {_x isKindOf "a3cs_lhd"};
{_x call FUNC(initLHD);} forEach _lhds;
