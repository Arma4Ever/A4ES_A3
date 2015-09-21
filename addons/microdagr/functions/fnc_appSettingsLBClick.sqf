/*
 * Author: PabstMirror
 * Handles double clicking on the setting listbox
 *
 * Arguments:
 * 0: Setting List box (not used) <CONTROL>
 * 1: Index <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [settingList, 1] call ace_microdagr_fnc_appSettingsLBClick
 *
 * Public: No
 */
#include "\z\ace\addons\microdagr\functions\script_component.hpp"

disableSerialization;
PARAMS_2(_control,_itemClicked);

//--- EDIT

switch (_itemClicked) do {
    case (0): {
    	GVAR(settingUseMils) = ! GVAR(settingUseMils);
    	[] call FUNC(updateDisplay);
    };
    case (1): {
    	GVAR(settingShowAllWaypointsOnMap) = ! GVAR(settingShowAllWaypointsOnMap);
    	[] call FUNC(updateDisplay);
    };
    case (2): {
        GVAR(settingTransmitter) = ! GVAR(settingTransmitter);
        ACE_player setvariable [QGVAR(transmitting), GVAR(settingTransmitter), true];
        [] call FUNC(updateDisplay);
    };
    case (3): {
        GVAR(settingReceiver) = ! GVAR(settingReceiver);
        [] call FUNC(updateDisplay);
    };
    case (4): {
        GVAR(settingShowAllMarkers) = ! GVAR(settingShowAllMarkers);
        [] call FUNC(updateDisplay);
    };
    case (5): {
    	GVAR(newGroupName) = 1;
    	[APP_MODE_SETUP] call FUNC(saveCurrentAndSetNewMode);
	};
    case (6): {
        if(GVAR(settingMarkerIcon) == 0) then {
            GVAR(settingMarkerIcon) = 1;
        } else {
            if(ace_microdagr_ctrlmodifer) then {
                if(GVAR(settingMarkerIcon) % 4 == 0) then {
                    GVAR(settingMarkerIcon) = GVAR(settingMarkerIcon) - 3;
                } else {
                     GVAR(settingMarkerIcon) = GVAR(settingMarkerIcon) + 1;
                };
            } else {
                GVAR(settingMarkerIcon) = GVAR(settingMarkerIcon) + 4;
            };
        };

        if(GVAR(settingMarkerIcon) > 48) then {GVAR(settingMarkerIcon) = 0;};

        ACE_player setvariable [QGVAR(transmittingMarkerIcon), GVAR(settingMarkerIcon), true];

        [] call FUNC(updateDisplay);
    };
};

//--- !EDIT