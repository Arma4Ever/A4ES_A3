#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles init of module entity
 */

params ["_module"];

// Add ConnectionChanged3DEN handler
_module addEventHandler ["ConnectionChanged3DEN", {
    params ["_module"];
    INFO_2("Module '%1' (ID: %2) ConnectionChanged3DEN.",typeof _module,str get3DENEntityID _module);
    _module call FUNC(validateEntity);
}];

// Add RegisteredToWorld3DEN handler
_module addEventHandler ["RegisteredToWorld3DEN", {
    params ["_module"];
    INFO_2("Module '%1' (ID: %2) RegisteredToWorld3DEN.",typeof _module,str get3DENEntityID _module);
    // Setup initial module variables because tmp vars are lost during unregistration
    _moduleValues = _module call FUNC(setupInitialModuleVars);

    // Validate module
    [_module, _moduleValues] call FUNC(validateEntity);
}];

// Add UnregisteredFromWorld3DEN handler
_module addEventHandler ["UnregisteredFromWorld3DEN", {
   params ["_module"];
   // Use cached entityID, on UnregisteredFromWorld3DEN get3DENEntityID returns -1
   private _entityID = _module getVariable QGVAR(entityID);
   _module call FUNC(setupInitialModuleValues);

   INFO_2("Module '%1' (ID: %2) UnregisteredFromWorld3DEN.",typeof _module,str _entityID);
   // Clear module warnings
   [_module, []] call FUNC(setEntityWarnings);
}];

// Setup initial module variables
private _moduleValues = _module call FUNC(setupInitialModuleVars);

// Validate module
[_module, _moduleValues] call FUNC(validateEntity);
