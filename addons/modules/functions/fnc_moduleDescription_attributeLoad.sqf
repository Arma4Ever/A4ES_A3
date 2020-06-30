#include "script_component.hpp"
#include "\z\a3cs\addons\modules\controlDefines.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN moduleDescription attributeLoad handler
 */

 // Exit if framework disabled for this display
 if (isNil QGVAR(dynamicAttributesEnabled)) exitWith {
   LOG_1("Skipping init of dynamic attribute '%1' (framework disabled for current display).",configName _config);
 };

// Setup config vars
private _configHierarchy = configHierarchy _config;
private _moduleConfig = _configHierarchy select (count _configHierarchy - 3);
private _moduleDescriptionConfig = _moduleConfig >> QGVAR(moduleDescription);

// Setup controls vars
private _descriptionGroup = _this controlsGroupCtrl 101;
private _controlText = _descriptionGroup controlsGroupCtrl 100;

// Load all relevant data from module config
private _isTriggerActivated = (getNumber (_moduleConfig >> "isTriggerActivated")) > 0;
private _isGlobal = getNumber (_moduleConfig >> "isGlobal");
private _canSetArea = (getNumber (_moduleConfig >> "canSetArea")) > 0;
private _descriptionText = getText (_moduleDescriptionConfig >> "description");
private _is3DEN = (getNumber (_moduleDescriptionConfig >> "is3DEN")) > 0;
private _isDisposable = (getNumber (_moduleDescriptionConfig >> "isDisposable")) > 0;
private _deactivationDisablesEffect = (getNumber (_moduleDescriptionConfig >> "deactivationDisablesEffect")) > 0;
private _positionInfo = getText (_moduleDescriptionConfig >> "positionInfo");
private _positionMatters = !(_positionInfo isEqualTo "");
private _canSyncWith = getArray (_moduleDescriptionConfig >> "canSyncWith");
private _syncRequired = (getNumber (_moduleDescriptionConfig >> "syncRequired")) > 0;
private _apiFunctions = getArray (_moduleDescriptionConfig >> "apiFunctions");
private _schema = getText (_moduleDescriptionConfig >> "schema");

// Check module connections
private _isSyncedWithTrigger = false;
if (_isTriggerActivated) then {
  private _connections = get3DENConnections GVAR(dynamicAttributesModule);
  {
    _x params ["_type", "_target"];
    if (((toLower _type) isEqualTo "sync") && {_target isKindOf "EmptyDetector"}) exitWith {
      _isSyncedWithTrigger = true;
    };
  } forEach _connections;
};

// Setup text of description box
private _colorText = '#969696';
private _iconColor = [_colorText, '#2d9b4c'];
private _stringType = ['Inactive', 'Active'];
private _text = format ["<t color='%1' shadow='0' size='1.1'>", _colorText];
private _sectionTitle = "<t size='1.2' color='#d8d8d8' valign='middle' font='RobotoCondensedBold'>%1</t><br/>";

// Description text
if !(_descriptionText isEqualTo "") then {
  _text = _text + format ["%2<br/><br/>", _colorInactive, _descriptionText];
};

// Trigger section
_text = _text + ([
  format [
    "<img size='1.5' color='%1' image='\a3\3den\data\displays\display3den\panelright\modetriggers_ca.paa'/> ",
    _iconColor select _isTriggerActivated
  ],
  format [
    _sectionTitle,
    localize format [
      LSTRING(ModuleDescription_Triggers_%1_Title),
      _stringType select _isTriggerActivated
    ]
  ],
  [
    localize format [
      LSTRING(ModuleDescription_Triggers_%1_Desc),
      _stringType select _isTriggerActivated
    ],
    "<br/><br/>"
  ] joinString "",
  [
    "",
    format [
      "<img color='%1' image='%2'/> %3<br/><br/>",
      _iconColor select _isSyncedWithTrigger,
      [
        "\a3\3den\data\controlsgroups\tutorial\close_ca.paa",
        "\a3\3den\data\controls\ctrlmenu\picturecheckboxenabled_ca.paa"
      ] select _isSyncedWithTrigger,
      localize format [
        LSTRING(ModuleDescription_Triggers_Trigger%1_Info),
        ["NotSynced", "Synced"] select _isSyncedWithTrigger
      ]
    ]
  ] select _isTriggerActivated
] joinString "");

if (_isTriggerActivated) then {
  // Disposable section
  _text = _text + ([
    format [
      "<img size='1.5' color='%1' image='\a3\3den\data\cfgwaypoints\cycle_ca.paa'/> ",
      _iconColor select !_isDisposable
    ],
    format [
      _sectionTitle,
      localize format [
        LSTRING(ModuleDescription_isDisposable_%1_Title),
        _stringType select _isDisposable
      ]
    ],
    format [
      "%1<br/><br/>",
      localize format [
        LSTRING(ModuleDescription_isDisposable_%1_Desc),
        _stringType select _isDisposable
      ]
    ]
  ] joinString "");

  // Deactivation Disables Effect section
  _text = _text + ([
    format [
      "<img size='1.5' color='%1' image='\a3\3den\data\cfgwaypoints\dismiss_ca.paa'/> ",
      _iconColor select _deactivationDisablesEffect
    ],
    format [
      _sectionTitle,
      localize format [
        LSTRING(ModuleDescription_deactivationDisablesEffect_%1_Title),
        _stringType select _deactivationDisablesEffect
      ]
    ],
    format [
      "%1<br/><br/>",
      localize format [
        LSTRING(ModuleDescription_deactivationDisablesEffect_%1_Desc),
        _stringType select _deactivationDisablesEffect
      ]
    ]
  ] joinString "");
};

