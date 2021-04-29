#include "script_component.hpp"
/*
 * Author: Karel Moricky, Killzone_Kid, SzwedzikPL
 * Shows script error
 */

params ["_message", ["_params", []], ["_scriptName", ""]];

// Exit if not 3DEN or editor preview
if !(is3DEN || is3DENPreview) exitWith {};

// Try using header scriptName if used didn't defined one
if ((_scriptName isEqualTo "") && !(isNil "_fnc_scriptName")) then {
  _scriptName = _fnc_scriptName;
};

// Tag script name
if (_scriptName isNotEqualTo "") then {
  _scriptName = "[" + _scriptName + "] ";
};

// Localize message
if (isLocalized _message) then {
  _message = localize _message;
};

// Format message if params are present
if (_params isNotEqualTo []) then {
  _message = format ([_message] + _params);
};

if (is3DEN) then {
  // Show 3DEN notification
  [
    "<img image='\a3\3DEN\Data\Displays\Display3DEN\EntityMenu\functions_ca.paa' /><t font='EtelkaMonospaceProBold' size='0.75'>" + _scriptName + "</t><br />" + _message,
    2,
    5,
    false
  ] call BIS_fnc_3DENNotification;
} else {
  // Show ingame error rsc
  QGVAR(functionError) cutRsc ["RscFunctionError", "plain"];
  ((uiNamespace getVariable ["RscFunctionError", displaynull]) displayCtrl 1100) ctrlSetStructuredText parseText (
    "<t font='PuristaMedium' size='1'><t color='#ff9900'>" + _scriptName + "</t>" + _message + "</t>"
  );

  if !(scriptDone GVAR(lastFunctionErrorFade)) then {
    terminate GVAR(lastFunctionErrorFade);
  };

  QGVAR(functionError) cutFadeOut 99999;
  GVAR(lastFunctionErrorFade) = 0 spawn {
    sleep 15;
    QGVAR(functionError) cutFadeOut 10;
  };
};

diag_log ("ERROR: " + _scriptName + _message);
