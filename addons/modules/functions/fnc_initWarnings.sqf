#include "script_component.hpp"
#include "\z\a3cs\addons\modules\controlDefines.hpp"
/*
 * Author: SzwedzikPL
 * Inits warnings for modules
 */

disableserialization;

private _display = findDisplay IDD_DISPLAY3DEN;
private _warningsTree = _display displayCtrl IDC_DISPLAY3DEN_PANELLEFT_WARNINGS_TREE;

LOG("Warnings init start.");

// Setup vars
GVAR(warningsEntities) = [];

// Setup namespaces
GVAR(allWarnings) = false call CBA_fnc_createNamespace;
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

// Add draw3D handler
if (isNil QGVAR(warnings3DDrawHandler)) then {
  GVAR(warnings3DDrawHandler) = addMissionEventHandler ["Draw3D", {
    private _selected = get3DENSelected "logic";
    private _mouseOver = get3DENMouseOver param [1, objNull];
    {
      private _entity = get3DENEntity _x;
      drawIcon3D [
        QPATHTOF(data\warning_entity_red.paa),
        [1, 1, 1, [0.85, 1] select ((_entity in _selected) || {_entity isEqualTo _mouseOver})],
        getPos _entity,
        1.5,
        1.5,
        0
      ];
    } forEach GVAR(warningsEntities);
  }];
};

LOG_1("Warnings init finished (entities: %1).",str count _modules);
