/*
 * Author: SzwedzikPL
 * Onload tactical hud (onload event in titlersc)
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\nametag\ui\idcTacticalHud.hpp"

params ["_display"];

private _controlMap = _display displayCtrl IDC_TACTICALHUD_RADAR;
private _controlMapBG = _display displayCtrl IDC_TACTICALHUD_RADARBG;
private _controlListOne = _display displayCtrl IDC_TACTICALHUD_LISTONE;
private _controlListTwo = _display displayCtrl IDC_TACTICALHUD_LISTTWO;
private _controlListThree = _display displayCtrl IDC_TACTICALHUD_LISTTHREE;

uiNamespace setVariable [QGVAR(tacticalHud), _display];
uiNamespace setVariable [QGVAR(tacticalHudRadar), _controlMap];
uiNamespace setVariable [QGVAR(tacticalHudRadarPosition), ctrlPosition _controlMap];
uiNamespace setVariable [QGVAR(tacticalHudRadarBackground), _controlMapBG];
uiNamespace setVariable [QGVAR(tacticalHudRadarBackgroundPosition), ctrlPosition _controlMapBG];
uiNamespace setVariable [QGVAR(tacticalHudListOne), _controlListOne];
uiNamespace setVariable [QGVAR(tacticalHudListOnePosition), ctrlPosition _controlListOne];
uiNamespace setVariable [QGVAR(tacticalHudListTwo),  _controlListTwo];
uiNamespace setVariable [QGVAR(tacticalHudListTwoPosition), ctrlPosition _controlListTwo];
uiNamespace setVariable [QGVAR(tacticalHudListThree),  _controlListThree];
uiNamespace setVariable [QGVAR(tacticalHudListThreePosition), ctrlPosition _controlListThree];

if(GVAR(enableTacticalHudBackground)) then {
    _controlMapBG ctrlSetText QUOTE(PATHTOF(data\tacticalhud_ca.paa));
};

if(!hasInterface) exitWith {};

GVAR(tacticalHudMapEHID) = _controlMap ctrlAddEventHandler ["Draw", QUOTE(call FUNC(drawTacticalHud))];
