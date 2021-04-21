#include "script_component.hpp"

#include "XEH_PREP.hpp"

private _configs = "(configName _x) isKindOf ['HandGrenade', (configFile >> 'CfgMagazines')]" configClasses (configFile >> "CfgMagazines");
private _magazines = ["MiniGrenade"];
{
	if ((getNumber (_x >> "scope")) > 0) then {
		private _ammo = getText (_x >> "ammo");
		private _ammoConfig = configFile >> "CfgAmmo" >> _ammo;
		if (
			((getNumber (_ammoConfig >> "explosive")) > 0) &&
			{(getNumber (_ammoConfig >> "hit")) > 0} &&
			{(toLower getText (_ammoConfig >> "CraterEffects")) isEqualTo "grenadecrater"}
		) then {
			_magazines pushBackUnique (configName _x);
		};
	};
  false
} count _configs;

uiNamespace setVariable [QGVAR(hatchGrenadesCache), _magazines];
