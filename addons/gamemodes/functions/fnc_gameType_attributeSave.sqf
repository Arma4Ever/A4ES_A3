#include "script_component.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * gameType control attributeSave handler
 */

private _combo = _this controlsGroupCtrl 100;
private _className = _combo lbData (lbCurSel _combo);

"Multiplayer" set3DENMissionAttribute ["GameType", _className];

""
