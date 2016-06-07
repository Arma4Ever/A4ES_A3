#include "script_component.hpp"

["unit", {
    if (!isNull (getAssignedCuratorLogic player) && {!GVAR(visionAssistanceEnabled)}) then {
        [] call FUNC(initCuratorNametag);
    };
}] call CBA_fnc_addPlayerEventHandler;
