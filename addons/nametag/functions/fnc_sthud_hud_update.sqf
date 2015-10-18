// Code to draw the contents of the HUD.

#define HUD_MAP  (uiNamespace getVariable "ST_STHud_Map")
#define HUD_TEXT (uiNamespace getVariable "ST_STHud_Text")
#define HUD_TEXT2 (uiNamespace getVariable "ST_STHud_Text2")

// Same colours as in config file but reformatted

#define Mkr_ColourRed       [0.9, 0, 0, 1]
#define Mkr_ColourGreen     [0, 0.8, 0, 1]
#define Mkr_ColourLightBlue [0.2, 0.2, 1, 1]
#define Mkr_ColourYellow    [0.85, 0.85, 0, 1]
#define Mkr_ColourOrange    [0.85, 0.4, 0, 1]
#define Mkr_ColourLightGrey [0.7, 0.7, 0.7, 1]
#define Mkr_ColourWhite     [1, 1, 1, 1]

// Helper macros for getting bearings between two vectors
#define DELTA_x(V1, V2) ((V1 select(0)) - (V2 select(0)))
#define DELTA_y(V1, V2) ((V1 select(1)) - (V2 select(1)))
#define ANGLE_xy(V1, V2) DELTA_x(V1, V2) atan2 DELTA_y(V1, V2)

ST_STHud_GetColour =
{
    private ["_unit", "_distance"];
    _unit = _this select 0;
    _distance = _this select 1;

    if (_unit == player) exitWith
    {
        if (leader(player) == _unit) then
        {
            Mkr_ColourWhite;
        }
        else
        {
            Mkr_ColourYellow;
        };
    };

    if (_distance < ST_STHud_Close) exitWith
    {
        Mkr_ColourOrange;
    };

    private "_result";
    _result = Mkr_ColourGreen;
    if (leader(player) == _unit) then
    {
        _result = Mkr_ColourWhite;
    };

    if (_distance > ST_STHud_MaxDist) then
    {
        private "_alpha";
        _alpha = (0 max (ST_STHud_FadeEdge - _distance)) / ST_STHud_EdgeStep;
        _alpha = 0.8 min _alpha;
        _result set [3, _alpha];
    };

    _result;
};

ST_STHud_GetColour_FromTeam =
{
    private ["_unit", "_distance"];
    _unit = _this select 0;
    _distance = _this select 1;

    private ["_team_colour", "_is_player"];
    _team_colour = _unit call ST_STHud_assignedTeam;
    _is_player = (_unit == player);

    if ((!_is_player) && (_distance < ST_STHud_Close)) exitWith
    {
        Mkr_ColourOrange;
    };

    private "_colour";
    _colour = switch (_team_colour) do
    {
        case "MAIN": {if (_is_player) then {Mkr_ColourWhite} else {Mkr_ColourLightGrey}};
        case "RED": {Mkr_ColourRed};
        case "BLUE": {Mkr_ColourLightBlue};
        case "GREEN": {Mkr_ColourGreen};
        case "YELLOW": {Mkr_ColourYellow};
        default {Mkr_ColourGreen}
    };

    if (_distance < ST_STHud_MaxDist) then
    {
        _colour set [3, 0.8];
    }
    else
    {
        private "_alpha";
        _alpha = (0 max (ST_STHud_FadeEdge - _distance)) / ST_STHud_EdgeStep;
        _alpha = 0.8 min _alpha;
        _colour set [3, _alpha];
    };

    if (_is_player) then
    {
        _colour set [3, 1];
    };

    _colour;
};

// Update names in schedule space as it's less time critical
ST_STHud_UpdateNames =
{
    private ["_units", "_uc"];
    _units = [];
    _uc = 0;
    {
        if (!isNull(_x)) then
        {
            private "_cache";
            _cache = _x getVariable "ST_STHud_Name";
            if (alive(_x) || !isNil "_cache") then
            {
                _units set [_uc, _x];
                _uc = _uc + 1;
            };
        }
    } forEach (units(player));

    private ["_team_text", "_team_text2"];
    _team_text = "<t align='left'>";
    _team_text2 = "<t align='left'>";

    // TODO: investigate BIS_fnc_alignTabs instead.
    {
        private "_unit";
        _unit = _x;

        // Update name list
        if (_forEachIndex < 6) then
        {
            _team_text = format ["%1<t color='#%4'><img image='%2'/>%3</t><br/>",
                _team_text,
                _unit call ST_STHud_GetIconPicture,
                _unit call ST_STHud_GetName,
                _unit call ST_STHud_GetTextColour
            ];
        }
        else
        {
            _team_text2 = format ["%1<t color='#%4'><img image='%2'/>%3</t><br/>",
                _team_text2,
                _unit call ST_STHud_GetIconPicture,
                _unit call ST_STHud_GetName,
                _unit call ST_STHud_GetTextColour
            ];
        };
    } forEach (_units);

    _team_text = _team_text + "</t>";
    _team_text2 = _team_text2 + "</t>";
    HUD_TEXT ctrlSetStructuredText parseText _team_text;
    HUD_TEXT2 ctrlSetStructuredText parseText _team_text2;
};