// Execution env section
_text = _text + ([
  "<img size='1.5' image='\a3\3den\data\displays\display3den\statusbar\server_ca.paa'/> ",
  format [
    "<t size='1.2' color='#d8d8d8' valign='middle' font='RobotoCondensedBold'>%1: %2</t><br/>",
    localize LSTRING(ModuleDescription_Env_Title),
    localize format [
      LSTRING(ModuleDescription_Env_%1_Title),
      ['Server', 'Global', 'GlobalJIP'] select _isGlobal
    ]
  ],
  format [
    "%1<br/><br/>",
    localize format [
      LSTRING(ModuleDescription_Env_%1_Desc),
      ['Server', 'Global', 'GlobalJIP'] select _isGlobal
    ]
  ]
] joinString "");

// Position section
_text = _text + ([
  format [
    "<img size='1.5' color='%1' image='\a3\3den\data\displays\display3den\toolbar\widget_global_ca.paa'/> ",
    _iconColor select _positionMatters
  ],
  format [
    _sectionTitle,
    localize format [
      LSTRING(ModuleDescription_Position_%1_Title),
      _stringType select _positionMatters
    ]
  ],
  format [
    "%1",
    [
      "<br/>",
      format [
        "%1<br/><br/>",
        _positionInfo
      ]
    ] select _positionMatters
  ]
] joinString "");

// Area section
_text = _text + ([
  format [
    "<img size='1.5' color='%1' image='\a3\3den\data\displays\display3den\panelright\submode_marker_area_ca.paa'/> ",
    _iconColor select _canSetArea
  ],
  format [
    _sectionTitle,
    localize format [
      LSTRING(ModuleDescription_Area_%1_Title),
      _stringType select _canSetArea
    ]
  ],
  format [
    "%1",
    [
      "<br/>",
      format [
        "%1<br/><br/>",
        localize LSTRING(ModuleDescription_Area_Active_Desc)
      ]
    ] select _canSetArea
  ]
] joinString "");

// Effect in 3DEN section
_text = _text + ([
  format [
    "<img size='1.5' color='%1' image='\a3\3den\data\cfgwaypoints\seekanddestroy_ca.paa'/> ",
    _iconColor select _is3DEN
  ],
  format [
    _sectionTitle,
    localize format [
      LSTRING(ModuleDescription_is3DEN_%1_Title),
      _stringType select _is3DEN
    ]
  ],
  format [
    "%1<br/><br/>",
    localize format [
      LSTRING(ModuleDescription_is3DEN_%1_Desc),
      _stringType select _is3DEN
    ]
  ]
] joinString "");

// Prepare canSyncWith elements
private _syncDesc = "";
private _canSyncWithSupported = !(_canSyncWith isEqualTo []);

if (_canSyncWithSupported) then {
  private _categoryNames = [
    [
      ["module", "Modułami:"]
    ],
    ""
  ] call CBA_fnc_hashCreate;
  private _mainOptions = [
    [
      ["<anyUnit>", LSTRING(ModuleDescription_canSyncWith_AnyUnit)],
      ["<anyVehicle>", LSTRING(ModuleDescription_canSyncWith_AnyVehicle)],
      ["<anyPlane>", LSTRING(ModuleDescription_canSyncWith_AnyPlane)],
      ["<anyObject>", LSTRING(ModuleDescription_canSyncWith_AnyObject)]
    ],
    ""
  ] call CBA_fnc_hashCreate;
  private _categories = [[], []] call CBA_fnc_hashCreate;

  {
    private _element = _x;
    private _category = "main";
    private _type = _element;

    if (_element isEqualType []) then {
      _category = _element # 0;
      _type = _element # 1;
    };

    private _categoryElements = [_categories, _category] call CBA_fnc_hashGet;
    _categoryElements pushBack _type;
    [_categories, _category, _categoryElements] call CBA_fnc_hashSet;
  } forEach _canSyncWith;

  _syncDesc = [
    localize LSTRING(ModuleDescription_canSyncWith_ElementsListTitle),
    ":<br/>"
  ] joinString "";

  {
    private _category = _x;
    private _categoryElements = [_categories, _category] call CBA_fnc_hashGet;
    if !(_categoryElements isEqualTo []) then {
      if (_category isEqualTo "main") exitWith {
        {
          private _name = [_mainOptions, _x] call CBA_fnc_hashGet;
          if !(_name isEqualTo "") then {
            _syncDesc = _syncDesc + format ["- %1<br/>", localize _name];
          };
        } forEach _categoryElements;
      };
      if (_category isEqualTo "module") exitWith {
        private _modulesList = "";
        {
          private _name = getText (configFile >> "CfgVehicles" >> _x >> "displayName");
          if !(_name isEqualTo "") then {
            private _isLastElement = _forEachIndex isEqualTo ((count _categoryElements) - 1);
            _modulesList = _modulesList + format [
              "<t font='RobotoCondensedBold'>%1</t>%2",
              _name,
              [", ", ""] select _isLastElement
            ];
          };
        } forEach _categoryElements;

        _syncDesc = _syncDesc + format [
          "- %1: %2<br/>",
          localize LSTRING(ModuleDescription_canSyncWith_Modules),
          _modulesList
        ];
      };
    };
  } forEach ["main", "module"];

  if (_syncRequired) then {
    _syncDesc = _syncDesc + ([
      "<br/>",
      "<img size='1.2' color='#cd2323' image='\a3\3den\data\cfgwaypoints\sentry_ca.paa'/> ",
      localize LSTRING(ModuleDescription_canSyncWith_SyncRequiredInfo),
      "<br/>"
    ] joinString "");
  };
};

