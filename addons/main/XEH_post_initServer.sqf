#include "script_component.hpp"

if(!isServer) exitWith {};

{_x setdamage 0;} foreach vehicles;
