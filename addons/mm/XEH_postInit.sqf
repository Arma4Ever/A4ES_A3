#include "script_component.hpp"

if (!hasInterface && !isDedicated) then {
    missionNamespace setVariable [QGVAR(headlessClient), player, true];
    [{[] remoteExecCall [QFUNC(initHeadless), 2, false];}, [], 1] call CBA_fnc_waitAndExecute;
};

/*
["medical_onUnconscious", {
    params ["_unit", "_status"];
    TRACE_2("medical_onUnconscious",_unit,_status);
    if (!local _unit || {!_status} || {isPlayer _unit}) exitWith {};
    if (_unit getVariable [QGVAR(genAttack), false]) exitWith {_unit setDamage 1;};
    _unit setVariable [QGVAR(unconsciousTime), CBA_missionTime];
    [DFUNC(checkUnconsciousness), [_unit], 61] call CBA_fnc_waitAndExecute;
}] call EFUNC ace_common_fnc_addEventHandler;
*/

if (isServer) then {
    [FUNC(initCache), [], 5] call CBA_fnc_waitAndExecute;

    if (isMultiplayer) then {
        [QGVAR(startWeaponSafety), []] call ace_common_fnc_globalEvent;
    };

    [{
        private _enableMissionIntro = missionNamespace getVariable [QGVAR(enableMissionIntro), true];
        private _enableMissionIntroSP = missionNamespace getVariable [QGVAR(enableMissionIntroSP), false];

        if ((isMultiplayer && _enableMissionIntro) || (!isMultiplayer && _enableMissionIntroSP)) then {
            [QGVAR(showIntro), []] call ace_common_fnc_globalEvent;
        };
    }, [], 3] call CBA_fnc_waitAndExecute;
};

if (hasInterface) then {
    //Error when mission was created in 2D editor
    //if(missionVersion == 12 && {!((tolower missionName) in ["intro","intro1","intro_new"])}) then {
    //    hint parseText format ["<t size='1.5' color='#FF0000'>%1</t><br/><t size='1.1' color='#FF0000'>%2</t>", localize LSTRING(MissionFrom2DEditor1), localize LSTRING(MissionFrom2DEditor2)];
    //};

    //PreInit character desc
    private _characterDesc = player getVariable [QGVAR(characterDesc), ""];
    player createDiaryRecord ["Diary", [localize LSTRING(ObjectAttribute_Control_CharacterDesc_DisplayName), _characterDesc]];

    ["SettingChanged", {
        params ["_option"];
        if (_option == QGVAR(enableColorCorrectionsEffect)) then {
            private _ppEnabled = missionNamespace getVariable [QGVAR(colorCorrectionsEnabled), false];
            if (!_ppEnabled) exitWith {};
            private _ppEffect = missionNamespace getVariable [QGVAR(colorCorrectionsEffect), []];
            _ppEffect ppEffectEnable GVAR(enableColorCorrectionsEffect);
            _ppEffect ppEffectCommit 0;
        };
    }] call ace_common_fnc_addEventHandler;
};
