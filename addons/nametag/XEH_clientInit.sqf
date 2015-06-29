#include "script_component.hpp"

if (!hasInterface) exitWith {};

a3cs_adminColor = {
    _name = _this select 0;
    _admincolor = "";
    switch(true) do {
        case (_name in A3CSS_ADMIN) : {_admincolor = "color='#ca1111'";};
        case (_name in A3CSS_OFICER) : {_admincolor = "color='#1A75FF'";};
        case (_name in A3CSS_DOWODCA) : {_admincolor = "color='#ffc000'";};
        case (_name in A3CSS_INSTRUKTOR) : {_admincolor = "color='#8756db'";};
        default {};
    };
    _admincolor
};
a3cs_rankTag = {
    _rankid = _this select 0;
    _unit = _this select 1;
    _ranktag = "";

    _ranktag = getText (configFile >> "CfgVehicles" >> typeof _unit  >> "a3cs_nametag_rankname");
    if(_ranktag == "") then {
        switch (_rankid) do {
            case 0 : {_ranktag = "Szeregowy";};
            case 1 : {_ranktag = "Kapral";};
            case 2 : {_ranktag = "Sierzant";};
            case 3 : {_ranktag = "Podporucznik";};
            case 4 : {_ranktag = "Kapitan";};
            case 5 : {_ranktag = "Major";};
            case 6 : {_ranktag = "Pulkownik";};
            default  {};
        };
    };
    _ranktag
};
a3cs_rankImg = {
    _rankid = _this select 0;
    _unit = _this select 1;
    _rankimg = "";

    _rankimg = getText (configFile >> "CfgVehicles" >> typeof _unit  >> "a3cs_nametag_rankicon");
    if(_rankimg == "") then {
        switch (_rankid) do {
            case 0 : {_rankimg = "\A3\ui_f\data\gui\cfg\Ranks\private_gs.paa";};
            case 1 : {_rankimg = "\A3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa";};
            case 2 : {_rankimg = "\A3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa";};
            case 3 : {_rankimg = "\A3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa";};
            case 4 : {_rankimg = "\A3\ui_f\data\gui\cfg\Ranks\captain_gs.paa";};
            case 5 : {_rankimg = "\A3\ui_f\data\gui\cfg\Ranks\major_gs.paa";};
            case 6 : {_rankimg = "\A3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa";};
            default  {};
        };
    };
    _rankimg
};

//---- CursorTarget
0 spawn {
    sleep 5;
    if(isNil ("A3CSS_ADMIN")) then {A3CSS_ADMIN=[];};
    if(isNil ("A3CSS_OFICER")) then {A3CSS_OFICER=[];};
    if(isNil ("A3CSS_DOWODCA")) then {A3CSS_DOWODCA=[];};
    if(isNil ("A3CSS_INSTRUKTOR")) then {A3CSS_INSTRUKTOR=[];};
    _bandana = "";
    switch(true) do {
        case ((name ace_player) in A3CSS_ADMIN) : {_bandana = "maska_admin";};
        case ((name ace_player) in A3CSS_OFICER) : {_bandana = "maska_oficer";};
        case ((name ace_player) in A3CSS_DOWODCA) : {_bandana = "maska_dowodca";};
        case ((name ace_player) in A3CSS_INSTRUKTOR) : {_bandana = "maska_instruktor";};
        default {};
    };
    if(GVAR(addFunctionUnitsItems) && _bandana != "") then {
        if(goggles ace_player == "") then {
            ace_player addGoggles _bandana;
        } else {
            ace_player addItem _bandana;
        };
    };
    0 spawn {
        disableSerialization;
        while {true} do {
            sleep 0.2;
            if(cursorTarget iskindof "CAManBase") then {
                _unit = cursorTarget;
                if(_unit != ace_player && (side _unit == side ace_player) && (ace_player distance _unit)<=10 && (isPlayer _unit || !isMultiplayer) && (vehicle _unit == _unit) && alive _unit && !(_unit getVariable ["ACE_isUnconscious", false])) then {
                    private["_ui","_nmtag","_name","_ranktag","_rankimg","_imgsrc","_admincolor"];
                    _name = name _unit;
                    _ranktag = [rankId _unit, _unit] call a3cs_rankTag;
                    _rankimg = [rankId _unit, _unit] call a3cs_rankImg;
                    _admincolor = [_name] call a3cs_adminColor;
                    if(_rankimg != "") then {_imgsrc = format ["<img size='1.0' image='%1'/>",_rankimg];};
                    3000 cutRsc ["NameTag","PLAIN"];
                    _ui = uiNameSpace getVariable "NameTag";
                    _nmtag = _ui displayCtrl 3600;
                    _nmtag ctrlSetStructuredText parseText format ["<t %4 size='1.2'>%1</t><br/><t color='#b5f279' size='0.8'>%2</t>%3",_name,_ranktag,_imgsrc,_admincolor];
                    _nmtag ctrlCommit 0;
                };
            };
        };
    };
};

//---- 3D
0 spawn {
    GVAR(nt3d_lastTimeSearchedPlayers) = -1;
    GVAR(nt3d_players) = [];

    addMissionEventHandler ["Draw3D", {
        if(alive ace_player && freeLook && (vehicle ace_player == ace_player)) then {
            if (ACE_diagTime > GVAR(nt3d_lastTimeSearchedPlayers) + 0.5) then {
                GVAR(nt3d_players) = nearestObjects [ace_player, ["CAManBase"], 20];
                GVAR(nt3d_lastTimeSearchedPlayers) = ACE_diagTime;
            };
            {
                _unit = _x;
                if(_unit != ace_player && (side _unit == side ace_player) && (isPlayer _unit || !isMultiplayer) && (vehicle _unit == _unit) && alive _unit && !(_unit getVariable ["ACE_isUnconscious", false])) then {
                    _name = name _unit;
                    _color = [0.71,0.94,0.475,1];
                    _rank = [rankId _unit, _unit] call a3cs_rankTag;
                    switch(true) do {
                        case (_name in A3CSS_ADMIN) : {_color = [0.80,0.06,0.06,1];};
                        case (_name in A3CSS_OFICER) : {_color = [0.1,0.49,1,1];};
                        case (_name in A3CSS_DOWODCA) : {_color = [1,0.75,0,1];};
                        case (_name in A3CSS_INSTRUKTOR) : {_color = [0.53,0.33,0.85,1];};
                        default {};
                    };

                    _dis = player distance _unit;
                    _h1 = 2+((_dis/5)*0.1); //name
                    _h2 = 2+((_dis/5)*0.2); //rank

                    drawIcon3D [
                        "",
                        _color,
                        [
                           (visiblePosition _unit) select 0,
                           (visiblePosition _unit) select 1,
                           _h1
                        ],
                        0,
                        0,
                        0,
                        name _unit,
                        2,
                        0.04,
                        "PuristaLight"
                    ];
                    drawIcon3D [
                        "",
                        [1,1,1,1],
                        [
                            (visiblePosition _unit) select 0,
                            (visiblePosition _unit) select 1,
                            _h2
                        ],
                        0,
                        0,
                        0,
                        _rank,
                        2,
                        0.03,
                        "PuristaLight"
                    ];
                };
            } forEach GVAR(nt3d_players);
        };
    }];
};