#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Resets all curators points
 */

{
  _x addCuratorPoints 1;
} forEach allCurators;
