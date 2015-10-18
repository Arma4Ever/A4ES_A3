#include "script_component.hpp"

params ["_target"];
private ["_unitName", "_unitRank", "_unitIcon", "_unitColorHex", "_unitColorArma", "_unitTeam"];

//unit name
_unitName = _target getVariable ["ACE_Name", name _target];

//unit rank name
_unitRank = getText (configFile >> "CfgVehicles" >> typeof _target  >> QGVAR(rankname));
if(_unitRank == "") then {
    switch (rankId _target) do {
        case 0 : {_unitRank = localize "STR_A3CS_Nametag_rank_0";};
        case 1 : {_unitRank = localize "STR_A3CS_Nametag_rank_1";};
        case 2 : {_unitRank = localize "STR_A3CS_Nametag_rank_2";};
        case 3 : {_unitRank = localize "STR_A3CS_Nametag_rank_3";};
        case 4 : {_unitRank = localize "STR_A3CS_Nametag_rank_4";};
        case 5 : {_unitRank = localize "STR_A3CS_Nametag_rank_5";};
        case 6 : {_unitRank = localize "STR_A3CS_Nametag_rank_6";};
        default  {};
    };
};

//unit rank icon
_unitIcon = getText (configFile >> "CfgVehicles" >> typeof _target  >> QGVAR(rankicon));
if(_unitIcon == "") then {
    switch (rankId _target) do {
        case 0 : {_unitIcon = "\A3\ui_f\data\gui\cfg\Ranks\private_gs.paa";};
        case 1 : {_unitIcon = "\A3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa";};
        case 2 : {_unitIcon = "\A3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa";};
        case 3 : {_unitIcon = "\A3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa";};
        case 4 : {_unitIcon = "\A3\ui_f\data\gui\cfg\Ranks\captain_gs.paa";};
        case 5 : {_unitIcon = "\A3\ui_f\data\gui\cfg\Ranks\major_gs.paa";};
        case 6 : {_unitIcon = "\A3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa";};
        default  {};
    };
};

//unit color
_unitColorHex = "";
_unitColorArma = [];
if((group ace_player) == (group _target)) then {
    //player group
    _unitTeam = assignedTeam _target;
    if(isNil "_unitTeam") then {
        _unitTeam = "main";
    } else {
        _unitTeam = tolower _unitTeam;
    };

    if(_unitTeam == "main") then {
        _unitColorHex = "#FFFFFF";
        _unitColorArma = [1,1,1,1];
    };
    if(_unitTeam == "red") then {
        _unitColorHex = "#FF0000";
        _unitColorArma = [1,0,0,1];
    };
    if(_unitTeam == "green") then {
        _unitColorHex = "#00DB04";
        _unitColorArma = [0,0.85,0.15,1];
    };
    if(_unitTeam == "blue") then {
        _unitColorHex = "#1C7BFF";
        _unitColorArma = [0.1,0.48,1,1];
    };
    if(_unitTeam == "yellow") then {
        _unitColorHex = "#E0D422";
        _unitColorArma = [0.87,0.83,0.13,1];
    };
} else {
    //other group
    _unitColorHex = "#DEDEDE";
    _unitColorArma = [0.87,0.87,0.87,1];
};

[_unitName, _unitRank, _unitIcon, _unitColorHex, _unitColorArma]
