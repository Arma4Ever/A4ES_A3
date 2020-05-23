#include "script_component.hpp"

if (hasInterface) then {
  // Block channels except global & side
  // x enableChannel y can't disable group chat
  [{
    if (currentChannel > 1) then {
      setCurrentChannel 0;
    };
  }, 0.1, []] call CBA_fnc_addPerFrameHandler;
};
