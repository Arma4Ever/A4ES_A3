/*
 * Author: SzwedzikPL
 *
 * Get In vehicle action
 */
#include "script_component.hpp"

_this spawn {
	EXPLODE_3_PVT(_this,_veh,_player,_parameters);
	EXPLODE_4_PVT(_parameters,_vehicle,_slotType,_slotIndex,_move);

	if(vehicle ace_player != ace_player && !_move) exitWith {};

	if(_slotType == "driver") then {
		if(isNull (driver _vehicle)) then {
			if(_move) then {
				moveOut ace_player;
				waituntil {vehicle ace_player == ace_player};
				ace_player moveInDriver _vehicle;
			} else {
				ace_player moveInDriver _vehicle;
			};
		};
	};

	if(_slotType == "turret") then {
		if(isNull (_vehicle turretUnit _slotIndex)) then {
			if(_move) then {
				moveOut ace_player;
				waituntil {vehicle ace_player == ace_player};
				ace_player moveInTurret [_vehicle,_slotIndex];
			} else {
				ace_player moveInTurret [_vehicle,_slotIndex];
			};
		};
	};
	if(_slotType == "cargo") then {
		if(([_vehicle,_slotIndex] call FUNC(checkCargoSlot)) select 0) then {
			if(_move) then {
				moveOut ace_player;
				waituntil {vehicle ace_player == ace_player};
				ace_player moveInCargo [_vehicle,_slotIndex];
			} else {
				ace_player moveInCargo [_vehicle,_slotIndex];
			};
		};
	};
};

