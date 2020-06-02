#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

ADDON = true;

if (is3DEN) then {
  call FUNC(initWarnings);

  ["Module_F", "init", {
    _this call FUNC(handleModuleInit);
  }, true, [], false] call CBA_fnc_addClassEventHandler;
};
