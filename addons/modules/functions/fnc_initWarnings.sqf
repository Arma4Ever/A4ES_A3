#include "script_component.hpp"
#include "\z\a3cs\addons\modules\controlDefines.hpp"
/*
 * Author: SzwedzikPL
 * Inits warnings for modules
 */

disableserialization;

private _display = findDisplay IDD_DISPLAY3DEN;
private _warningsTree = _display displayCtrl IDC_DISPLAY3DEN_PANELLEFT_WARNINGS_TREE;

INFO("Warnings init start.");
BEGIN_COUNTER(GVAR(initWarnings));

// Setup vars
GVAR(warningsEntities) = [];

// Setup namespaces
GVAR(warningsData) = false call CBA_fnc_createNamespace;
GVAR(validatorsCache) = false call CBA_fnc_createNamespace;

// Clear warnings tree
tvClear _warningsTree;

// Update warnings tab UI in case of there are no supported modules
call FUNC(updateWarningsTabUI);

// Run init on all modules
private _modules = all3DENEntities # 3;

{
  _x call FUNC(handleModuleInit);
} forEach _modules;

END_COUNTER(GVAR(initWarnings));
INFO_1("Warnings init finished (entities: %1).",str count _modules);
