/*
 * Author: SzwedzikPL
 * Onload handler of RscA3CSIntroEffect
 */
#include "script_component.hpp"
#include "\z\a3cs\addons\mm\ui\idcRscA3CSIntroEffect.hpp"

disableSerialization;
private _display = uiNamespace getVariable ['RscA3CSIntroEffect', displayNull];

private _missionData =  call EFUNC(common,getMissionData);
_missionData params ["_missionName", "_missionMap", "_missionAuthor"];
private _players = count playableUnits; //allplayers is broken atm
if (!isMultiplayer) then {_players = 1;};

date params ["_year", "_month", "_day", "_hour", "_minute"];

if (_month < 10) then {_month = format ["0%1", _month];};
if (_day < 10) then {_day = format ["0%1", _day];};
if (_hour < 10) then {_hour = format ["0%1", _hour];};
if (_minute < 10) then {_minute = format ["0%1", _minute];};

private _unitData = player call EFUNC(nametag,getUnitData);
_unitData params ["_nickname", "_rankname"];

private _playerName = format ["%1 %2", _rankname, _nickname];
private _playerDesc = roleDescription player;
private _unitDesc = format ["%1 - %2", _playerName, _playerDesc];
if (_playerDesc == "") then {_unitDesc = _playerName;};

//Title
private _title = _display displayctrl IDC_RSCA3CINTROEFFECT_TITLE;
_title ctrlsettext toupper _missionName;

//Data
private _subtitle1 = _display displayctrl IDC_RSCA3CINTROEFFECT_SUBTITLE1;
private _subtitle2 = _display displayctrl IDC_RSCA3CINTROEFFECT_SUBTITLE2;
private _subtitle3 = _display displayctrl IDC_RSCA3CINTROEFFECT_SUBTITLE3;
private _subtitle4 = _display displayctrl IDC_RSCA3CINTROEFFECT_SUBTITLE4;
private _subtitle5 = _display displayctrl IDC_RSCA3CINTROEFFECT_SUBTITLE5;
_subtitle1 ctrlsettext toupper format ["Autor misji: %1", _missionAuthor];
_subtitle2 ctrlsettext toupper format ["Mapa: %1", _missionMap];
_subtitle3 ctrlsettext toupper format ["Liczba graczy: %1", _players];
_subtitle4 ctrlsettext toupper format ["Data: %1.%2.%3 %4:%5", _year, _month, _day, _hour, _minute];
_subtitle5 ctrlsettext toupper format ["%1", _unitDesc];

//Icon
_picture = _display displayctrl IDC_RSCA3CINTROEFFECT_PICTURE;
_picture ctrlsettextcolor [1,1,1,1];
_picture ctrlsettext "\z\a3cs\addons\main\data\a3c_logo.paa";

//--- Monochromatic post-process
RscA3CSIntroEffect_colorCorrection = ppeffectcreate ["ColorCorrections",1616];
RscA3CSIntroEffect_colorCorrection ppeffectforceinNVG true;
RscA3CSIntroEffect_colorCorrection ppEffectEnable true;
RscA3CSIntroEffect_colorCorrection ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [0.4, 0.4, 0.4, 1], [1, 1, 1, 1.0]];
RscA3CSIntroEffect_colorCorrection ppEffectCommit 0;
RscA3CSIntroEffect_colorCorrection ppEffectAdjust [1, 1, -0.1, [1, 1, 1, 0], [0.4, 0.4, 0.4, 0], [1, 1, 1, 1.0]];
RscA3CSIntroEffect_colorCorrection ppEffectCommit 0.2;

RscA3CSIntroEffect_filmGrain = ppeffectcreate ["filmGrain",2005];
RscA3CSIntroEffect_filmGrain ppeffectforceinNVG true;
RscA3CSIntroEffect_filmGrain ppEffectEnable true;
RscA3CSIntroEffect_filmGrain ppEffectAdjust [0, 1, 1, 0.1, 1, true];
RscA3CSIntroEffect_filmGrain ppEffectCommit 0;
RscA3CSIntroEffect_filmGrain ppEffectAdjust [0.1, 1, 1, 0.1, 1, true];
RscA3CSIntroEffect_filmGrain ppEffectCommit 0.2;

RscA3CSIntroEffect_radialBlur = ppeffectcreate ["RadialBlur",167];
RscA3CSIntroEffect_radialBlur ppeffectforceinNVG true;
RscA3CSIntroEffect_radialBlur ppeffectenable true;
RscA3CSIntroEffect_radialBlur ppeffectadjust [0,0,0,0];
RscA3CSIntroEffect_radialBlur ppeffectcommit 0;
RscA3CSIntroEffect_radialBlur ppeffectadjust [0.005,0,0.25,0.25];
RscA3CSIntroEffect_radialBlur ppeffectcommit 0.2;


[_display] spawn {
    disableserialization;
    params ["_display"];
    waituntil {isNull _display};
    ppeffectdestroy [RscA3CSIntroEffect_colorCorrection, RscA3CSIntroEffect_filmGrain, RscA3CSIntroEffect_radialBlur];
};
