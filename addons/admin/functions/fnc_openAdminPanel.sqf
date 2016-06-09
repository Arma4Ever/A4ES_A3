/*
 * Author: SzwedzikPL
 * Open admin panel button action
 */
#include "script_component.hpp"

//close interrupt
(findDisplay 49) closeDisplay 0;

private _access = "adminpanel" call FUNC(canAccessPanelModule);
if (!_access) exitWith {hint localize LSTRING(NoAccess);};

"adminpanel" call FUNC(sendAdminActionLog);
createDialog 'A3CS_adminPanel';
