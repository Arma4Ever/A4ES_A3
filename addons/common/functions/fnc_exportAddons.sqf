/*
 * Author: SzwedzikPL
 * Exports all loaded addons
 */
#include "script_component.hpp"

private _configs = "true" configClasses (configFile >> "CfgPatches");
{
    private _configName = configname _x;
    "ace_clipboard" callExtension format ["""%1"",", _configName];
} foreach _configs;
"ace_clipboard" callExtension "--COMPLETE--";
hint "gotowe";
