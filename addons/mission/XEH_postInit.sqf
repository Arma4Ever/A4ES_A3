#include "script_component.hpp"

if (hasInterface) then {
  // Disable all channels except global & side
  for "_i" from 2 to 15 do {
    _i enableChannel false;
  };

  // Block channels except global & side
  // enableChannel command can't disable group chat
  [{
    if (currentChannel > 1) then {
      setCurrentChannel 0;
    };
  }, 0, []] call CBA_fnc_addPerFrameHandler;
};
