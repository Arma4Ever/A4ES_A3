#include "script_component.hpp"

disableSerialization;
params ["_displayClass", "_params"];
_params params ["_display"];
TRACE_2("handleDisplayLoad",_displayClass,_display);

_openAdminPanelButton = _display displayCtrl 5040;
private _access = "adminpanel" call FUNC(canAccessPanelModule);
if (!_access) then {_openAdminPanelButton ctrlShow false;};
