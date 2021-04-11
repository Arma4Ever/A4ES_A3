#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns unit rank & icon
 */

 params ["_unit"];

 private _rankName = _unit getVariable [QGVAR(rankName), ""];
 private _rankIcon = _unit getVariable [QGVAR(rankIcon), ""];
 private _rankImportance = _unit getVariable [QGVAR(rankImportance), ""];

 if (_rankName == "") then {
   private _rankClass = _unit getVariable [
     QGVAR(rank),
     getText ((configOf _unit) >> QGVAR(rank))
   ];

   // Parse rank class
   if (_rankClass != "") then {
     private _rankConfig = configFile >> QGVAR(ranks) >> _rankClass;
     if !(isClass _rankConfig) exitWith {};

     _rankName = getText (_rankConfig >> 'name');
     _rankIcon = getText (_rankConfig >> 'icon');
     _rankImportance = getNumber (_rankConfig >> 'importance');
   };

   // If no rank class or wrong class
   if (_rankName == "") then {
     // TODO: DROP THIS WHEN ALL MODS SWITCH TO NEW SOLUTION
     // No rank class, fallback to legacy rank vars
     private _unitCfg = configOf _unit;
     _rankName = getText (_unitCfg >> "a3cs_nametag_rankname");
     _rankIcon = getText (_unitCfg >> "a3cs_nametag_rankicon");
     // From this point use vanilla rank importance
     _rankImportance = rankId _unit;

     // If still no rank data, fallback to vanilla ranks
     if (_rankName == "") then {
       private _rank = rank _unit;
       _rankName = localize format ["str_%1", _rank];
       _rankIcon = format ["a3\UI_F\data\GUI\Cfg\Ranks\%1_gs.paa", _rank];
     };
   };

   // Save rank name & icon
   _unit setVariable [QGVAR(rankName), _rankName];
   _unit setVariable [QGVAR(rankIcon), _rankIcon];
   _unit setVariable [QGVAR(rankImportance), _rankImportance];
 };

[_rankName, _rankIcon, _rankImportance]
