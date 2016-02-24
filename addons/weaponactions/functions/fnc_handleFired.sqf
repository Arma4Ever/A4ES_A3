/*
 * Author: SzwedzikPL
 * Handler for local fired EH
 */
#include "script_component.hpp"

params ["_unit", "_weapon", "_muzzle"];

if(!local _unit) exitWith {};
if(!isNull objectParent _unit) exitWith {};

private _boltAnimEnabled = missionNamespace getVariable [format ["%1_%2", QGVAR(boltAnimEnabled), _weapon], -1];

//first use, get data and cache it
if(_boltAnimEnabled isEqualType 0) then {
    _boltAnimEnabled = (getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(boltAnim))) > 0;
    missionNamespace setVariable [format ["%1_%2", QGVAR(boltAnimEnabled), _weapon], _boltAnimEnabled];
    if(_boltAnimEnabled) then {
        private _blockAnimInOpticCache = (getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(blockAnimInOptic))) > 0;
        private _soundEffectCache = getText (configFile >> "CfgWeapons" >> _weapon >> QGVAR(soundEffect));
        private _boldAnimTypeCache = getText (configFile >> "CfgWeapons" >> _weapon >> QGVAR(boltAnimType));
        private _boldAnimClassCache =  getText (configFile >> QGVAR(boltAnimTypes) >> _boldAnimTypeCache >> "anim");
        private _boltAnimCacheData = [_boldAnimClassCache, _blockAnimInOpticCache, _soundEffectCache];
        missionNamespace setVariable [format ["%1_%2", QGVAR(boltAnimCache), _weapon], _boltAnimCacheData];
    };
};


if(_boltAnimEnabled) then {
    private _boltAnimCacheData = missionNamespace getVariable [format ["%1_%2", QGVAR(boltAnimCache), _weapon], []];
    _boltAnimCacheData params ["_boltAnimClass", "_blockAnimInOptic", "_soundEffect"];
    if(_boltAnimClass != "") then {
        if(_blockAnimInOptic) then {
            [{

                params ["_params", "_pfhid"];
                _params params ["_unit", "_weaponReloadingTime", "_boltAnimClass", "_soundEffect"];
                _unit setWeaponReloadingTime _weaponReloadingTime;
                if(tolower cameraView != "gunner") then {
                    _unit playAction _boltAnimClass;
                    if(_soundEffect != "") then {playSound _soundEffect;};
                    [_pfhid] call CBA_fnc_removePerFrameHandler;
                };
            }, 0, [_unit, [_unit, _muzzle, 1], _boltAnimClass, _soundEffect]] call CBA_fnc_addPerFrameHandler;
        } else {
            _unit playAction _boltAnimClass;
            if(_soundEffect != "") then {playSound _soundEffect;};
        };
    };
};

/*
//waitUntil {(_this select 0) setWeaponReloadingTime [(_this select 0),(_this select 2),1];(inputAction "DefaultAction" == 0)};
//(_this select 0) playAction 'RHS_GestureRechamberM590';
*/
