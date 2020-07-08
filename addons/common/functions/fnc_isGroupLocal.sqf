#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Chekcs if group and all group units are local
 */

params ["_group"];

if !(local _group) exitWith {false};
((units _group) findIf {!(local _x)}) isEqualTo -1
