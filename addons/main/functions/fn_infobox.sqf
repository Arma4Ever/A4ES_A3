/*
    Author: SzwedzikPL

    Description:
    Load A3C infobox
*/
disableSerialization;

private ["_mode", "_url", "_file", "_data", "_display", "_displayCtrl", "_nickname", "_ctrlHTML", "_htmlLoaded", "_possibleMods", "_mods"];

_mode = [_this, 0,  "", [""]] call BIS_fnc_param;

_url = "http://arma3coop.pl/a3.php";
_file = "a3\Ui_f\data\news.html";
_data = "";
_display = findDisplay 0;
_displayCtrl = 19005;

_nickname = profileNameSteam;

_possibleMods = ["CBA", "ACRE2","A3CS", "PAM", "A3MP", "A3AP"];
_mods = "";

{
	if(isClass (configFile >> "CfgMods" >> _x)) then {
		_modCode = getText(configFile >> "CfgMods" >> _x >> "mod_code");
		_modVersion = getText(configFile >> "CfgMods" >> _x >> "mod_version");

		if(_modCode == "") then {_modCode = _x;};
		if(_modVersion == "") then {_modVersion = 0;};

		if(_mods != "") then {
			_mods = format ["%1\\%2::%3", _mods, _modCode, _modVersion];
		} else {
			_mods = format ["%1::%2", _modCode, _modVersion];
		};

	};
} foreach _possibleMods;

if(_mode == "log") then {
    _displayCtrl = 19000;
    _data = format["?mode=log&name=%1&mods=%2",_nickname, _mods];
};
if(_mode == "mods") then {
    _data = format["?mode=mods&mods=%2",_nickname, _mods];
};
/*
if(_mode == "missions") then {
    _data = format["?mode=missions&name=%1",_nickname];
};
*/

_ctrlHTML = _display displayCtrl _displayCtrl;
_ctrlHTML htmlLoad format ["%1%2", _url, _data];

_htmlLoaded = ctrlHTMLLoaded _ctrlHTML;
if (!_htmlLoaded) then {
    _ctrlHTML htmlLoad _file;
    uinamespace setvariable ["BIS_fnc_guiNewsfeed_disable",true];
};