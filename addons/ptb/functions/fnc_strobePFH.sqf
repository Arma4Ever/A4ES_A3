/*
 * Author: SzwedzikPL
 * Strobe check PFH
 */
#include "script_component.hpp"

{
    private _source = _x;
    if(isNull attachedTo _source) then {
        GVAR(particleSources) deleteAt (GVAR(particleSources) find _source);
        deleteVehicle _source;
    };
} foreach +GVAR(particleSources);
