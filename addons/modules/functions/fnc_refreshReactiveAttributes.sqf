#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates reactive attributes UI
 */

INFO_1("Refreshing reactive attributes started (attributes: %1).",str count GVAR(reactiveAttributes));

{
  private _controlGroup = _x;
  private _condition = _controlGroup getVariable QGVAR(conditionActive);
  private _state = (GVAR(dynamicAttributesValues) call _condition) isEqualTo true;

  LOG_3("Refreshing reactive attribute '%1' (condition: '%2' active: %3).",ctrlClassName _controlGroup,str _condition,str _state);

  private _fade = [0.75, 0] select _state;

  _controlGroup ctrlEnable _state;
  _controlGroup ctrlSetFade _fade;
  _controlGroup ctrlcommit 0;
} forEach GVAR(reactiveAttributes);

INFO("Refreshing reactive attributes finished.");
