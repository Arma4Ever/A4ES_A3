#include "script_component.hpp"

if (!isNil "ace_markers_MarkersCache") then {
  private _orgCache = ace_markers_MarkersCache;
  private _newCache = [
    ace_markers_MarkersCache,
    [[
      "hd_Contact_dot5",
      "hd_Contact_circle4",
      "hd_objective",
      "hd_arrow",
      "hd_Contact_arrowSmall2",
      "hd_ambush",
      "hd_Contact_pencilTask1",
      "hd_Contact_dashedLine3",
      "mil_triangle",
      "loc_mine",
      "o_inf",
      "o_motor_inf",
      "o_mech_inf",
      "o_armor",
      "o_art",
      "o_antiair"
    ]],
    {_input0 find (_x # 3)},
    "ASCEND",
    {(_x # 3) in _input0}
  ] call BIS_fnc_sortBy;

  private _indexMap = _newCache apply {
    private _class = _x # 3;
    _orgCache findIf {(_x # 3) == _class}
  };

  ace_markers_MarkersCache = _newCache;
  ace_markers_MarkersCacheIndMap = _indexMap;
};
