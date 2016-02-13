#include "script_component.hpp"

params ["_target"];

private _cacheTime = _target getVariable [QGVAR(getUnitDataCacheTime), 0];
if((ace_time - _cacheTime) > 2 && {_cacheTime > 0}) exitWith {
    [
        (_target getVariable [QGVAR(getUnitDataCache_unitName), ""]),
        (_target getVariable [QGVAR(getUnitDataCache_unitRank), ""]),
        (_target getVariable [QGVAR(getUnitDataCache_unitIcon), ""]),
        (_target getVariable [QGVAR(getUnitDataCache_unitColorHex), ""]),
        (_target getVariable [QGVAR(getUnitDataCache_unitColorArma), []])
    ]
};

//unit name & rank
private _unitName = _target call EFUNC(common,getName);
private _unitRank = getText (configFile >> "CfgVehicles" >> typeof _target  >> QGVAR(rankname));
private _unitIcon = getText (configFile >> "CfgVehicles" >> typeof _target  >> QGVAR(rankicon));
if(_unitRank == "" || {_unitIcon == ""}) then {
    private _rank = rank _target;
    _unitRank = localize format [LSTRING(Rank_%1), _rank];
    _unitIcon = format ["\A3\ui_f\data\gui\cfg\Ranks\%1_gs.paa", _rank]
};

//unit color
private _unitColorHex = "";
private _unitColorArma = [];
if((group ace_player) isEqualTo (group _target)) then {
    //player group
    switch (tolower (assignedTeam _target)) do {
        case "red": {_unitColorHex = "#FF0000";_unitColorArma = [1,0,0,1];};
        case "green": {_unitColorHex = "#00DB04";_unitColorArma = [0,0.85,0.15,1];};
        case "blue": {_unitColorHex = "#1C7BFF";_unitColorArma = [0.1,0.48,1,1];};
        case "yellow" : {_unitColorHex = "#E0D422";_unitColorArma = [0.87,0.83,0.13,1];};
        default  {_unitColorHex = "#FFFFFF";_unitColorArma = [1,1,1,1];};
    };
} else {
    //other group
    _unitColorHex = "#DEDEDE";
    _unitColorArma = [0.87,0.87,0.87,1];
};

_target setVariable [QGVAR(getUnitDataCache_unitName), _unitName];
_target setVariable [QGVAR(getUnitDataCache_unitRank), _unitRank];
_target setVariable [QGVAR(getUnitDataCache_unitIcon), _unitIcon];
_target setVariable [QGVAR(getUnitDataCache_unitColorHex), _unitColorHex];
_target setVariable [QGVAR(getUnitDataCache_unitColorArma), _unitColorArma];
_target setVariable [QGVAR(getUnitDataCacheTime), ace_time];

[_unitName, _unitRank, _unitIcon, _unitColorHex, _unitColorArma]
