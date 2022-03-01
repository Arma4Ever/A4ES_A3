#include "\z\ace\addons\microdagr\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles double clicking on the setting listbox
 *
 * Arguments:
 * 0: Setting List box (not used) <CONTROL>
 * 1: Index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [settingList, 1] call ace_microdagr_fnc_appSettingsLBClick
 *
 * Public: No
 */

disableSerialization;
params ["", "_itemClicked"];

switch (_itemClicked) do {
    case (0): { GVAR(settingUseMils) = ! GVAR(settingUseMils)};
    case (1): { GVAR(settingShowAllWaypointsOnMap) = ! GVAR(settingShowAllWaypointsOnMap)};

    //--- EDIT
    case (2): {
      private _value = ace_player getVariable [QGVAR(broadcastPos), false];
      ace_player setVariable [QGVAR(broadcastPos), !_value, true];
      [] call FUNC(updateDisplay);
    };
    case (3): {
      private _value = !(ace_player getVariable [QGVAR(receivePos), false]);
      ace_player setVariable [QGVAR(receivePos), _value, true];

      if (_value) then {
        [GVAR(receivePFH)] call CBA_fnc_removePerFrameHandler;
        GVAR(receivePFH) = [{_this call FUNC(receivePFH);}, 5] call CBA_fnc_addPerFrameHandler;
      } else {
        [GVAR(receivePFH)] call CBA_fnc_removePerFrameHandler;
        GVAR(receivePFH) = -1;
        {deleteMarkerLocal _x} forEach GVAR(receiveMarkers);
      };

      [] call FUNC(updateDisplay);
    };
    case (4): {
    	GVAR(markerTitleMode) = true;
    	[APP_MODE_SETUP] call FUNC(saveCurrentAndSetNewMode);
	  };
    case (5): {
      private _markerId = ace_player getVariable [QGVAR(broadcastMarkerId), 0];

      if (_markerId == 0) then {
        _markerId = 1;
      } else {
        if (ace_microdagr_ctrlmodifer) then {
          if (_markerId % 4 == 0) then {
            _markerId = _markerId - 3;
          } else {
            _markerId = _markerId + 1;
          };
        } else {
          _markerId = _markerId + 4;
        };
      };

      if (_markerId > 52) then {_markerId = 0;};

      ace_player setvariable [QGVAR(broadcastMarkerId), _markerId, true];
      [] call FUNC(updateDisplay);
    };
    //--- EDIT
};

[] call FUNC(updateDisplay);
