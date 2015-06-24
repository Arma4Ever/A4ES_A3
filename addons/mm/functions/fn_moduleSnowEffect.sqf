_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;
if(!isServer) exitWith {};
if(!_activated) exitWith {};

[[_logic, _units, _activated],"PAM_Modules_fnc_moduleSnowEffectLocal",true,true] call BIS_fnc_MP;

true