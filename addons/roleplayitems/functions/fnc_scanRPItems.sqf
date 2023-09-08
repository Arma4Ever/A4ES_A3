#include "script_component.hpp"

/*
 * Author: LinkIsGrim
 * Caches all item classnames
 */

private _list = [];

private _fnc_isRPItem = toString {
    getNumber (_x >> "A4ES_isRPItem") isEqualTo 1
};

{
    _list pushBack (configName _x);
} forEach (_fnc_isRPItem configClasses (configFile >> "CfgWeapons"));

uiNamespace setVariable [QGVAR(rpItems), compileFinal str (_list arrayIntersect _list)]