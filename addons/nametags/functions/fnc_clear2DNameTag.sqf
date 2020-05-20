#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Clears drawn 2D Name Tag
 */

if (!isNull GVAR(last2DCursorTarget)) then {
  QGVAR(2DNameTag) cutFadeOut NAMETAG_2D_FADE_OUT;
  GVAR(last2DCursorTarget) = objNull;
};
