private ["_player", "_unit"];

_player = _this select 0;
_unit = _this select 1;

if(isPlayer _unit) then {
	[
		[[_player],{hint format ["%1 przeszukuje twój ekwipunek...", name (_this select 0)];}],
		"BIS_fnc_spawn",
		_unit,
		false
	] spawn BIS_fnc_MP;
};

_countEQElements = {
	private ["_array", "_elements", "_elementsCount"];
	_array = _this;
	_elements = [];
	_elementsCount = [];
	{
		_elem = _x;
		if(!(_elem in _elements)) then {
			_elements pushback _elem;
			_elementsCount pushback [_elem,1];
		} else {
			{
				if(_x select 0 == _elem) then {
					_count = _x select 1;
					_count = _count+1;
					_elementsCount set [_forEachIndex,[_elem,_count]];
				};
			} foreach _elementsCount;
		};
	} foreach _array;
	_elementsCount
};

_showEQElements = {
	private ["_elements", "_hCode"];
	_elements = _this;
	_hCode = "";
	{
		_class = _x select 0;
		_count = _x select 1;
		_type = "CfgWeapons";
		if(!isClass (configFile >> _type >> _class)) then {_type = "CfgMagazines";};

		_img = getText (configfile >> _type >> _class >> "picture");
		_nm = getText (configfile >> _type >> _class >> "displayName");

		_hc = format["<img size='1.25' image='%1'/> %2 x%3<br/>", _img, _nm, _count];
		_hCode = _hCode+_hc;

	} foreach _elements;
	_hCode
};

private ["_weapons", "_magazines", "_items", "_hintCode", "_newCode"];

_weapons = (weapons _unit) call _countEQElements;
_magazines = (magazines _unit) call _countEQElements;
_items = (items _unit) call _countEQElements;

_hintCode = format["Ekwipunek gracza<br/><t size='1.25'>%1</t><br/><br/>", name _unit];

_hintCode = _hintCode+format["<t color='#00CC00'>Broń</t><br/>"];
_newCode = _weapons call _showEQElements;
_hintCode = _hintCode+_newCode;

_hintCode = _hintCode+format["<br/><t color='#00CC00'>Magazynki</t><br/>"];
_newCode = _magazines call _showEQElements;
_hintCode = _hintCode+_newCode;

_hintCode = _hintCode+format["<br/><t color='#00CC00'>Itemy</t><br/>"];
_newCode = _items call _showEQElements;
_hintCode = _hintCode+_newCode;

hint parsetext _hintCode;