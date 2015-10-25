/*
	Author: SzwedzikPL
	Desc: Module editbox gui fnc
*/
#include "script_component.hpp"

_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_units = [_this,1,[],[[]]] call BIS_fnc_param;
_activated = [_this,2,true,[true]] call BIS_fnc_param;

if(!isServer) exitWith {};

a3cs_fnc_boxEditorGUI_init = {

	createDialog "a3cs_mm_boxEditorGUI_loading";

	//Prepare cfgpatches elements
	_cfgPatchesElements = [];
	_cfgPatches = (configfile >> "CfgPatches") call BIS_fnc_getCfgSubClasses;

	{
		if(isarray(configfile >> "CfgPatches" >> _x >> "weapons")) then {
			_classValue = getArray (configfile >> "CfgPatches" >> _x >> "weapons");
			_cfgPatchesElements append _classValue;
		};
		if(isarray(configfile >> "CfgPatches" >> _x >> "units")) then {
			_classValue = getArray (configfile >> "CfgPatches" >> _x >> "units");
			_cfgPatchesElements append _classValue;
		};
	} foreach _cfgPatches;

	//Add magazines
	_cfgGlasses = (configfile >> "CfgGlasses") call BIS_fnc_getCfgSubClasses;
	_cfgPatchesElements append _cfgGlasses;

	//Add glasses
	_cfgMagazines = (configfile >> "CfgMagazines") call BIS_fnc_getCfgSubClasses;
	_cfgPatchesElements append _cfgMagazines;

	//Data variables
	_weaponClasses = [];
	_weaponClassData = [];

	_magazineClasses = [];
	_magazineClassData = [];

	_itemClasses = [];
	_itemClassData = [];

	_gearClasses = [];
	_gearClassData = [];

	//Sort classes by cat
	{
		_itemClass = _x;
		_itemInfo = [_itemClass] call BIS_fnc_itemType;
		_itemCategory = tolower (_itemInfo select 0);
		_itemType = tolower (_itemInfo select 1);

		//Bron
		if(_itemCategory == "weapon") then {
			_exeptionTypes = ["unknownweapon","throw"];
			_itemScope = getNumber(configfile >> "cfgWeapons" >> _itemClass >> "scope");

			if(!(_itemType in _exeptionTypes) && _itemScope==2 && !(_itemClass in _weaponClasses)) then {
				_weaponClasses pushBack _itemClass;
				_weaponClassData pushBack [_itemClass,"cfgWeapons"];
			};
		};

		//Itemy
		if(_itemCategory == "item") then {
			_exeptionTypes = ["unknownequipment"];
			_itemScope = 0;
			_itemParentCfg = "";
			if(isClass(configfile >> "cfgWeapons" >> _itemClass)) then {
				_itemScope = getNumber(configfile >> "cfgWeapons" >> _itemClass >> "scope");
				_itemParentCfg = "cfgWeapons";
			};
			if(isClass(configfile >> "cfgmagazines" >> _itemClass)) then {
				_itemScope = getNumber(configfile >> "cfgmagazines" >> _itemClass >> "scope");
				_itemParentCfg = "cfgmagazines";
			};

			if(!(_itemType in _exeptionTypes) && _itemScope==2 && !(_itemClass in _itemClasses)) then {
				_itemClasses pushBack _itemClass;
				_itemClassData pushBack [_itemClass,_itemParentCfg];
			};
		};

		//Ubior
		if(_itemCategory == "equipment") then {
			_exeptionTypes = ["uniform"];
			_itemScope = 0;
			_itemParentCfg = "";
			if(isClass(configfile >> "cfgWeapons" >> _itemClass)) then {
				_itemScope = getNumber(configfile >> "cfgWeapons" >> _itemClass >> "scope");
				_itemParentCfg = "cfgWeapons";
			};
			if(isClass(configfile >> "cfgMagazines" >> _itemClass)) then {
				_itemScope = getNumber(configfile >> "cfgmagazines" >> _itemClass >> "scope");
				_itemParentCfg = "cfgmagazines";
			};
			if(isClass(configfile >> "cfgGlasses" >> _itemClass)) then {
				_itemScope = getNumber(configfile >> "cfgGlasses" >> _itemClass >> "scope");
				_itemParentCfg = "cfgGlasses";
			};

			if(!(_itemType in _exeptionTypes) && _itemScope==2 && !(_itemClass in _gearClasses)) then {
				_gearClasses pushBack _itemClass;
				_gearClassData pushBack [_itemClass,_itemParentCfg];
			};
		};

		//Amunicja
		if(_itemCategory == "magazine") then {
			//_exeptionTypes = ["artillery","countermeasures","missile","bullet"];
			_exeptionTypes = [];
			_itemScope = getNumber(configfile >> "cfgMagazines" >> _itemClass >> "scope");
			_itemPicture = getText (configfile >> "cfgMagazines" >> _itemClass >> "picture");

			if(!(_itemType in _exeptionTypes) && _itemScope==2 && !(_itemClass in _magazineClasses) && _itemPicture!="") then {
				_magazineClasses pushBack _itemClass;
				_magazineClassData pushBack [_itemClass,"cfgMagazines"];
			};
		};
	} foreach _cfgPatchesElements;

	//Save classes
	uiNamespace setVariable ["a3cs_boxEditorGUI_category_weapons", _weaponClassData];
	uiNamespace setVariable ["a3cs_boxEditorGUI_category_magazines", _magazineClassData];
	uiNamespace setVariable ["a3cs_boxEditorGUI_category_items", _itemClassData];
	uiNamespace setVariable ["a3cs_boxEditorGUI_category_gear", _gearClassData];

	//Close loading dialog
	closeDialog 0;

	//Show dialog
	createDialog "a3cs_mm_boxEditorGUI";

	//Add item count listbox elements
	for [{_x=1},{_x<=256},{_x=_x+1}] do {
		_index = lbAdd [1502, str _x];
		lbSetData [1502, _index, str _x];
	};

	//Load weapons as default
	["weapons"] call a3cs_fnc_boxEditorGUI_buttonChangeCategory;
};
a3cs_fnc_boxEditorGUI_buttonChangeCategory = {
	private "_newCategory";
	_newCategory = _this select 0;
	a3cs_boxEditorGUI_category = _newCategory;
	_newCategoryElements = uiNamespace getVariable [format["a3cs_boxEditorGUI_category_%1",a3cs_boxEditorGUI_category], []];

	lbClear 1500;

	{
		_itemClass = _x select 0;
		_cfgClass =  _x select 1;

		_itemName = _itemClass;
		if(isText (configfile >> _cfgClass >> _itemClass >> "displayName")) then {
			_itemName = getText (configfile >> _cfgClass >> _itemClass >> "displayName");
		};

		_itemIcon = "";
		if(isText (configfile >> _cfgClass >> _itemClass >> "picture")) then {
			_itemIcon = getText (configfile >> _cfgClass >> _itemClass >> "picture");
		};

		_index = lbAdd [1500, _itemName];
		lbSetData [1500, _index, _itemClass];
		lbSetTooltip [1500, _index, _itemClass];
		if(_itemIcon != "") then {
			lbSetPicture [1500, _index, _itemIcon];
			lbSetPictureColor [1500, _index, [1, 1, 1, 1]];
		};

	} foreach _newCategoryElements;

	ctrlSetText [1001, format[localize "STR_A3CS_MM_EditBoxGUI_FNC_AvailableElements",lbSize 1500]];
	lbSort [((findDisplay 7800) displayCtrl 1500), "ASC"];
	lbSetCurSel [1500, 0];

	0 call a3cs_fnc_boxEditorGUI_compatibleMags;
};
a3cs_fnc_boxEditorGUI_buttonAddItem = {
	_elementIndex = lbCurSel 1500;
	_elementName = lbText [1500, _elementIndex];
	_elementPicture = lbPicture [1500, _elementIndex];
	_elementData = lbData [1500, _elementIndex];

	_index = lbAdd [1501, _elementName];
	lbSetData [1501, _index, _elementData];
	lbSetValue [1501, _index, 1];
	lbSetTooltip [1501, _index, format[localize "STR_A3CS_MM_EditBoxGUI_FNC_Elementcountinbox",1]];

	if(_elementPicture != "") then {
		lbSetPicture [1501, _index, _elementPicture];
		lbSetPictureColor [1501, _index, [1, 1, 1, 1]];
	};

	lbSetCurSel [1501, ((lbSize 1501)-1)];
	0 call a3cs_fnc_boxEditorGUI_clickBoxElement;

	ctrlSetText [1002, format[localize "STR_A3CS_MM_EditBoxGUI_FNC_Elementsinbox",lbSize 1501]];
};
a3cs_fnc_boxEditorGUI_buttonRemoveItem = {
	_elementIndex = lbCurSel 1501;
	lbDelete [1501, _elementIndex];

	ctrlSetText [1002, format[localize "STR_A3CS_MM_EditBoxGUI_FNC_Elementsinbox",lbSize 1501]];

	0 call a3cs_fnc_boxEditorGUI_clickBoxElement;
};
a3cs_fnc_boxEditorGUI_buttonCopyCode = {
	_text = ctrlText 1400;
	copyToClipboard _text;
	hint localize "STR_A3CS_MM_EditBoxGUI_FNC_CopyDone";
};
a3cs_fnc_boxEditorGUI_buttonGenCode = {
	_elementCount = lbSize 1501;
	_boxCode = "";
	for [{_x=0},{_x<_elementCount},{_x=_x+1}] do {
		_itemClass = lbData [1501, _x];
		_itemValue = lbValue [1501, _x];
		if(_x == 0) then {
			_boxCode = format["[""%1"",%2]",_itemClass,_itemValue];
		} else {
			_boxCode = format["%1,[""%2"",%3]",_boxCode,_itemClass,_itemValue];
		};
	};

	_boxCode = format["[%1]",_boxCode];
	ctrlSetText [1400, _boxCode];
	hint localize "STR_A3CS_MM_EditBoxGUI_FNC_GenerateDone";
};
a3cs_fnc_boxEditorGUI_compatibleMags = {
	_itemClass = lbData [1501, lbCurSel 1501];
	_itemType = ([_itemClass] call BIS_fnc_itemType) select 0;
	if(a3cs_boxEditorGUI_category == "magazines" && _itemType == "weapon") then {
		_compatibleMagazines = getArray(configfile >> "cfgWeapons" >> _itemClass >> "magazines");
		for [{_x=0},{_x<(lbSize 1500)},{_x=_x+1}] do {
			_elementClass = lbData [1500, _x];
			if(_elementClass in _compatibleMagazines) then {
				lbSetColor [1500, _x, [0.12, 0.54, 0.01, 1]];
			} else {
				lbSetColor [1500, _x, [1, 1, 1, 1]];
			};
		};
	} else {
		for [{_x=0},{_x<(lbSize 1500)},{_x=_x+1}] do {
			_elementClass = lbData [1500, _x];
			lbSetColor [1500, _x, [1, 1, 1, 1]];
		};
	};
};
a3cs_fnc_boxEditorGUI_clickBoxElement = {
	_elementIndex = lbCurSel 1501;
	_elementCount = lbValue [1501, _elementIndex];
	lbSetCurSel [1502, (_elementCount-1)];

	0 call a3cs_fnc_boxEditorGUI_compatibleMags;
};
a3cs_fnc_boxEditorGUI_clickItemCount = {
	_countIndex = lbCurSel 1502;
	_countValue = _countIndex+1;
	_elementIndex = lbCurSel 1501;
	lbSetValue [1501, _elementIndex, _countValue];
	lbSetTooltip [1501, _elementIndex, format[localize "STR_A3CS_MM_EditBoxGUI_FNC_Elementcountinbox",_countValue]];
};

player addaction [localize "STR_A3CS_MM_EditBoxGUI_FNC_Boxtitle", {0 call a3cs_fnc_boxEditorGUI_init;}];

0 call a3cs_fnc_boxEditorGUI_init;

true
