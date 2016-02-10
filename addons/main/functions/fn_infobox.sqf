/*
    Author: SzwedzikPL
    Load A3C infobox
*/
disableSerialization;

params ["_mode"];

private _nickname = profileNameSteam;
private _uid = profilenamespace getVariable ["player_uid", 0];
private _lang = language;

private _modList = getArray (configFile >> "a3c_mods" >> "modlist");
private _mods = "";

//Prepare client modlist
{
    if(isClass (configFile >> "CfgMods" >> _x)) then {
        private _modCode = getText (configFile >> "CfgMods" >> _x >> "mod_code");
        private _modVersion = getText (configFile >> "CfgMods" >> _x >> "mod_version");

        if(_modCode == "") then {_modCode = _x;};
        if(_modVersion == "") then {_modVersion = 0;};

        if(_mods != "") then {
            _mods = format ["%1\\%2::%3", _mods, _modCode, _modVersion];
        } else {
            _mods = format ["%1::%2", _modCode, _modVersion];
        };

    };
} foreach _modList;

//Load web response
private _url = "http://arma3coop.pl/a3.php";
private _file = "a3\Ui_f\data\news.html";
private _display = findDisplay 0;
private _displayCtrl = 19005;
private _data = "";

if(_mode == "log") then {
    _displayCtrl = 19000;
    _data = format["?mode=log&name=%1&uid=%2&lang=%3&mods=%4",_nickname, _uid, _lang, _mods];
};

if(_mode == "mods") then {
    _data = format["?mode=mods&mods=%2",_nickname, _mods];
};

private _ctrlHTML = _display displayCtrl _displayCtrl;
_ctrlHTML htmlLoad format ["%1%2", _url, _data];

private _htmlLoaded = ctrlHTMLLoaded _ctrlHTML;
if (!_htmlLoaded) then {
    _ctrlHTML htmlLoad _file;
    uinamespace setvariable ["BIS_fnc_guiNewsfeed_disable", true];
};
