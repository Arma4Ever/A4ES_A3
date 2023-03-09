#include "script_component.hpp"

// Init system
if (isServer) then {
  [{
    0 call FUNC(initSystem);
  }, [], 5] call CBA_fnc_waitAndExecute;
};

if (hasInterface) then {
  player addEventHandler ["InventoryOpened", {
    params ["", "_container"];

    if (_container getVariable [QGVAR(isSimpleBody), false]) then {
      TRACE_1("InventoryOpened - simple body, enabling sim",_container);
      _container enableSimulation true;
    };
    false
  }];

  player addEventHandler ["InventoryClosed", {
    params ["", "_container"];

    if (_container getVariable [QGVAR(isSimpleBody), false]) then {
      TRACE_1("InventoryClosed - simple body, disabling sim",_container);
      _container enableSimulation false;
    };
  }];
};

