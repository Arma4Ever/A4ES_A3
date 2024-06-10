#include "script_component.hpp"

params ["_mode"];

ace_player setVariable ["ace_microdagr_broadcastPos", _mode, true];

if (_mode) then {
    [LLSTRING(simpleGPSTurnedOn)] call EFUNC(common,displayTextStructured);
} else {
    [LLSTRING(simpleGPSTurnedOff)] call EFUNC(common,displayTextStructured);
};
