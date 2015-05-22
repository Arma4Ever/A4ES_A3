/*
	Author: SzwedzikPL

	Description:
	Load A3C infobox
*/
disableSerialization;

private ["_mode", "_url", "_file", "_data", "_display", "_displayCtrl", "_nickname", "_ctrlHTML", "_htmlLoaded"];

_mode = [_this, 0,  "", [""]] call BIS_fnc_param;

_url = "http://a3c.szwedzikpl.com/a3.php";
_file = "a3\Ui_f\data\news.html";
_data = "";
_display = findDisplay 0;
_displayCtrl = 19005;

_nickname = profileName;

if(_mode == "log") then {
	_displayCtrl = 19000;
	_data = format["?mode=log&name=%1",_nickname];
};
if(_mode == "missions") then {
	_data = format["?mode=missions&name=%1",_nickname];
};
if(_mode == "mods") then {
	_data = format["?mode=mods&name=%1",_nickname];
};

_ctrlHTML = _display displayCtrl _displayCtrl;
_ctrlHTML htmlLoad format ["%1%2", _url, _data];

_htmlLoaded = ctrlHTMLLoaded _ctrlHTML;
if (!_htmlLoaded) then {
	_ctrlHTML htmlLoad _file;
	uinamespace setvariable ["BIS_fnc_guiNewsfeed_disable",true];
};