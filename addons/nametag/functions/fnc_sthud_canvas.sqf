// How to use STUI_drawLine3d:
/*
drawLineTest =
{
    {
        _source = positionCameraToWorld [0,0,1];
        _dest = ASLtoATL(visiblePositionASL(_x));
        [_source, _dest, [1,0,0,0.5]] call STUI_drawLine3d;
    } forEach(vehicle(player) nearEntities ["All", 40]);
};
"drawLineTest" call STUI_Canvas_Add;
*/

#define GET_CANVAS (uiNamespace getVariable "STUI_Canvas")
#define CANVAS_BORDER 0.02

if (isNil "STUI_Canvas_Funcs") then
{
    STUI_Canvas_Funcs = [];
};


// functionName call STUI_Canvas_Add
STUI_Canvas_Add =
{
    private "_funcName";
    _funcName = _this;
    if (isNil _funcName) exitWith
    {
        -1;
    };
    if (_funcName in STUI_Canvas_Funcs) exitWith {};
    STUI_Canvas_Funcs set [count STUI_Canvas_Funcs, _funcName];
};

// functionName call STUI_Canvas_Remove
STUI_Canvas_Remove =
{
    private "_funcName";
    _funcName = _this;
    STUI_Canvas_Funcs = STUI_Canvas_Funcs - [_funcName];
};

STUI_drawIcon3d =
{
    private ["_screen_pos", "_colour", "_texture", "_angle"];
    _screen_pos = _this select 0;
    if (isNil "_screen_pos") exitWith {};
    _colour = _this select 1;
    if (isNil "_colour") exitWith {};
    _texture = _this select 2;
    if (isNil "_texture") exitWith {};
    _angle = _this select 3;
    if (isNil "_angle") exitWith {};

    if (count(_screen_pos) != 2) exitWith {};
    if (count(_colour) != 4) exitWith {};

    private "_draw_pos";
    _draw_pos = GET_CANVAS ctrlMapScreenToWorld _screen_pos;
    /*
    GET_CANVAS drawIcon [
        _texture,
        _colour,
        _draw_pos,
        24, 24,
        _angle,
        "",
        false
    ];
    */
};

// If you already have 2d screen coordinates
STUI_drawLine2d =
{
    private ["_start", "_end", "_colour"];
    _start = _this select 0;
    _end = _this select 1;
    _colour = _this select 2;

    private ["_draw_start_pos", "_draw_end_pos"];
    _draw_start_pos = GET_CANVAS ctrlMapScreenToWorld _start;
    _draw_end_pos = GET_CANVAS ctrlMapScreenToWorld _end;

    GET_CANVAS drawLine [
        _draw_start_pos,
        _draw_end_pos,
        _colour
    ];
};

// Takes world space coordinates
STUI_drawLine3d =
{
    private ["_start", "_end", "_colour"];
    if (count(_this select 0) != 3) exitWith {};
    if (count(_this select 1) != 3) exitWith {};
    if (count(_this select 2) != 4) exitWith {};

    _start = worldToScreen(_this select 0);
    if (count(_start) != 2) exitWith {};

    _end = worldToScreen(_this select 1);
    if (count(_end) != 2) exitWith {};

    _colour = _this select 2;

    private ["_draw_start_pos", "_draw_end_pos"];
    _draw_start_pos = GET_CANVAS ctrlMapScreenToWorld _start;
    _draw_end_pos = GET_CANVAS ctrlMapScreenToWorld _end;

    GET_CANVAS drawLine [
        _draw_start_pos,
        _draw_end_pos,
        _colour
    ];
};


// These numbers were chosen based on Nou's CCIP Canvas and STHUD
#define STUI_Canvas_ConstZoom 0.0001
#define STUI_Canvas_ConstCentre [25, 26, 0]

STUI_Canvas_Profile = false;
STUI_Canvas_ProfileData = [];

STUI_Canvas_OnLoad =
{
    uiNamespace setVariable ["STUI_Canvas",  (_this select 0) displayCtrl 0];

    GET_CANVAS ctrlMapAnimAdd [0, STUI_Canvas_ConstZoom, STUI_Canvas_ConstCentre];
    ctrlMapAnimCommit GET_CANVAS;

    [] spawn
    {
        // ctrlMapScreenToWorld doesn't give useful results until the map is
        // stable. Sadly this isn't immediately after ctrlMapAnimCommit returns
        // even if the time is zero.
        waitUntil {ctrlMapAnimDone GET_CANVAS};

        // De-offset the map so it's visible now the anim has finished
        // This avoids a flicker within the first few frames of the game caused
        // by the map visibly scrolling to the right place.
        private "_map_pos";
        _map_pos = ctrlPosition GET_CANVAS;
        _map_pos set [1, (_map_pos select 1) + 100];
        GET_CANVAS ctrlSetPosition _map_pos;
        GET_CANVAS ctrlCommit 0;

        // Find the top edge of the map control in screen space, slightly inset.
        // We want to find it relative to where the map control is centered so
        // when we find the distance between these two points later on, we
        // cancel out certain rounding errors.
        private ["_top_s", "_half_height"];
        _top_s = GET_CANVAS ctrlMapWorldToScreen STUI_Canvas_ConstCentre;
        _half_height = 0.5 * (_map_pos select 3);
        _top_s set [1, (_top_s select 1) + _half_height - CANVAS_BORDER];

        // Project this point back into the world
        private "_top_w";
        _top_w = GET_CANVAS ctrlMapScreenToWorld _top_s;

        // This seemingly redundant step is to ensure our world space
        // coordinates have experienced the same form of rouding error.
        private ["_mid_s", "_mid_w"];
        _mid_s = GET_CANVAS ctrlMapWorldToScreen STUI_Canvas_ConstCentre;
        _mid_w = GET_CANVAS ctrlMapScreenToWorld _mid_s;

        GET_CANVAS ctrlAddEventHandler ["Draw", "if (visibleMap) exitWith {}; call STUI_Canvas_Update"];

        // Canvas ready for business
        STUI_Canvas_Active = true;
    };
};


STUI_Canvas_Update =
{
    {
        private ["_funcName", "_start"];
        _funcName = _x;
        if (STUI_Canvas_Profile) then
        {
            _start = diag_tickTime;
        };

        call (missionNamespace getVariable _funcName);

        if (STUI_Canvas_Profile) then
        {
            STUI_Canvas_ProfileData set [count STUI_Canvas_ProfileData, [_funcName, diag_tickTime - _start]];
            if ((diag_frameno % 10) == 0) then
            {
                diag_log STUI_Canvas_ProfileData;
                STUI_Canvas_ProfileData = [];
            };
        };
    } forEach STUI_Canvas_Funcs;
};

STUI_Canvas_Init =
{
    6465 cutRsc ["STUI_Canvas", "Plain"];
};

"STUI_Canvas_Init" call STUI_Register_Restart;
