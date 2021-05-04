#include "script_component.hpp"

if !(is3DENPreview) exitWith {};

addMissionEventHandler ["ExtensionCallback", {
  params ["_name", "_function"];

  if (_name isNotEqualTo "a3cs_debug") exitWith {};

  if (_function isEqualTo "logsListUpdated") exitWith {
    while {true} do {
      private _log = "a3cs_debug" callExtension "getLog";
      if (_log isEqualTo "") exitWith {};
      systemChat _log;

      // TODO - dedicated chat
    };
  };
}];

private _initWatcher = "a3cs_debug" callExtension "missionPreviewStart";
if (_initWatcher isEqualTo "true") then {
  systemChat "Uruchamiam obserwację logów";
  /*
    FileSystemWatcher often don't trigger if focus is on arma app
    Async polling for updates forces callback if logsList updated
  */
  [{"a3cs_debug" callExtension "updateLogsList";}, 0.5] call CBA_fnc_addPerFrameHandler;
};

[QEGVAR(modules,base), "init", {
  _this call FUNC(initModule);
}, true, [], true] call CBA_fnc_addClassEventHandler;

{
  _x call FUNC(initTrigger);
  false
} count (allMissionObjects "EmptyDetector");
