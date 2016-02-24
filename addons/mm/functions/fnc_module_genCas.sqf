/*
 * Author: SzwedzikPL
 * genCAS module function
 */
#include "script_component.hpp"

if(!isServer) exitWith {true};
params [["_mode", "", [""]], ["_input", [], [[]]]];

// Module - init
if(_mode == "init") then {
    _input params [["_logic", objNull, [objNull]], ["_isActivated", false, [false]], ["_isCuratorPlaced", false, [false]]];
    if(isNull _logic || !_isActivated) exitWith {true};
    if(!(_logic call FUNC(canExecuteModule))) exitWith {A3CS_LOGWARN("genCAS: blokuje wykonanie modulu")true};

    //Load module params
    private _place = _logic getVariable ["place", ""];
    private _planeClass = _logic getVariable ["plane", ""];
    private _attackType = parseNumber (_logic getVariable ["type", "0"]);
    private _planeDir = _logic getVariable ["planeDir", 0];
    private _side = call compile (_logic getVariable ["side", "west"]);
    private _weaponIndex = _logic getVariable ["weaponIndex", 0];

    private _planeCfg = (configfile >> "cfgvehicles" >> _planeClass);
    if(!isMultiplayer && !isclass _planeCfg) exitwith {systemchat format ["genCas - nieprawidlowa klasa samolotu %1", _planeClass];true};

    //--- Detect gun
    _weaponTypes = switch _attackType do {
        case 0: {["machinegun"]};
        case 1: {["missilelauncher"]};
        case 2: {["machinegun","missilelauncher"]};
        case 3: {["bomblauncher"]};
        case 4: {["bomblauncher"]};
        default {[]};
    };
    private _weapons = [];
    private _wepIndex = 0;
    {
        if((tolower ((_x call bis_fnc_itemType) select 1) in _weaponTypes)) then {
            private _modes = getarray (configfile >> "cfgweapons" >> _x >> "modes");
            if (count _modes > 0) then {
                if((((_attackType in [3,4]) && (count _weapons) == 0) && _attackType != 3) || (_wepIndex == _weaponIndex || _attackType == 2)) then {
                    _mode = _modes select 0;
                    if (_mode == "this") then {_mode = _x;};
                    _weapons set [count _weapons, [_x, _mode]];
                };
                _wepIndex = _wepIndex + 1;
            };
        };
    } foreach (getArray (_planeCfg >> "weapons"));

    if(!isMultiplayer && count _weapons == 0) exitwith {systemChat format ["genCas - Brak wskazanego uzbrojenia w samolotcie %1",_planeClass];true};

    //--- Generate pos
    private _posATL = getMarkerPos _place;
    private _pos = +_posATL;
    _pos set [2, (_pos select 2) + getterrainheightasl _pos];

    private _dis = 3000;
    private _alt = 1000;
    private _pitch = atan (_alt / _dis);
    private _speed = 400 / 3.6;
    private _duration = ([0,0] distance [_dis,_alt]) / _speed;

    //--- Create plane
    private _planePos = _pos getPos [_dis,_planeDir + 180];
    _planePos set [2,(_pos select 2) + _alt];
    private _planeArray = [_planePos, _planeDir, _planeClass, _side] call bis_fnc_spawnVehicle;
    private _plane = _planeArray select 0;
    _plane setposasl _planePos;
    _plane move (_pos getPos [_dis, _planeDir]);
    _plane disableai "move";
    _plane disableai "target";
    _plane disableai "autotarget";
    _plane setcombatmode "blue";

    private _vectorDir = _planePos vectorDiff _pos;
    private _velocity = _vectorDir vectorMultiply _speed;
    _plane setvectordir _vectorDir;
    [_plane, -90 + atan (_dis / _alt), 0] call bis_fnc_setpitchbank;
    private _vectorUp = vectorup _plane;

    //--- Remove all other weapons
    private _currentWeapons = weapons _plane;
    {
        if (!(tolower ((_x call bis_fnc_itemType) select 1) in (_weaponTypes + ["countermeasureslauncher"]))) then {_plane removeweapon _x;};
    } foreach _currentWeapons;

    if(!isMultiplayer) then {
        systemChat "genCas - Rozpoczynam nalot";
        _plane spawn {
            private "_marker";
            private _marker = createMarkerLocal [str _this, getPos _this];
            _marker setMarkerTypeLocal "c_plane";
            _marker setMarkerColorLocal "Color"+(str side _this);
            _marker setMarkerSizeLocal [0.8, 0.8];
            while {alive _this} do {
                _marker setMarkerDirLocal (getDir _this);
                _marker setMarkerPosLocal (getPos _this);
                sleep 0.1;
            };
            deleteMarkerLocal _marker;
        };
    };

    //--- Approach
    private _fire = [] spawn {waituntil {false}};
    private _fireNull = true;
    private _time = time;
    private _offset = if ({_x == "missilelauncher"} count _weaponTypes > 0) then {20} else {0};
    _offset = if ({_x == "bomblauncher"} count _weaponTypes > 0) then {185} else {_offset};
    //_offset = if (({_x == "bomblauncher"} count _weaponTypes > 0) && (_planeClass in ["IVORY_MIG29","su34_PL","su34"])) then {405} else {_offset}; //PAM
    //_offset = if (({_x == "bomblauncher"} count _weaponTypes > 0) && (_planeClass in ["LIB_P47","LIB_Ju87","LIB_FW190F8","LIB_P39","LIB_Pe2"])) then {325} else {_offset}; //IF

    if(_attackType == 4) then {_offset = _offset + 5;};

    private _fireProgress = 0;

    waituntil {
        _fireProgress = _plane getvariable ["fireProgress", 0];

        //--- Set the plane approach vector
        _plane setVelocityTransformation [
            _planePos, [_pos select 0,_pos select 1,(_pos select 2) + _offset + _fireProgress * 12],
            _velocity, _velocity,
            _vectorDir, _vectorDir,
            _vectorUp, _vectorUp,
            (time - _time) / _duration
        ];
        _plane setvelocity (velocity _plane);

        //--- Fire!
        if ((getposasl _plane) distance _pos < 1000 && _fireNull) then {
            _fireNull = false;
            terminate _fire;
            _fire = [_plane, _weapons, _weaponTypes, _attackType] spawn {
                params ["_plane", "_weapons", "_weaponTypes", "_attackType"];

                private _planeDriver = driver _plane;
                private _duration = 3;
                private _time = time + _duration;
                private _sleepTime = if({_x == "bomblauncher"} count _weaponTypes > 0) then {0.2} else {0.1};
                private _shotlimit = if(_attackType == 4) then {1} else {99999};
                private _shots = 0;

                if(!isMultiplayer) then {systemChat "genCAS - rozpoczynam ostrzal";};

                waituntil {
                    {
                        if(_shots < _shotlimit) then {
                            _planeDriver forceweaponfire _x;
                            _shots = _shots + 1;
                        };
                    } foreach _weapons;
                    _plane setvariable ["fireProgress", (1 - ((_time - time) / _duration)) max 0 min 1];
                    sleep _sleepTime;
                    time > _time || !alive _plane
                };
                sleep 1;
            };
        };

        sleep 0.01;
        scriptdone _fire || !alive _plane
    };
    _plane setvelocity (velocity _plane);
    _plane flyinheight _alt;
    sleep 1;

    if(alive _plane) then {
        if(!isMultiplayer) then {systemChat "genCas - koniec nalotu";};
        //flares
        _plane spawn {
            for "_x" from 1 to 10 do {
                if(!alive _this) exitWith {true};
                 (driver _this) forceweaponfire ["CMFlareLauncher", "Single"];
                 sleep 3;
            };
        };
    };

    waituntil {(_plane distance _pos) > _dis || !alive _plane};

    //--- Delete plane
    if (alive _plane) then {
        private _group = group _plane;
        private _crew = crew _plane;
        deletevehicle _plane;
        {deletevehicle _x} foreach _crew;
        deletegroup _group;

        if(!isMultiplayer) then {systemChat "genCas - koniec lotu";};
    };

    //Set as disposable if possible
    _logic call FUNC(setDisposable);
};
// EDEN - When some attributes were changed (including position and rotation)
if(_mode == "attributesChanged3DEN") then {};
// EDEN - When added to the world (e.g., after undoing and redoing creation)
if(_mode == "registeredToWorld3DEN") then {};
// When removed from the world (i.e., by deletion or undoing creation)
if(_mode == "unregisteredFromWorld3DEN") then {};
// EDEN - When connection to object changes (i.e., new one is added or existing one removed)
if(_mode == "connectionChanged3DEN") then {};

true
