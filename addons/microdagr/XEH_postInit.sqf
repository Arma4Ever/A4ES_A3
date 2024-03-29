#include "script_component.hpp"

if (hasInterface) then {
  ace_microdagr_markerTitleMode = false;
  ace_microdagr_ctrlmodifer = false;
  ace_microdagr_receivePFH = -1;
  ace_microdagr_receiveMarkers = [];

  ace_microdagr_showMicrodagrMarkersOnMap = true;

  ["visibleMap", {
    params ["_unit", "_visibleMap"];
    if !(_unit getVariable ["ace_microdagr_receivePos", false]) exitWith {};
    
    private _alpha = parseNumber (ace_microdagr_showMicrodagrMarkersOnMap || !_visibleMap);
    {_x setMarkerAlphaLocal _alpha} forEach ace_microdagr_receiveMarkers;
  }] call CBA_fnc_addPlayerEventHandler;

  ["unit", {
    params ["_unit"];

    [ace_microdagr_receivePFH] call CBA_fnc_removePerFrameHandler;
    ace_microdagr_receivePFH = -1;
    {deleteMarkerLocal _x} forEach ace_microdagr_receiveMarkers;

    if (_unit getVariable ["ace_microdagr_receivePos", false]) then {
      ace_microdagr_receivePFH = [{_this call ace_microdagr_fnc_receivePFH;}, 5] call CBA_fnc_addPerFrameHandler;
    };
  }] call CBA_fnc_addPlayerEventHandler;

  ["loadout", {
    if (
      (ace_player getVariable ["ace_microdagr_broadcastPos", false]) ||
      {ace_player getVariable ["ace_microdagr_receivePos", false]}
    ) then {
      if !("ACE_microDAGR" in (ace_player call ACEFUNC(common,uniqueItems))) then {
        ace_player setVariable ["ace_microdagr_receivePos", false, true];
        ace_player setVariable ["ace_microdagr_broadcastPos", false, true];
        [ace_microdagr_receivePFH] call CBA_fnc_removePerFrameHandler;
        ace_microdagr_receivePFH = -1;
        {deleteMarkerLocal _x} forEach ace_microdagr_receiveMarkers;
      };
    };
  }] call CBA_fnc_addPlayerEventHandler;
};
