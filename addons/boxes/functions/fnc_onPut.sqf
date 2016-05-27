/*
 * Author: SzwedzikPL
 * Put event handler
 */
#include "script_component.hpp"

params ["_unit", "_container", "_item"];

if (!hasInterface || !local _unit) exitWith {};

if (typeOf _container == "GroundWeaponHolder") then {
    private _nearestBox = nearestObjects [_unit, ["ReammoBox_F"], 5];
    if (count _nearestBox > 0) then {
        private _result = false;
        private _targetBox = _nearestBox select 0;
        private _itemTypeInfo = _item call ace_common_fnc_getItemType;
        _itemTypeInfo params ["_itemType", "_itemDesc"];

        if (_itemDesc == "uniform" || _itemDesc == "vest") exitWith {};

        if (_itemType == "weapon") then {
            _result = [_targetBox, _item, 1, false] call CBA_fnc_addWeaponCargo;
        };
        if (_itemType == "magazine") then {
            _result = [_targetBox, _item, 1, false] call CBA_fnc_addMagazineCargo;
        };
        if (_itemType == "item") then {
            _result = [_targetBox, _item, 1, false] call CBA_fnc_addItemCargo;
        };

        if (_result) then {
            if (_itemType == "weapon") then {
                _result = [_container, _item, 1] call CBA_fnc_removeWeaponCargo;
            };
            if (_itemType == "magazine") then {
                _result = [_container, _item, 1] call CBA_fnc_removeMagazineCargo;
            };
            if (_itemType == "item") then {
                _result = [_container, _item, 1] call CBA_fnc_removeItemCargo;
            };
        };
    };
};
