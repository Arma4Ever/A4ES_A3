#include "script_component.hpp"

if (hasInterface) then {
    ace_microdagr_newGroupName = 0;
    ace_microdagr_mapMarkersUpdateInterval = 5;
    ace_microdagr_mapMarkersLastUpdate = 0;
    ace_microdagr_mapMarkersCache = [];

    ace_microdagr_settingSimpleTransmitter = false;
    ace_microdagr_settingTransmitter = false;
    ace_microdagr_settingReceiver = false;
    ace_microdagr_settingShowAllMarkers = true;
    ace_microdagr_settingMarkerName = "";
    ace_microdagr_settingMarkerIcon = 0;

    ACE_player setvariable ["ace_microdagr_simpleTransmitting", false, true];
    ACE_player setvariable ["ace_microdagr_transmitting", false, true];
    ACE_player setvariable ["ace_microdagr_transmittingMarkerName", "", true];
    ACE_player setvariable ["ace_microdagr_transmittingMarkerIcon", 0, true];

    ace_microdagr_ctrlmodifer = false;

    0 spawn {
        waituntil {!(IsNull (findDisplay 46))};
        _keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", "(if (_this select 1 == 29) then {ace_microdagr_ctrlmodifer = true;})"];
        _keyUp = (findDisplay 46) displayAddEventHandler ["Keyup", "ace_microdagr_ctrlmodifer = false;"];
    };
};
