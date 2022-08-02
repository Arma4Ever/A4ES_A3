#include "script_component.hpp"
/*
 * Author SzwedzikPL
 * OnFired handler for ATACMS attack profile
 *
 */

_this call ace_missileguidance_fnc_gps_attackOnFired;

_this params ["_firedEH", "", "", "", "_stateParams", "", ""];
_stateParams params ["", "", "_attackProfileStateParams"];

_attackProfileStateParams set [3, 0];
