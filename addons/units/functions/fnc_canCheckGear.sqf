#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if player can check target unit's gear
 */

params ["_target"];
TRACE_1("canCheckGear",_target);

(
	(alive _target) &&
	{!(_target getVariable ["ACE_isUnconscious", false])} &&
	{!(_target getVariable [QGVAR(disableCheckingGear), false])} &&
	{
		(!(missionNamespace getVariable [QGVAR(disableCheckingAIGear), false])) || 
		{_target getVariable [QEGVAR(common,isPlayer), false]}
	}
)
