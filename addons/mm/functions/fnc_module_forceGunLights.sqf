#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if(!_activated) exitWith {};

{
    (group _x) enableGunLights "forceOn";
} foreach _units;
