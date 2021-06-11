#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Init for 3DEN assets tree filtering
 */

waitUntil {
  (!isNull (findDisplay 313)) && !(isNil QGVAR(assetsTreeFilterLoop))
};

LOG("initAssetsTreeFiltering");

if !(isNull GVAR(assetsTreeFilterLoop)) exitWith {};

LOG("initAssetsTreeFiltering: starting tree filer loop");

GVAR(assetsTreeFilterLoop) = 0 spawn {
  0 spawn FUNC(updateCurrentAssetsTree);
  while {true} do {
    private _tree = uiNamespace getVariable [QGVAR(currentAssetsTree), controlNull];
    if !(isNull _tree) then {
      private _count = _tree tvCount [];
      if (_count != GVAR(currentAssetsTreeCount)) then {
        TRACE_2("Refilering assets tree",GVAR(currentAssetsTreeCount),_count);
        private _indexes = [];
        for "_i" from 0 to (_count-1) do {
          if ((_tree tvText [_i]) isEqualTo "-") then {
            _indexes pushBack _i;
          };
        };
        reverse _indexes;
        {_tree tvDelete [_x]} forEach _indexes;
        GVAR(currentAssetsTreeCount) = _tree tvCount [];
      };
    };
  };
};
