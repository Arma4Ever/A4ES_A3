#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Init's corpse object from generateCorpse module
 */

params ["_body", "_anim"];

_body switchMove _anim;
_body enableSimulation false;
