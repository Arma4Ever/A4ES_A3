#include "script_component.hpp"

// Exit if dedicated/HC
if (!hasInterface) exitWith {};

/*
  LOCAL STATE OBSERVER
*/

GVAR(isEscorting) = player getVariable ["ace_captives_isEscorting", false];
GVAR(escortedUnit) = player getVariable ["ace_captives_escortedUnit", objNull];

GVAR(isCarrying) = player getVariable ["ace_dragging_isCarrying", false];
GVAR(carriedObject) = player getVariable ["ace_dragging_carriedObject", objNull];

GVAR(isDragging) = player getVariable ["ace_dragging_isDragging", false];
GVAR(draggedObject) = player getVariable ["ace_dragging_draggedObject", objNull];

GVAR(isBurning) = player getVariable ["ace_fire_burning", false];

GVAR(isDiggingTrench) = ((player getVariable ["ace_trenches_isDiggingId", -1]) != -1) || {player getVariable ["grad_trenches_functions_diggingTrench", false]};

[{
  private _player = player;
  private _isEscorting = _player getVariable ["ace_captives_isEscorting", false];
  if (_isEscorting != GVAR(isEscorting)) then {
    GVAR(isEscorting) = _isEscorting;
    if (_isEscorting) then {
      GVAR(escortedUnit) = _player getVariable ["ace_captives_escortedUnit", objNull];
      ["a4es_escortingUnit", [_player, GVAR(escortedUnit), true]] call CBA_fnc_serverEvent;
    } else {
      ["a4es_escortingUnit", [_player, GVAR(escortedUnit), false]] call CBA_fnc_serverEvent;
      GVAR(escortedUnit) = objNull;
    };
  };

  private _isCarrying = _player getVariable ["ace_dragging_isCarrying", false];
  private _carriedObject = _player getVariable ["ace_dragging_carriedObject", objNull];
  if ((_isCarrying != GVAR(isCarrying)) && {_carriedObject isNotEqualTo GVAR(carriedObject)}) then {
    GVAR(isCarrying) = _isCarrying;
    if (_isCarrying) then {
      GVAR(carriedObject) = _carriedObject;
      ["a4es_carryingObject", [_player, GVAR(carriedObject), true]] call CBA_fnc_serverEvent;
    } else {
      ["a4es_carryingObject", [_player, GVAR(carriedObject), false]] call CBA_fnc_serverEvent;
      GVAR(carriedObject) = objNull;
    };
  };

  private _isDragging = _player getVariable ["ace_dragging_isDragging", false];
  private _draggedObject = _player getVariable ["ace_dragging_draggedObject", objNull];
  if ((_isDragging != GVAR(isDragging)) && {_draggedObject isNotEqualTo GVAR(draggedObject)}) then {
    GVAR(isDragging) = _isDragging;
    if (_isDragging) then {
      GVAR(draggedObject) = _draggedObject;
      ["a4es_draggingObject", [_player, GVAR(draggedObject), true]] call CBA_fnc_serverEvent;
    } else {
      ["a4es_draggingObject", [_player, GVAR(draggedObject), false]] call CBA_fnc_serverEvent;
      GVAR(draggedObject) = objNull;
    };
  };

  private _isBurning = _player getVariable ["ace_fire_burning", false];
  if (_isBurning != GVAR(isBurning)) then {
    GVAR(isBurning) = _isBurning;
    ["a4es_playerBurning", [_player, _isBurning]] call CBA_fnc_serverEvent;
  };


  private _isDiggingTrench = ((_player getVariable ["ace_trenches_isDiggingId", -1]) != -1) || {_player getVariable ["grad_trenches_functions_diggingTrench", false]};
    if (_isDiggingTrench != GVAR(isDiggingTrench)) then {
    GVAR(isDiggingTrench) = _isDiggingTrench;
    if (_isDiggingTrench) then {
      // Time counter?
    } else {
      ["a4es_trenchDigEnd", [_player]] call CBA_fnc_serverEvent;
    };
  };
}, 0.25] call CBA_fnc_addPerFrameHandler;

/*
  STATS
*/

// Move to server-side?
player addEventHandler ["FiredMan", {
  params ["", "_weapon", "", "", "_ammo"];

  if (_weapon == "Throw") exitWith {
    ["a4es_playerThrowGrenade", [player, _ammo]] call CBA_fnc_serverEvent;
  };
}];