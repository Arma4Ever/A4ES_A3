#include "script_component.hpp"

// Init system
if (isServer) then {
  [{
    0 call FUNC(initSystem);
  }, [], 5] call CBA_fnc_waitAndExecute;
};

if (hasInterface) then {
  // Temporarly enable simulation for all JIP simple bodies to fix corpse animation
  // For JIP, corpses with disabled simulation globally (by server) result in dead
  // units anim looking like alive units in prone stance
  0 spawn {
    private _simpleBodies = [];

    {
      if ((_x getVariable [QGVAR(isSimpleBody), false]) && {!(simulationEnabled _x)}) then {
        _x enableSimulation true;
        _simpleBodies pushBack _x;
      };
    } forEach allDead;
    sleep 3;
    {_x enableSimulation false} forEach _simpleBodies;
  };

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

