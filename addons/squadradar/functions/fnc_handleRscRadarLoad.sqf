#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Handles RscRadar onLoad event
 */

params ["_display"];

LOG("Loading RscRadar");

uiNamespace setVariable [QGVAR(rscRadar), _display];
private _ctrlRadarBg = _display displayCtrl IDC_RSCRADAR_RADARBG;
private _ctrlRadar = _display displayCtrl IDC_RSCRADAR_RADAR;

// Set radar background
_ctrlRadarBg ctrlSetText GVAR(radarBackground);
_ctrlRadarBg ctrlSetTextColor [1, 1, 1, GVAR(radarBackgroundOpacity)];

// Adjust map zoom based on map size
_ctrlRadar ctrlMapAnimAdd [0, 1 / (worldsize / (RADAR_MAX_UNIT_DISTANCE * 16)), ace_player];
ctrlMapAnimCommit _ctrlRadar;

// Center map on camera position
_ctrlRadar mapCenterOnCamera true;

// Draw memberlist first to setup cache
true call FUNC(drawMemberlist);

// Start drawing radar
_ctrlRadar ctrlAddEventHandler ["draw", DFUNC(drawRadar)];

GVAR(enabled) = true;

LOG("RscRadar loaded");
