/*
	Author: SzwedzikPL

	Description:
	Function of fireArtillery module
*/
#include "script_component.hpp"

if(!isServer) exitWith {};
_this spawn {
	private ["_logic", "_units", "_activated"];

	_logic = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_units = [_this,1, [], [[]]] call BIS_fnc_param;
	_activated = [_this, 2, false, [false]] call BIS_fnc_param;

	if (_activated) then {

		//----- Parameters
		private ["_ammoClass", "_conditionLogic", "_conditionNumber", "_fireMinDelay", "_fireMaxDelay", "_trigger"];

        _trigger = call compile (_logic getVariable ["fireTarget", ""]);
		_ammoClass = _logic getvariable ["ammotype","Sh_82mm_AMOS"];
		_conditionLogic = _logic getvariable ["conditionlogic",""];
		_conditionNumber = _logic getvariable ["conditionnumber",0];
		_fireMinDelay = _logic getvariable ["shellmindelay",0];
		_fireMaxDelay = _logic getvariable ["shellmaxdelay",0];

		if(_conditionLogic == "" && _conditionNumber<=0) exitWith {[localize "STR_A3CS_MM_FNC_fireArtillery_NoFireCondition"] call bis_fnc_error;};

		//----- Select condition type
		private ["_condition","_conditionType"];

		_condition = 0;
		_conditionType = "";
		if(_conditionNumber > 0) then {
			_condition = _conditionNumber;
			_conditionType = "number";
		};
		if(_conditionLogic != "") then {
			_condition = compile _conditionLogic;
			_conditionType = "logic";
		};

		//-- Debug
		if(!isMultiplayer) then {systemChat format [localize "STR_A3CS_MM_FNC_fireArtillery_Debug_StartingOfFire"];};

		//----- Firing!
		//{
			[_ammoClass, _trigger, _condition, _conditionType, [_fireMinDelay,_fireMaxDelay]] spawn {
				private ["_ammoClass", "_fireZone", "_condition", "_conditionLogic", "_conditionType", "_fireDelay"];

				_ammoClass = _this select 0;
				_fireZone = _this select 1;
				_condition = _this select 2;
				_conditionType = _this select 3;
				_fireDelay = _this select 4;

				if(_conditionType == "logic") then {
					_conditionLogic = _condition;
					_condition = 1;
				};

				while {_condition > 0} do {
					private ["_fireZonePosition", "_fireZoneDirection", "_fireZoneSize", "_shellPosition", "_shellPositionInZone"];

					_fireZonePosition = getposatl _fireZone;
					_fireZoneDirection = getDir _fireZone;
					_fireZoneSize = ((triggerArea _fireZone) select 0) max ((triggerArea _fireZone) select 1);
					_fireZoneSize = if ((triggerArea _fireZone) select 3) then {_fireZoneSize + (_fireZoneSize/2)} else {_fireZoneSize + (_fireZoneSize/5)};

					_shellPosition = [];
					_shellPositionInZone = false;

					waitUntil {
						_shellPosition = [_fireZonePosition, random _fireZoneSize, random 360] call BIS_fnc_relPos;
						if ([_shellPosition, _fireZone] call CBA_fnc_inArea) then {_shellPositionInZone = true;};
						_shellPositionInZone
					};

					//-- Default shell parameters
					private ["_shellAltitude", "_shellVelocity", "_rocketClasses"];

					_shellPosition set [2, 0];
					_shellAltitude = 500;
					_shellVelocity = [0, 0, -50];

					//--- Rocket parameters
					_rocketClasses = ["missile_agm_01_f","moduleordnancerocket_f_ammo"];
					if(toLower(_ammoClass) in _rocketClasses) then {
						_shellPosition = [_shellPosition,500, _fireZoneDirection + 180] call bis_fnc_relpos;
						_shellAltitude = 1000 - ((getterrainheightasl _shellPosition) - (getterrainheightasl _fireZonePosition));
						_shellVelocity = [sin _fireZoneDirection * 68, cos _fireZoneDirection * 68, -100];
					};

					//-- Correct shell altitude
					_shellPosition set [2,_shellAltitude];

					//-- Fire
					private "_shell";

					_shell = createvehicle [_ammoClass, _shellPosition, [], 0, "none"];
					_shell setpos _shellPosition;
					_shell setvelocity _shellVelocity;

					//if(!isNil "DFyre_A_Core_Fired") then {[objNull, '', '', '',_ammoClass, _shell] call DFyre_A_Core_Fired;};

					if(toLower(_ammoClass) == "missile_agm_01_f") then {
						sleep 0.01;
						_shell setVectorUp [0, 0.902134, 0.430359];
					};

					//-- Debug
					if(!isMultiplayer) then {
						_shell spawn {
							private ["_marker", "_markername", "_markerpos"];
							_markername = str _this;
							waituntil {
								if(alive _this) then {_markerpos = getPos _this;};
								!alive _this
							};
							_marker = createMarkerLocal ["marker"+_markername, _markerpos];
							_marker setMarkerTypeLocal "mil_circle";
							_marker setMarkerColorLocal "ColorRed";
							_marker setMarkerSizeLocal [0.5, 0.5];
						};
					};

					//-- Delay between shells
					private "_sleep";
					_sleep = _fireDelay call BIS_fnc_randomNum;
					sleep _sleep;

					//-- Check condition
					if(_conditionType == "logic") then {
						if(!call (_conditionLogic)) then {_condition = 0;};
					};
					if(_conditionType == "number") then {
						_condition = _condition-1;
					};
				};
			};
		//} forEach _triggers;
	};
};
true
