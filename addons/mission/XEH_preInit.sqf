#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (hasInterface) then {
  // Add fix invisible gear pause menu option
  [[LLSTRING(fixInvisibleGear), LLSTRING(fixInvisibleGear_Tooltip)], QGVAR(invisibleGearFix)] call CBA_fnc_addPauseMenuOption;
  GVAR(fixingInvisibleGear) = false;
};

if (isServer) then {
  {
    [_x, "GetOut", {
      [{
        _this call FUNC(handleGetOut);
      }, _this] call CBA_fnc_execNextFrame;
    }, true, [], true] call CBA_fnc_addClassEventHandler;
  } forEach ["Plane", "Helicopter", "Car", "Tank", "Ship", "StaticWeapon"];
};

ADDON = true;
