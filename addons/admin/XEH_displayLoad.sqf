#include "script_component.hpp"

disableSerialization;
params ["_displayClass", "_params"];
_params params ["_display"];

A3CS_LOGINFO_1("handleDisplayLoad: %1",_this)

_openAdminPanelButton = _display displayCtrl 5040;
private _access = "adminpanel" call FUNC(canAccessPanelModule);
if(!_access) then {_openAdminPanelButton ctrlShow false;};
