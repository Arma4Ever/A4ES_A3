#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Show extension error notification
 */
LOG("extensionErrorNotification");

// Show 3DEN notification
[
    LLSTRING(EditorExtensionError_Message),
    2,
	7,
	false
] call BIS_fnc_3DENNotification;