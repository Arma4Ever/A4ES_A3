/*
 * Author: SzwedzikPL
 * Curator players nametag
 */
#include "script_component.hpp"

if (GVAR(visionAssistanceEnabled) || !hasInterface) exitWith {};

GVAR(visionAssistanceEnabled) = true;
GVAR(visionAssistanceUnits) = [];
GVAR(visionAssistanceLastRefresh) = 0;

GVAR(visionAssistanceDraw) = addMissionEventHandler ["Draw3D", {
    if (isNil "bis_fnc_moduleRemoteControl_unit" || {!(isNull curatorCamera)} || {!freeLook}) exitWith {};
    if ((CBA_missionTime - GVAR(visionAssistanceLastRefresh)) > 5) then {
        GVAR(visionAssistanceUnits) = [];
        {
            if ((ace_player distance _x) <= GVAR(visionAssistanceDistance)) then {GVAR(visionAssistanceUnits) pushback _x;};
        } foreach ([allUnits, allPlayers] select isMultiplayer);
        GVAR(visionAssistanceLastRefresh) = CBA_missionTime;
    };
    {
        private _color = [side group _x] call BIS_fnc_sideColor;
        private _sizeByDistance = ((GVAR(visionAssistanceIconSize) + 1) - ((ace_player distance _x) / (GVAR(visionAssistanceDistance) / GVAR(visionAssistanceIconSize))));
        private _textSizeByDistance = (GVAR(visionAssistanceTextSize) - ((ace_player distance _x) / (GVAR(visionAssistanceDistance) / GVAR(visionAssistanceTextSize))));
        private _position = _x modelToWorldVisual (_x selectionPosition "Head");
        private _positionText = +_position;
        _position set [2, (_position select 2) + 0.5];
        _positionText set [2, (_positionText select 2) + 1];
        private _name = _x call EFUNC(common,getName);
        drawIcon3D ["a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\UnitIcon_ca.paa", _color, _position, _sizeByDistance, _sizeByDistance, 0, "", 1, 0.05, "PuristaMedium"];
        drawIcon3D ["", _color, _positionText, 1, 1, 0, _name, 1, _textSizeByDistance, "PuristaMedium"];
    } forEach GVAR(visionAssistanceUnits);
}];
