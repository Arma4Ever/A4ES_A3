#include "\z\ace\addons\medical_engine\script_component.hpp"

// EDIT
if (a3cs_medical_systemDisabled) exitWith {};
// EDIT

[QGVAR(updateDamageEffects), LINKFUNC(updateDamageEffects)] call CBA_fnc_addEventHandler;
["unit", {
    params ["_new"];
    [_new] call FUNC(updateDamageEffects); // Run on new controlled unit to update QGVAR(aimFracture)
}, true] call CBA_fnc_addPlayerEventHandler;


["CAManBase", "init", {
    params ["_unit"];

    // EDIT
    if !(
      isPlayer _unit ||
      {_unit in switchableUnits} ||
      {_unit in playableUnits} ||
      {_unit in allPlayers} ||
      {_unit getVariable ["a3cs_medical_enableACEDamage", false]}
    ) exitWith {};
    _unit setVariable ["a3cs_medical_aceDamageEnabled", true];
    // EDIT

    private _allHitPoints = getAllHitPointsDamage _unit param [0, []];

    // Calling this function inside curly brackets allows the usage of
    // "exitWith", which would be broken with "HandleDamage" otherwise.
    _unit setVariable [
        QEGVAR(medical,HandleDamageEHID),
        _unit addEventHandler ["HandleDamage", {_this call FUNC(handleDamage)}]
    ];
    _unit setVariable [
        QEGVAR(medical,HitEHID),
        _unit addEventHandler ["Hit", {_this call FUNC(hit)}]
    ];

    _unit setVariable [QEGVAR(medical,HitPoints), _allHitPoints];

    _unit setVariable [QEGVAR(medical,HeadHitPointIdxs), ["hitface", "hitneck", "hithead"]  apply {_allHitPoints find _x} ];
    _unit setVariable [QEGVAR(medical,BodyHitPointIdxs), ["hitchest", "hitdiaphragm", "hitabdomen", "hitpelvis"]  apply {_allHitPoints find _x} ];

    _unit setVariable [QEGVAR(medical,HitPoints), _allHitPoints];
    {
        _unit setVariable [format["%1Idx", _x], _forEachIndex];

    } forEach _allHitPoints;
}, nil, [IGNORE_BASE_UAVPILOTS], true] call CBA_fnc_addClassEventHandler;


// this handles moving units into vehicles via load functions or zeus
// needed, because the vanilla INCAPACITATED state does not handle vehicles
["CAManBase", "GetInMan", {
    params ["_unit"];
    if (!local _unit) exitWith {};

    if (lifeState _unit == "INCAPACITATED") then {
        [_unit, true] call FUNC(setUnconsciousAnim);
    };
}] call CBA_fnc_addClassEventHandler;

// Guarantee aircraft crashes are more lethal
["Air", "Killed", {
    params ["_vehicle", "_killer"];
    TRACE_3("air killed",_vehicle,typeOf _vehicle,velocity _vehicle);
    if ((getText (configOf _vehicle >> "destrType")) == "") exitWith {};
    if (unitIsUAV _vehicle) exitWith {};

    private _lethality = linearConversion [0, 25, (vectorMagnitude velocity _vehicle), 0.5, 1];
    TRACE_2("air crash",_lethality,crew _vehicle);
    {
        [QEGVAR(medical,woundReceived), [_x, "Head", _lethality, _killer, "#vehiclecrash", [HITPOINT_INDEX_HEAD,1]], _x] call CBA_fnc_targetEvent;
    } forEach (crew _vehicle);
}, true, ["ParachuteBase"]] call CBA_fnc_addClassEventHandler;

// Fixes units being stuck in unconscious animation when being knocked over by a PhysX object
["CAManBase", "AnimDone", {
    params ["_unit", "_anim"];
    if (local _unit && {_anim find QGVAR(face) != -1 && {lifeState _unit != "INCAPACITATED"}}) then {
        [_unit, false] call FUNC(setUnconsciousAnim);
    };
}] call CBA_fnc_addClassEventHandler;
