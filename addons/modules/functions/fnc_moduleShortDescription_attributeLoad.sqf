#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN moduleShortDescription attributeLoad handler
 */

private _controlGroup = _this;
private _controlDescGroup = _controlGroup controlsGroupCtrl 101;
private _controlTitle = _controlDescGroup controlsGroupCtrl 100;
private _controlDesc = _controlDescGroup controlsGroupCtrl 102;

private _configHierarchy = configHierarchy _config;
private _moduleConfig = _configHierarchy select (count _configHierarchy - 3);

private _title = getText (_moduleConfig >> "displayName");
private _description = getText (_moduleConfig >> QGVAR(moduleDescription) >> "shortDescription");

// Hide short description by default in case there's no short description defined
private _groupHeights = [0,0];

if (_description isNotEqualTo "") then {
  _controlTitle ctrlSetText _title;
  _controlTitle ctrlcommit 0;
  private _titleHeight = (ctrlposition _controlTitle) # 3;

  _controlDesc ctrlSetStructuredText parseText _description;
  private _descriptionHeight = ctrlTextHeight _controlDesc;

  // Update description control height
  private _controlDescPos = ctrlPosition _controlDesc;
  _controlDescPos set [3, _descriptionHeight];
  _controlDesc ctrlSetPosition _controlDescPos;
  _controlDesc ctrlCommit 0;

  // Update group height with current description height
  private _groupHeight = _titleHeight + _descriptionHeight;
  _groupHeights = [
    _groupHeight,
    // + little bottom margin
    _groupHeight + (1 * 5 * (pixelH * pixelGrid *	0.50))
  ];
};

// Set new group height for all groups
{
  private _groupPos = ctrlPosition _x;
  _groupPos set [3, _groupHeights select _forEachIndex];
  _x ctrlSetPosition _groupPos;
  _x ctrlCommit 0;
} forEach [_controlDescGroup, _controlGroup];

// Save config reference in control group
_this setVariable [QGVAR(attributeConfig), _config];

// Add control group to controls list
GVAR(allAttributesControls) pushBack _this;
