#include "script_component.hpp"

params ["_option"];

if (_option == "init" || _option == QGVAR(enableTacticalHud)) then {
    if (GVAR(enableTacticalHud)) then {
        //init hud
        GVAR(tacticalHudLayer) = [QGVAR(tacticalHud)] call BIS_fnc_rscLayer;
        GVAR(tacticalHudLayer) cutRsc [QGVAR(tacticalHud), "plain"];
    } else {
        //remove hud if present
        if (!isNull (uiNamespace getVariable [QGVAR(tacticalHud), displayNull])) then {
            private _ctrlMap = uiNamespace getVariable [QGVAR(tacticalHudRadar), controlNull];
            _ctrlMap ctrlRemoveEventHandler ["Draw", GVAR(tacticalHudMapEHID)];
            GVAR(tacticalHudLayer) cutText ["", "PLAIN"];

            uiNamespace setVariable [QGVAR(tacticalHud), displayNull];
            uiNamespace setVariable [QGVAR(tacticalHudRadar), controlNull];
            uiNamespace setVariable [QGVAR(tacticalHudRadarPosition), []];
            uiNamespace setVariable [QGVAR(tacticalHudListOne), controlNull];
            uiNamespace setVariable [QGVAR(tacticalHudListOnePosition), []];
            uiNamespace setVariable [QGVAR(tacticalHudListTwo), controlNull];
            uiNamespace setVariable [QGVAR(tacticalHudListTwoPosition), []];
        };
    };
};

if (_option == QGVAR(enableTacticalHudBackground)) then {
    private _controlMapBG = uiNamespace getVariable [QGVAR(tacticalHudRadarBackground), controlNull];
    if (GVAR(enableTacticalHudBackground)) then {
        _controlMapBG ctrlSetText QUOTE(PATHTOF(data\tacticalhud_ca.paa));
    } else {
        _controlMapBG ctrlSetText "";
    };
};
if (_option == QGVAR(enableTacticalHudLists)) then {
    if (!GVAR(enableTacticalHudLists)) then {
        {_x ctrlSetText "";} foreach [
            uiNamespace getVariable [QGVAR(tacticalHudListOne), controlNull],
            uiNamespace getVariable [QGVAR(tacticalHudListTwo), controlNull],
            uiNamespace getVariable [QGVAR(tacticalHudListThree), controlNull]
        ];
    };
};

//Init onDraw3D
if (_option == "init") then {
    addMissionEventHandler ["Draw3D", {_this call FUNC(onDraw3D);}];
};

//Add Special Item
if (_option == "init" || _option == QGVAR(addSpecialItem)) then {
    if (GVAR(addSpecialItem) && isMultiplayer) then {
        if (GVAR(members) isEqualTo [[],[]]) then {
            QGVAR(members) addPublicVariableEventHandler {
                [FUNC(addSpecialItem), [], 1] call CBA_fnc_waitAndExecute;
            };
        } else {
            [FUNC(addSpecialItem), [], 1] call CBA_fnc_waitAndExecute;
        };
    };
};
