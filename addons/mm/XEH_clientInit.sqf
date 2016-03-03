#include "script_component.hpp"

if(!hasInterface) exitWith {};

//Error when mission was created in 2D editor
if(missionVersion == 12 && {!((tolower missionName) in ["intro","intro1","intro_new"])}) then {
    hint parseText format ["<t size='1.5' color='#FF0000'>%1</t><br/><t size='1.1' color='#FF0000'>%2</t>", localize LSTRING(MissionFrom2DEditor1), localize LSTRING(MissionFrom2DEditor2)];
};

//PreInit character desc
private _characterDesc = player getVariable [QGVAR(characterDesc), ""];
player createDiaryRecord ["Diary", [localize LSTRING(ObjectAttribute_Control_CharacterDesc_DisplayName), _characterDesc]];

if(isMultiplayer && !didJIP) then {
    //Put weapon on safety if its start of multiplayer mission
    [player, currentWeapon player, currentMuzzle player] call ace_safemode_fnc_lockSafety;
};

[{
    private _enableMissionIntro = missionNamespace getVariable [QGVAR(enableMissionIntro), true];
    private _enableMissionIntroSP = missionNamespace getVariable [QGVAR(enableMissionIntroSP), false];

    if((isMultiplayer && !didJIP && _enableMissionIntro) || (!isMultiplayer && _enableMissionIntroSP)) then {
        (QGVAR(missionIntro) call BIS_fnc_rscLayer) cutRsc ["RscA3CSIntroEffect", "PLAIN"];
    };
}, [], 1] call ace_common_fnc_waitAndExecute;

["SettingChanged", {
    params ["_option"];
    if(_option == QGVAR(enableColorCorrectionsEffect)) then {
        private _ppEnabled = missionNamespace getVariable [QGVAR(colorCorrectionsEnabled), false];
        if(!_ppEnabled) exitWith {};
        private _ppEffect = missionNamespace getVariable [QGVAR(colorCorrectionsEffect), []];
        private _ppEffect ppEffectEnable GVAR(enableColorCorrectionsEffect);
        private _ppEffect ppEffectCommit 0;
    };
}] call ace_common_fnc_addEventHandler;
