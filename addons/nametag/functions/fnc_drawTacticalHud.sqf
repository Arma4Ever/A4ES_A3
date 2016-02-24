/*
 * Author: SzwedzikPL
 * Draw tactical hud on screen (triggered by map draw EH)
 */
#include "script_component.hpp"

//BEGIN_COUNTER(drawTacticalHud);

//Hide hud if nessesary
if(visibleMap || {isNull ace_player} || {!alive ace_player} || {!isNull curatorCamera} || {GVAR(displayInterrupt)} || {EGVAR(admin,debugCameraEnabled)}) exitWith {
    if(!GVAR(tacticalHudHidden)) then {
        {_x ctrlSetPosition [0, 0, 0, 0];_x ctrlCommit 0;} foreach [
            uiNamespace getVariable [QGVAR(tacticalHudRadar), controlNull],
            uiNamespace getVariable [QGVAR(tacticalHudRadarBackground), controlNull],
            uiNamespace getVariable [QGVAR(tacticalHudListOne), controlNull],
            uiNamespace getVariable [QGVAR(tacticalHudListTwo), controlNull],
            uiNamespace getVariable [QGVAR(tacticalHudListThree), controlNull]
        ];
        GVAR(tacticalHudHidden) = true;
    };
};

//Show hud if hidden
if(GVAR(tacticalHudHidden)) then {
    private _controls = [
        [uiNamespace getVariable [QGVAR(tacticalHudRadar), controlNull], uiNamespace getVariable [QGVAR(tacticalHudRadarPosition), [0,0,0,0]]],
        [uiNamespace getVariable [QGVAR(tacticalHudRadarBackground), controlNull], uiNamespace getVariable [QGVAR(tacticalHudRadarBackgroundPosition), [0,0,0,0]]],
        [uiNamespace getVariable [QGVAR(tacticalHudListOne), controlNull], uiNamespace getVariable [QGVAR(tacticalHudListOnePosition), [0,0,0,0]]],
        [uiNamespace getVariable [QGVAR(tacticalHudListTwo), controlNull], uiNamespace getVariable [QGVAR(tacticalHudListTwoPosition), [0,0,0,0]]],
        [uiNamespace getVariable [QGVAR(tacticalHudListThree), controlNull], uiNamespace getVariable [QGVAR(tacticalHudListThreePosition), [0,0,0,0]]]
    ];
    {
        _x params ["_control","_position"];
        _control ctrlSetPosition _position;
        _control ctrlCommit 0;
    } foreach _controls;
    GVAR(tacticalHudHidden) = false;
};

//refresh group data
if(ace_time - GVAR(tacticalHudGroupDataRefreshTime) > 2 || {GVAR(tacticalHudGroupDataRefreshTime) isEqualTo 0}) then {
    GVAR(tacticalHudGroupData) = [];
    {
        private _unit = _x;
        private _unitData = _unit call DFUNC(getUnitData);
        _unitData params ["_unitName", "", "", "_unitColorHex", "_unitColorArma", "_unitMapIcon"];
        private _index = (GVAR(tacticalHudGroupData) pushBack [_unit, _unitColorArma, _unitMapIcon, _unitName, _unitColorHex]);
        if(_unit isEqualTo ace_player) then {GVAR(tacticalHudGroupDataPlayerIndex) = _index};
    } forEach units ace_player;
    GVAR(tacticalHudGroupDataRefreshTime) = ace_time;

    //showlist if enabled
    if(GVAR(enableTacticalHudLists)) then {
        private _listControls = [
            uiNamespace getVariable [QGVAR(tacticalHudListOne), controlNull],
            uiNamespace getVariable [QGVAR(tacticalHudListTwo), controlNull],
            uiNamespace getVariable [QGVAR(tacticalHudListThree), controlNull]
        ];
        {_x ctrlSetText "";} foreach _listControls;
        private _oneListMaxCount = 6;
        private _allListsMaxCount = _oneListMaxCount * (count _listControls);
        private _listIndex = 0;
        private _lastListIndex = 0;
        private _listText = "";
        {
            if(_forEachIndex < _allListsMaxCount) then {
                _x params ["", "", "_unitMapIcon", "_unitName", "_unitColorHex"];
                _listIndex = (floor (_forEachIndex / _oneListMaxCount));
                if(!(_lastListIndex isEqualTo _listIndex)) then {
                    //Add text to list control and start new text list
                    (_listControls select _lastListIndex) ctrlSetStructuredText parseText _listText;
                    _listText = "";
                };
                _lastListIndex = _listIndex;
                _listText = format ["%1%2", _listText, format ["<img size='0.85' image='%1' color='%2'/><t size='0.85' color='%2'>%3</t><br/>", _unitMapIcon, _unitColorHex, _unitName]];
            };
        } foreach GVAR(tacticalHudGroupData);
        //add last collected data
        (_listControls select _lastListIndex) ctrlSetStructuredText parseText _listText;
    };
};

params ["_tacticalMap"];

private _mapSize = (ctrlPosition _tacticalMap) select 3;
private _iconSize = 70 * _mapSize;
private _maxDistance = _mapSize * 87.5;

_tacticalMap ctrlMapAnimAdd [0, 0.03, vehicle ace_player];
ctrlMapAnimCommit _tacticalMap;

private _playerData = GVAR(tacticalHudGroupData) select GVAR(tacticalHudGroupDataPlayerIndex);
_playerData params ["", "_playerColorArma", "_playerMapIcon"];

private _cameraDirVector = (positionCameraToWorld [0, 0, 1]) vectorDiff (positionCameraToWorld [0, 0, 0]);
private _cameraDir = (_cameraDirVector select 0) atan2 (_cameraDirVector select 1);
private _relativePlayerDir = (getDir ace_player) - _cameraDir;

//Draw player as a center of hud
_tacticalMap drawIcon [
    _playerMapIcon,
    _playerColorArma, //color
    (position vehicle ace_player), //pos
    _iconSize, //x
    _iconSize, //y
    _relativePlayerDir, //dir
    '', //text
    0 //text shadow
];

if(ace_time - GVAR(tacticalHudRadarUnitsCacheTime) > 1 || {GVAR(tacticalHudRadarUnitsCacheTime) isEqualTo 0}) then {
    GVAR(tacticalHudRadarUnitsCache) = [];
    {
        _x params ["_unit"];
        if(_unit distance ace_player <= _maxDistance && {!(_unit isEqualTo ace_player)}) then {
            GVAR(tacticalHudRadarUnitsCache) pushBack _x;
        };
    } forEach GVAR(tacticalHudGroupData);
    GVAR(tacticalHudRadarUnitsCacheTime) = ace_time;
};

{
    _x params ["_unit", "_unitColorArma", "_unitMapIcon"];

    private _staticDirTo = ace_player getDir _unit;
    private _unitDir = getDir _unit;
    private _distance = ace_player distance _unit;
    private _unitRelPos = ace_player getPos [_distance, (_staticDirTo - _cameraDir)];
    private _unitRelDir = _unitDir - _cameraDir;

    _tacticalMap drawIcon [
        _unitMapIcon, //icon
        _unitColorArma, //color
        _unitRelPos, //pos
        _iconSize, //x
        _iconSize, //y
        _unitRelDir, //dir
        '', //text
        0 //text shadow
    ];
} foreach GVAR(tacticalHudRadarUnitsCache);

//END_COUNTER(drawTacticalHud);

//DO TO: Show formation type
