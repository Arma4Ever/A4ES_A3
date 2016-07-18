/*
    Author: SzwedzikPL
    Eden DLC check
*/
#include "script_component.hpp"

if (!is3DEN) exitWith {};
if (worldName == "Tanoa") exitWith {};

private _objects = all3DENEntities select 0;
private _apexElements = false;
private _publicObjects = [
    "land_boat_03_abandoned_cover_f",
    "land_irmaskingcover_01_f",
    "land_irmaskingcover_02_f",
    "land_woodencounter_01_f",
    "land_woodencrate_01_f",
    "land_woodencrate_01_stack_x3_f",
    "land_woodencrate_01_stack_x5_f",
    "land_tyre_01_line_x5_f",
    "land_tyre_01_f",
    "land_garbageheap_01_f",
    "land_garbageheap_02_f",
    "land_garbageheap_03_f",
    "land_garbageheap_04_f",
    "land_satelliteantenna_01_f",
    "land_tripodscreen_01_large_f",
    "land_tripodscreen_01_dual_v2_f",
    "land_tripodscreen_01_dual_v1_f",
    "land_portablegenerator_01_f",
    "land_device_slingloadable_f",
    "land_boat_01_abandoned_red_f",
    "land_boat_01_abandoned_blue_f",
    "land_boat_02_abandoned_f",
    "land_boat_03_abandoned_f",
    "land_boat_05_wreck_f",
    "land_boat_06_wreck_f",
    "land_boat_04_wreck_f",
    "land_locomotive_01_v2_f",
    "land_locomotive_01_v3_f",
    "land_locomotive_01_v1_f",
    "land_railwaycar_01_sugarcane_empty_f",
    "land_railwaycar_01_sugarcane_f",
    "land_railwaycar_01_passenger_f",
    "land_railwaycar_01_tank_f",
    "land_miningshovel_01_abandoned_f",
    "land_excavator_01_abandoned_f",
    "land_excavator_01_wreck_f",
    "land_bulldozer_01_wreck_f",
    "land_combineharvester_01_wreck_f",
    "land_bulldozer_01_abandoned_f",
    "land_haultruck_01_abandoned_f",
    "land_historicalplanewreck_01_f",
    "land_historicalplanewreck_03_f",
    "land_historicalplanewreck_02_wing_left_f",
    "land_historicalplanewreck_02_wing_right_f",
    "land_historicalplanewreck_02_front_f",
    "land_historicalplanewreck_02_rear_f",
    "land_historicalplanedebris_01_f",
    "land_historicalplanedebris_02_f",
    "land_historicalplanedebris_03_f",
    "land_historicalplanedebris_04_f",
    "land_vergerock_01_f",
    "land_roadcone_01_f"
];

{
    private _object = _x;
    private _isVehicle = _object isKindOf "AllVehicles";
    private _isBox = _object isKindOf "ReammoBox_F";
    private _isPublic = (tolower (typeof _object)) in _publicObjects;

    if (!_isVehicle && !_isBox && !_isPublic) then {
        private _dlc = getText (configfile >> "CfgVehicles" >> (typeof _object) >> "DLC");
        if (_dlc == "Expansion") exitWith {
            _apexElements = true;
        };
    };
} forEach _objects;

if (_apexElements) then {
    0 spawn {
        sleep 1;
        [localize LSTRING(ApexWarning), 7, 1] call FUNC(showMessage);
    };
};
