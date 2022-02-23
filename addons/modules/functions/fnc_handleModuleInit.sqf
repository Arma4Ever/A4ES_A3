#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles init of module entity
 */

params ["_module"];
TRACE_1("handleModuleInit",_module);

// Add ConnectionChanged3DEN handler
_module addEventHandler ["ConnectionChanged3DEN", {
    params ["_module"];
    LOG_2("Module '%1' (ID: %2) ConnectionChanged3DEN.",typeof _module,str get3DENEntityID _module);

    private _moduleValues = _module getVariable QGVAR(moduleValues);
    [_module, _moduleValues] call FUNC(validateEntity);
}];

// Add RegisteredToWorld3DEN handler
_module addEventHandler ["RegisteredToWorld3DEN", {
    params ["_module"];
    LOG_2("Module '%1' (ID: %2) RegisteredToWorld3DEN.",typeof _module,str get3DENEntityID _module);

    // Setup module variables because tmp vars are lost during unregistration
    _module spawn FUNC(updateModuleValues);
}];

// Add UnregisteredFromWorld3DEN handler
_module addEventHandler ["UnregisteredFromWorld3DEN", {
   params ["_module"];
   // Use cached entityID, on UnregisteredFromWorld3DEN get3DENEntityID returns -1
   private _entityID = _module getVariable QGVAR(entityID);

   LOG_2("Module '%1' (ID: %2) UnregisteredFromWorld3DEN.",typeof _module,str _entityID);
   // Clear module warnings
   [_module, []] call FUNC(setEntityWarnings);
}];

if (_module isKindOf QGVAR(objects3DENComp)) then {
  _module spawn {
    sleep 0.001;
    ["registeredToWorld3DEN", [_this]] call FUNC(objects3DENComp_module);
  };
};

// Setup module variables
_module spawn {
  _this call FUNC(updateModuleValues);
};
