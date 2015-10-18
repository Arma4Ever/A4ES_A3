if (!hasInterface) exitWith {};

if (isNil "STUI_Restart_Funcs") then
{
    STUI_Restart_Funcs = [];
};

// Register a function name to call when needing to restart things.
STUI_Register_Restart =
{
    private "_funcName";
    _funcName = _this;
    if (typeName(_funcName) != "STRING") exitWith
    {
        diag_log ["STUI Error: Only function names are to be passed into STUI_Register_Restart. Bad Value:", _funcName];
        false;
    };

    if (isNil _funcName) exitWith
    {
        diag_log ["STUI Error: Undefined restart function", _funcName];
        false;
    };

    // Check if already registered this name
    if (_funcName in STUI_Restart_Funcs) exitWith {true};

    STUI_Restart_Funcs set [count STUI_Restart_Funcs, _funcName];
    true;
};

if (isNil "ST_STHud_Init") then
{
    call a3cs_nametag_fnc_sthud_hud_core;
    call a3cs_nametag_fnc_sthud_hud_update;
    //call compile preprocessFileLineNumbers "\@sthud\addons\sthud\hud_core.sqf";
    //call compile preprocessFileLineNumbers "\@sthud\addons\sthud\hud_update.sqf";
};

if (isNil "STUI_Canvas_Init") then
{
    //call compile preprocessFileLineNumbers "\@sthud\addons\sthud\canvas.sqf";
    call a3cs_nametag_fnc_sthud_canvas;
};

STUI_OnRestart =
{
    //diag_log ["STUI begin restart", diag_tickTime];

    {
        //diag_log ["STUI restart", diag_tickTime, "Calling:", _x];
        call (missionNamespace getVariable _x);
    } forEach STUI_Restart_Funcs;

    //diag_log ["STUI Restarted", diag_tickTime];
};

#define STUI_CANVAS (uiNamespace getVariable ["STUI_Canvas", controlNull])

STUI_Save_Supervisor =
{
    if(!a3cs_nametag_enableSthud) exitWith {};
    waitUntil
    {
        if (isNull STUI_CANVAS) then
        {
            call STUI_OnRestart;
        };
        false;
    };
};

call ST_STHud_Init;

if (!isNil "STUI_Save_SupervisorH") then
{
    terminate STUI_Save_SupervisorH;
};

if(!a3cs_nametag_enableSthud) exitWith {};

STUI_Save_SupervisorH  = [] spawn STUI_Save_Supervisor;