// canSyncWith section
_text = _text + ([
  format [
    "<img size='1.5' color='%1' image='\a3\3den\data\cfg3den\history\connectitems_ca.paa'/> ",
    _iconColor select _canSyncWithSupported
  ],
  format [
    _sectionTitle,
    localize format [
      LSTRING(ModuleDescription_canSyncWith_%1_Title),
      _stringType select _canSyncWithSupported
    ]
  ],
  format ["%1<br/>", _syncDesc]
] joinString "");

if !(_apiFunctions isEqualTo []) then {
  _text = _text + ([
    "<img size='1.5' image='\a3\3DEN\Data\Displays\Display3DEN\EntityMenu\functions_ca.paa'/> ",
    format [
      _sectionTitle,
      localize LSTRING(ModuleDescription_apiFunctions_Title)
    ],
    (_apiFunctions apply {
      [
        format ["<t font='RobotoCondensedBold'>%1</t> - ", _x # 0],
        _x # 1
      ] joinString ""
    }) joinString "<br/>",
    "<br/><br/>",
    "<img size='1.2' color='#cd2323' image='\a3\3den\data\cfgwaypoints\sentry_ca.paa'/> ",
    format [
      localize LSTRING(ModuleDescription_apiFunctions_Desc),
      [
        localize "STR_3DEN_Display3DEN_MenuBar_Tools_text",
        " / ",
        localize "STR_3DEN_Display3DEN_MenuBar_FunctionsViewer_text"
      ] joinString ""
    ],
    "<br/><br/>"
  ] joinString "");
};

// Schema section
if !(_schema isEqualTo "") then {
  _text = _text + ([
    "<img size='1.5' image='\a3\3den\data\cfg3den\group\iconcustomcomposition_ca.paa'/> ",
    format [
      _sectionTitle,
      localize LSTRING(ModuleDescription_Schema_Title)
    ],
    format [
      "<t align='center'><img size='15' color='' shadow='0' image='%1'/></t><br/><br/>",
      _schema
    ]
  ] joinString "");
};

_text = _text + '</t>';
_controlText ctrlSetStructuredText parseText _text;
private _controlTextHeight = ctrlTextHeight _controlText;

// Update description text control height
{
  private _pos = ctrlPosition _x;
  _pos set [3, _controlTextHeight];
  _x ctrlSetPosition _pos;
  _x ctrlCommit 0;
} forEach [_descriptionGroup, _controlText];

// Update control groups heights

private _attributesListControl = ctrlParentControlsGroup _this;
private _attributesCategory = ctrlParentControlsGroup _attributesListControl;

private _groupTextHeight = _controlTextHeight + (5 * (pixelH * pixelGrid * 0.50));

{
  private _pos = ctrlPosition _x;
  _pos set [3, (_pos # 3) + _groupTextHeight];
  _x ctrlSetPosition _pos;
  _x ctrlCommit 0;
} forEach [_this, _attributesListControl, _attributesCategory];

// Add control to controls list
GVAR(allAttributesControls) pushBackUnique _this;

// ================================================
// Module description is last loaded element
// Use it to trigger ala "postInit" framework stuff
// ================================================

// Save attributes list and category controls in ui namespace
uiNamespace setVariable [QGVAR(currentModuleAttributesList), _attributesListControl];
uiNamespace setVariable [QGVAR(currentModuleAttributesCategory), _attributesCategory];

// Get current module warnings
private _entityIDVarName = str (get3DENEntityID GVAR(dynamicAttributesModule));
private _warnings = GVAR(allWarnings) getVariable [_entityIDVarName, []];

// Trigger module warnings update
LOG_1("Triggering initial refresh of module warnings (warnings: %1).",str _warnings);
[_warnings] call FUNC(refreshModuleWarnings);

// Trigger initial refresh of attributes
LOG_1("Triggering initial refresh of attributes (count: %1).",str count GVAR(allAttributesControls));
call FUNC(refreshAttributes);

// Initial call of values changed handler
