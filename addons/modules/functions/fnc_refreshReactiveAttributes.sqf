#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Updates reactive attributes UI
 */

{
  private _controlGroup = _x;
  private _condition = _controlGroup getVariable QGVAR(activeCondition);
  private _state = GVAR(dynamicAttributesValues) call _condition;
  private _fade = [0.75, 0] select _state;

  _group ctrlEnable _state;
  _group ctrlSetFade _fade;
  _group ctrlcommit 0;
} forEach GVAR(reactiveAttributes);
