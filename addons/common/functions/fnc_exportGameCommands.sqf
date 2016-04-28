/*
 * Author: SzwedzikPL
 * Exports all ArmA commands
 */
#include "script_component.hpp"

diag_log text format ["//==   %1 %2 %3   ==//", productVersion select 0, productVersion select 2, productVersion select 4];
diag_log text "//======================================//";
diag_log text "//             GAME COMMANDS            //";
diag_log text "//======================================//";
diag_log text "";

{diag_log text _x} forEach supportInfo "";
