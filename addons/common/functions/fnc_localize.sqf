#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Returns localized string if string is localized
 */

if (isLocalized _this) then {
  localize _this
} else {
  _this
};