ST_STHud_PerFrameUpdate =
{
    call ST_STHud_BackgroundUpdate;

    private ["_units", "_uc"];
    _units = [];
    _uc = 0;
    {
        if (!isNull(_x)) then
        {
            private "_cache";
            _cache = _x getVariable "ST_STHud_Name";
            if (alive(_x) || !isNil "_cache") then
            {
                _units set [_uc, _x];
                _uc = _uc + 1;
            };
        }
    } forEach (units(player));

    // Calculate the look direction of the camera
    private ["_vecOrigin", "_vecZ", "_lookDir", "_playerPos"];
    _vecOrigin = positionCameraToWorld [0,0,0];
    _vecZ = positionCameraToWorld [0,0,1];
    _lookDir = ANGLE_xy(_vecZ, _vecOrigin);
    _playerPos = getPosATL(player);
    //_playerPos = visiblePosition(player);
    // Ignore height
    _playerPos set [2, 0];

    // isUsingTeams determines whether to use the classic colour scheme
    // or using assigned teams (assignTeam or command UI)
    private "_isUsingTeams";
    _isUsingTeams = ({_x call ST_STHud_HasAssignedTeam} count _units) > 0;

    {
        private "_unit";
        _unit = _x;

        // Calculate the unit's bearing to the player which allows the relative
        // position of that unit to be determined.
        //
        // The final relative position also takes the look direction of the
        // camera into account.

        private ["_unitPos", "_distance", "_bearingTo", "_offset", "_mapPos"];
        _unitPos = getPosATL(_unit);
        // Ignore height
        _unitPos set [2, 0];

        _distance = _unitPos distance _playerPos;
        _bearingTo = ANGLE_xy(_unitPos, _playerPos) - _lookDir;

        _offset = [];
        _offset set [0, _distance * sin(_bearingTo) * ST_STHud_AutoScale];
        _offset set [1, _distance * cos(_bearingTo) * ST_STHud_AutoScale];

        _mapPos = ST_STHud_referenceTarget modelToWorld _offset;

        // Rotate the unit marker based on unit rotation, works inside vehicles too.
        _vecUnit = vectorDir(vehicle(_unit));
        _curUnitDir = (_vecUnit select 0) atan2 (_vecUnit select 1);
        _adjustedDir = _curUnitDir - _lookDir;

        private "_colour";
        _colour = [0,0,0,1];
        if (_isUsingTeams) then
        {
            _colour = [_unit, _distance] call ST_STHud_GetColour_FromTeam;
        }
        else
        {
            _colour = [_unit, _distance] call ST_STHud_GetColour;
        };


        private "_markerSize";
        _markerSize = 24 * 0.8;
        if (vehicle _unit != _unit) then {
            if (driver vehicle _unit == _unit) then {
                _markerSize = _markerSize * 0.55;
            } else {
                _markerSize = _markerSize * 0.5;
            };
        };

        HUD_MAP drawIcon [
            _unit call ST_STHud_GetIconPicture,
            _colour,
            _mapPos,
            _markerSize,
            _markerSize,
            _adjustedDir,
            "",
            false
        ];
    } forEach units(player);

    if (ST_STHud_ShowCompass && ("ItemCompass" in assignedItems player)) then
    {
        _lookDir call ST_STHud_CompassUpdate;
    };
};

// Calculate this once instead of per compass update
ST_STHud_CompassData = [
    [0,   12,        "N"],
    [90,  12 * 0.85, "E"],
    [180, 12 * 0.85, "S"],
    [270, 12 * 0.85, "W"]
];

ST_STHud_CompassScale = 0; // Updated once map control is stable
{
    _x set [2, format ["\z\a3cs\addons\main\data\empty.paa", _x select 2]];
} forEach ST_STHud_CompassData;

ST_STHud_CompassUpdate =
{
    private "_lookDir";
    _lookDir = _this;

    {
        private ["_bearing", "_size", "_image"];
        _bearing = _x select 0;
        _size = _x select 1;
        _image = _x select 2;

        private "_mapPos";
        _mapPos = ST_STHud_referenceTarget modelToWorld [
            ST_STHud_CompassScale * sin(_bearing - _lookDir),
            ST_STHud_CompassScale * cos(_bearing - _lookDir),
            0
        ];

        HUD_MAP drawIcon [
            _image,
            [1,1,1,0.65],
            _mapPos,
            _size,
            _size,
            _bearing - _lookDir,
            "",
            false
        ];
    } forEach ST_STHud_CompassData;
};

ST_STHud_BackgroundUpdate =
{
    {
        // Draw outline
        HUD_MAP drawEllipse [
            ST_STHud_ConstCentre,
            _x * ST_STHud_AutoScale, _x * ST_STHud_AutoScale,
            0,
            [0, 0, 0, 1],
            ""
        ];

        // Draw inner
        HUD_MAP drawEllipse [
            ST_STHud_ConstCentre,
            _x * ST_STHud_AutoScale, _x * ST_STHud_AutoScale,
            0,
            [0, 0, 0, 0.4],
            "#(rgb,1,1,1)color(0,0,0,1)"
        ];
    } forEach [ST_STHud_MaxDist, ST_STHud_MidDist, ST_STHud_MinDist];
};
