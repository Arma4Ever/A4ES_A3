#include "script_component.hpp"

// Exit if no interface or it's main menu intro
if (!hasInterface || EGVAR(common,isMainMenu)) exitWith {};

["CBA_settingsInitialized", {
  call FUNC(onSettingsChanged);
}] call CBA_fnc_addEventHandler;

[QEGVAR(squads,squadsUpdated), {
  private _currentSquad = ace_player call EFUNC(squads,getUnitSquad);
  if (isNull _currentSquad) exitWith {};

  {
    if (_x isEqualTo _currentSquad) exitWith {
      true call FUNC(drawMemberlist);
    };
  } forEach _this;
}] call CBA_fnc_addEventHandler;

private _handleSoftUpdate = {
  params ["_unit"];

  private _unitSquad = _unit call EFUNC(squads,getUnitSquad);
  if (isNull _unitSquad) exitWith {};

  private _currentSquad = ace_player call EFUNC(squads,getUnitSquad);
  if (isNull _currentSquad) exitWith {};

  if (_unitSquad isEqualTo _currentSquad) then {
    false call FUNC(drawMemberlist);
  };
};

[QGVAR(onSpeak), "OnSpeak", _handleSoftUpdate, ObjNull] call TFAR_fnc_addEventHandler;
["CBA_teamColorChanged", _handleSoftUpdate] call CBA_fnc_addEventHandler;
