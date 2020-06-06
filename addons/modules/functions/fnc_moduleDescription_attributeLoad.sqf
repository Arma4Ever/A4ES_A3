#include "script_component.hpp"
#include "\z\a3cs\addons\modules\controlDefines.hpp"
/*
 * Author: Bohemia Interactive, SzwedzikPL
 * 3DEN moduleDescription attributeLoad handler
 */

 // Exit if framework disabled for this display
 if (isNil QGVAR(dynamicAttributesEnabled)) exitWith {
   INFO_1("Skipping init of dynamic attribute '%1' (framework disabled for current display).",configName _config);
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
private _positionInfo = getText (_moduleDescriptionConfig >> "positionInfo");
private _positionMatters = !(_positionInfo isEqualTo "");
private _canSyncWith = getArray (_moduleDescriptionConfig >> "canSyncWith");
private _syncRequired = (getNumber (_moduleDescriptionConfig >> "syncRequired")) > 0;
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

// Description text
if !(_descriptionText isEqualTo "") then {
  _text = _text + format ["%2<br/><br/>", _colorInactive, _descriptionText];
};

// Trigger section
_text = _text + format [
  "%1 %2%3%4",
  format [
    "<img size='1.5' color='#2d9b4c' image='\a3\3den\data\displays\display3den\panelright\modetriggers_ca.paa'/>",
    _iconColor select _isTriggerActivated
  ],
  format [
    "<t size='1.2' color='#d8d8d8' valign='middle' font='RobotoCondensedBold'>%1</t><br/>",
    localize format [
      LSTRING(ModuleDescription_Triggers_%1_Title),
      _stringType select _isTriggerActivated
    ]
  ],
  format [
    "%1<br /><br />",
    localize format [
      LSTRING(ModuleDescription_Triggers_%1_Desc),
      _stringType select _isTriggerActivated
    ]
  ],
  format [
    "%1",
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
  ]
];


// Execution env section
_text = _text + format [
  "%1 %2%3",
  "<img size='1.5' image='\a3\3den\data\displays\display3den\statusbar\server_ca.paa'/>",
  format [
    "<t size='1.2' color='#d8d8d8' valign='middle' font='RobotoCondensedBold'>%1: %2</t><br/>",
    localize LSTRING(ModuleDescription_Env_Title),
    localize format [
      LSTRING(ModuleDescription_Env_%1_Title),
      ['Server', 'Global', 'GlobalJIP'] select _isGlobal
    ]
  ],
  format [
    "%1<br /><br />",
    localize format [
      LSTRING(ModuleDescription_Env_%1_Desc),
      ['Server', 'Global', 'GlobalJIP'] select _isGlobal
    ]
  ]
];

// Position section
_text = _text + format [
  "%1 %2%3",
  format [
    "<img size='1.5' color='%1' image='\a3\3den\data\displays\display3den\toolbar\widget_global_ca.paa'/>",
    _iconColor select _positionMatters
  ],
  format [
    "<t size='1.2' color='#d8d8d8' valign='middle' font='RobotoCondensedBold'>%1</t><br/>",
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
];

// Area section
_text = _text + format [
  "%1 %2%3",
  format [
    "<img size='1.5' color='%1' image='\a3\3den\data\displays\display3den\panelright\submode_marker_area_ca.paa'/>",
    _iconColor select _canSetArea
  ],
  format [
    "<t size='1.2' color='#d8d8d8' valign='middle' font='RobotoCondensedBold'>%1</t><br/>",
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
];

// Effect in 3DEN section
_text = _text + format [
  "%1 %2%3",
  format [
    "<img size='1.5' color='%1' image='\a3\3den\data\cfgwaypoints\seekanddestroy_ca.paa'/>",
    _iconColor select _is3DEN
  ],
  format [
    "<t size='1.2' color='#d8d8d8' valign='middle' font='RobotoCondensedBold'>%1</t><br/>",
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
];

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

  _syncDesc = format [
    "%1:<br/>",
    "Moduł może być zsynchronizowany z następującymi elementami"
  ];

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
    _syncDesc = _syncDesc + format [
      "<br/>%1 %2<br/>",
      "<img size='1.2' color='#cd2323' image='\a3\3den\data\cfgwaypoints\sentry_ca.paa'/>",
      localize LSTRING(ModuleDescription_canSyncWith_SyncRequiredInfo)
    ];
  };
};

// canSyncWith section
_text = _text + format [
  "%1 %2%3",
  format [
    "<img size='1.5' color='%1' image='\a3\3den\data\cfg3den\history\connectitems_ca.paa'/>",
    _iconColor select _canSyncWithSupported
  ],
  format [
    "<t size='1.2' color='#d8d8d8' valign='middle' font='RobotoCondensedBold'>%1</t><br/>",
    localize format [
      LSTRING(ModuleDescription_canSyncWith_%1_Title),
      _stringType select _canSyncWithSupported
    ]
  ],
  format ["%1<br/>", _syncDesc]
];

// Schema section
if !(_schema isEqualTo "") then {
  _text = _text + format [
    "%1 %2%3",
    "<img size='1.5' image='\a3\3den\data\cfg3den\group\iconcustomcomposition_ca.paa'/>",
    format [
      "<t size='1.2' color='#d8d8d8' valign='middle' font='RobotoCondensedBold'>%1</t><br/><br/>",
      localize LSTRING(ModuleDescription_Schema_Title)
    ],
    format [
      "<t align='center'><img size='15' color='' shadow='0' image='%1'/></t><br/><br/>",
      _schema
    ]
  ];
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
GVAR(allAttributesControls) pushBackUnique [_this, (ctrlPosition _this # 1)];

// ================================================
// Module description is last loaded element
// Use it to trigger ala "postInit" framework stuff
// ================================================

// Save original heights of attributes list and category
GVAR(attributesListHeight) = (ctrlPosition _attributesListControl) # 3;
GVAR(attributesCategoryHeight) = (ctrlPosition _attributesCategory) # 3;

// Trigger initial refresh of attributes
INFO_1("Triggering initial refresh of reactive attributes (attributes: %1).",str count GVAR(reactiveAttributes));
call FUNC(refreshReactiveAttributes);

// Get current module warnings
private _entityIDVarName = str (get3DENEntityID GVAR(dynamicAttributesModule));
private _warnings = GVAR(allWarnings) getVariable [_entityIDVarName, []];

// Trigger module warnings update
INFO_1("Triggering initial refresh of module warnings (warnings: %1).",str _warnings);
[_warnings] call FUNC(refreshModuleWarnings);
