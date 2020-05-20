#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns unit rank & icon
 */

 params ["_unit"];

 private _rankName = _unit getVariable [QGVAR(rankName), ""];
 private _rankIcon = _unit getVariable [QGVAR(rankIcon), ""];

 if (_rankName == "") then {
   private _rankClass = _unit getVariable [
     QGVAR(rank),
     getText (configFile >> "CfgVehicles" >> typeof _unit >> QGVAR(rank))
   ];

   // Parse rank class
   if (_rankClass != "") then {
     private _rankConfig = configFile >> QGVAR(ranks) >> _rankClass;
     if !(isClass _rankConfig) exitWith {};

     _rankName = getText (_rankConfig >> 'name');
     _rankIcon = getText (_rankConfig >> 'icon');
   };

   // If no rank class or wrong class
   if (_rankName == "") then {
     // TODO: DROP THIS WHEN ALL MODS SWITCH TO NEW SOLUTION
     // No rank class, fallback to legacy rank vars
     private _unitCfg = configFile >> "CfgVehicles" >> typeof _unit;
     _rankName = getText (_unitCfg >> "a3cs_nametag_rankname");
     _rankIcon = getText (_unitCfg >> "a3cs_nametag_rankicon");

     // If still no rank data, fallback to vanilla ranks
     if (_rankName == "") then {
       private _rank = rank _unit;
       _rankName = localize format [LSTRING(%1), _rank];
       _rankIcon = format ["a3\UI_F\data\GUI\Cfg\Ranks\%1_gs.paa", _rank];
     };
   };

   // Save rank name & icon
   _unit setVariable [QGVAR(rankName), _rankName];
   _unit setVariable [QGVAR(rankIcon), _rankIcon];
 };

[_rankName, _rankIcon]
