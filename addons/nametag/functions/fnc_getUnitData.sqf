/*
 * Author: SzwedzikPL
 * Get unit identity (name & rank)
 */
#include "script_component.hpp"

params ["_target"];

private _cacheTime = _target getVariable [QGVAR(getUnitDataCacheTime), 0];
if ((CBA_missionTime - _cacheTime) < 4 && {_cacheTime > 0}) exitWith {
    _target getVariable [QGVAR(getUnitDataCacheData), []]
};

//unit name & rank
private _unitName = _target call EFUNC(common,getName);
private _unitRank = _target getVariable [QGVAR(rankname), ""];
private _unitIcon = _target getVariable [QGVAR(rankicon), ""];
if (_unitRank == "" || {_unitIcon == ""}) then {
    _unitRank = getText (configFile >> "CfgVehicles" >> typeof _target  >> QGVAR(rankname));
    _unitIcon = getText (configFile >> "CfgVehicles" >> typeof _target  >> QGVAR(rankicon));
    if (_unitRank == "" || {_unitIcon == ""}) then {
        private _rank = rank _target;
        _unitRank = localize format [LSTRING(Rank_%1), _rank];
        _unitIcon = format ["\A3\ui_f\data\gui\cfg\Ranks\%1_gs.paa", _rank];
    };
};

//unit color
private _colorArray = if ((group ace_player) isEqualTo (group _target)) then {
    //player group
    missionNameSpace getVariable [(format ["a3cs_nametag_colors_%1", (tolower assignedTeam _target)]), ["#FFFFFF", [1,1,1,1]]];
} else {
    ["#DEDEDE", [0.87,0.87,0.87,1]]
};

//map icon
private _isEOD = (_target call ace_common_fnc_isEOD) isEqualTo true;
private _isEngineer = (_target call ace_common_fnc_isEngineer) isEqualTo true;
private _isMedic = (_target call ace_medical_fnc_isMedic) isEqualTo true;
private _isLeader = ((leader _target) isEqualTo _target);
private _unitMapIcon = "\a3\ui_f\data\map\vehicleicons\iconman_ca.paa";
if (_isEOD) then {_unitMapIcon = "\a3\ui_f\data\map\vehicleicons\iconmanexplosive_ca.paa";};
if (_isEngineer) then {_unitMapIcon = "\a3\ui_f\data\map\vehicleicons\iconmanengineer_ca.paa";};
if (_isMedic) then {_unitMapIcon = "\a3\ui_f\data\map\vehicleicons\iconmanmedic_ca.paa";};
if (_isLeader) then {_unitMapIcon = "\a3\ui_f\data\map\vehicleicons\iconmanleader_ca.paa";};


private _returnArray = [_unitName, _unitRank, _unitIcon];
_returnArray append _colorArray;
_returnArray pushBack _unitMapIcon;

_target setVariable [QGVAR(getUnitDataCacheData), _returnArray];
_target setVariable [QGVAR(getUnitDataCacheTime), CBA_missionTime];

_returnArray
