#include "script_component.hpp"

if (GVAR(systemEnabled)) then {
  0 call (compile (preprocessFileLineNumbers '\WebKnight_StarWars_Mechanic\bootstrap\XEH_postInit.sqf'));

  0 spawn {
    sleep 0.1;
    systemChat LLSTRING(Log_SystemEnabled);
  }
};
