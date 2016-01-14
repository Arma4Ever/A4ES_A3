call a3cs_nametag_fnc_sthud_hud_update;
call a3cs_nametag_fnc_sthud_hud_assignedTeam;

//call compile preprocessFileLineNumbers "\@sthud\addons\sthud\hud_update.sqf";
//call compile preprocessFileLineNumbers "\@sthud\addons\sthud\hud_assignedTeam.sqf";

#define SHOW_HUD ((cameraView in ["INTERNAL","EXTERNAL","GUNNER"]) && alive(player) && isNil("BIS_DEBUG_CAM") && (count(units(player)) > 1))

#define HUD_MAP  (uiNamespace getVariable "ST_STHud_Map")
#define HUD_TEXT (uiNamespace getVariable "ST_STHud_Text")
#define HUD_TEXT2 (uiNamespace getVariable "ST_STHud_Text2")

#define ST_STHud_ShowNone 0
#define ST_STHud_ShowMap  1
#define ST_STHud_ShowNames 2
#define ST_STHud_ShowBoth 3

// Amount (in ui coordinates) to offset the top of the map control when
// calcuating the right scale
#define HUD_BORDER 0.004

// Random layer for now, maybe CBA will have interop layer management later
ST_STHud_Layer = 643;

ST_STHud_Close   = 3;
ST_STHud_MinDist = 15;
ST_STHud_MidDist = 30;
ST_STHud_MaxDist = 50;
ST_STHud_EdgeStep = 10;
ST_STHud_FadeEdge = ST_STHud_MaxDist + ST_STHud_EdgeStep;

ST_STHud_ShownUI = ST_STHud_ShowBoth;
ST_STHud_ShowCompass = true;

ST_STHud_UpdateUI =
{
    if(!a3cs_nametag_enableSthud) exitWith {
        HUD_MAP ctrlShow false;
        HUD_TEXT ctrlShow false;
        HUD_TEXT2 ctrlShow false;
    };

    switch (ST_STHud_ShownUI) do
    {
        case ST_STHud_ShowNone:
        {
            HUD_MAP ctrlShow false;
            HUD_TEXT ctrlShow false;
            HUD_TEXT2 ctrlShow false;
        };
        case ST_STHud_ShowMap:
        {
            HUD_MAP ctrlShow true;
            HUD_TEXT ctrlShow false;
            HUD_TEXT2 ctrlShow false;
        };
        case ST_STHud_ShowNames:
        {
            HUD_MAP ctrlShow false;
            HUD_TEXT ctrlShow true;
            HUD_TEXT2 ctrlShow true;
        };
        case ST_STHud_ShowBoth:
        {
            HUD_MAP ctrlShow true;
            HUD_TEXT ctrlShow true;
            HUD_TEXT2 ctrlShow true;
        };
    };
};

// Cache use of name so we can retrieve the name of dead units without causing
// rpt spam.  Should handle disconnects and JIP by also caching whether the
// unit is a player or not.
// TODO: When unit dies, it is replaced by another object without existing
// setVariables being preseved. Calling name on this object results in
// "Error: no unit" being returned.
ST_STHud_GetName =
{
    private ["_obj", "_value"];
    _obj = _this;
    if (isNull _obj) exitWith {""};

    _value = _obj getVariable "ST_STHud_Name";
    if (isNil "_value") then
    {
        if (!alive(_obj)) then
        {
            diag_log ["STHud: dead non-unit in group", _obj];
            // TODO: tried to recover unit name by other means.
            _value = [false, "???"];
        }
        else
        {
            _value = [isPlayer(_obj), _obj call ST_STHud_GetNameShort];
        };
        _obj setVariable ["ST_STHud_Name", _value];
    };

    if (!alive(_obj)) exitWith
    {
        _value select 1;
    };

    private "_changed";
    // Can't compare two bools in SQF!
    // Try it: hint format ["%1", true == true];
    _changed = (
            ( isPlayer(_obj) && !(_value select 0)) ||
            (!isPlayer(_obj) &&  (_value select 0))
            );
    if (_changed) then
    {
        // This can happen when a player in your group disconnects and his
        // unit becomes AI or when a player JIPs into a unit in your group.
        _value = [isPlayer(_obj), _obj call ST_STHud_GetNameShort];
        _obj setVariable ["ST_STHud_Name", _value];
    };
    _value select 1;
};

// Wrapper around name(_this) but clamp length.
// Not an ideal fix to names causing wrapping but it'll do for now.
ST_STHud_MaxNameLen = 15;

ST_STHud_GetNameShort =
{
    private ["_name", "_name_arr"];
    _name = name(_this);
    _name_arr = toArray(_name);
    if (count(_name_arr) < ST_STHud_MaxNameLen) exitWith
    {
        _name
    };

#define DOT 46
    _name_arr set [ST_STHud_MaxNameLen - 2, DOT];
    _name_arr set [ST_STHud_MaxNameLen - 1, DOT];
    _name_arr set [ST_STHud_MaxNameLen,     DOT];
    _name_arr set [ST_STHud_MaxNameLen + 1, 0];
#undef DOT

    toString(_name_arr);
};

// This is now a constant value with the new type of map control
// This number was chosen based on Nou's CCIP Canvas
#define ST_STHud_ConstZoom 0.0001

ST_STHud_AutoScale = 0; // Gets set properly once the map control is up

// Shouldn't need to be changed. This should be a #define but it's used in
// another file and makepbo is refusing to pack header files for some reason.
// This number was chosen based on Nou's CCIP Canvas
ST_STHud_ConstCentre = [21, 21, 0];

if (isNil "ST_STHud_referenceTarget") then
{
    // Used for modelToWorld purposes
    // Technically you're not supposed to pass Logic through to createVehicle
    // any more.
    ST_STHud_referenceTarget = "Logic" createVehicleLocal ST_STHud_ConstCentre;
    ST_STHud_referenceTarget setPosATL ST_STHud_ConstCentre;

    // Prevent terrain from causing skewed results
    ST_STHud_referenceTarget setVectorUp [0,0,1];
    ST_STHud_referenceTarget setDir 0;
};

// unit call ST_STHud_GetTextColour -> RRGGBB
ST_STHud_GetTextColour =
{
    switch (assignedTeam _this) do {
        case "MAIN": {"FFFFFF"};
        case "RED": {"FFAAAA"};
        case "BLUE": {"AAAAFF"};
        case "GREEN": {"AAFFAA"};
        case "YELLOW": {"FFFFAA"};
        default {"FFFFFF"}
    };
};

// Only limited support for this for now
ST_STHud_GetMarkerName =
{
    private "_unit";
    _unit = _this;

    if (getNumber(configFile >> "CfgVehicles" >> typeOf(_unit) >> "attendant") == 1) exitWith
    {
        "ST_STHudM_Medic";
    };

    if (getNumber(configFile >> "CfgVehicles" >> typeOf(_unit) >> "engineer") == 1) exitWith
    {
        "ST_STHudM_Engineer";
    };

    if (leader(_unit) == _unit) exitWith
    {
        "ST_STHudM_Leader";
    };

    // This appears to be the most consistent way to detect that a weapon is an
    // MG of some sort. These pictures are the overlays for the BIS team hud.
    if (getText(configFile >> "CfgWeapons" >> primaryWeapon(_unit) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_mg_ca.paa") exitWith
    {
        "ST_STHudM_MG";
    };

    // Do something similar for launchers.
    if (getText(configFile >> "CfgWeapons" >> secondaryWeapon(_unit) >> "UIPicture") == "\a3\weapons_f\data\ui\icon_at_ca.paa") exitWith
    {
        "ST_STHudM_AT";
    };

    "ST_STHudM_Rifleman";
};

ST_STHud_GetIconPicture =
{
    private ["_unit", "_marker"];
    _unit = _this;
    _marker = _unit call ST_STHud_GetMarkerName;
    getText(configFile >> "CfgMarkers" >> _marker >> "icon");
};

ST_STHud_Load =
{
    uiNamespace setVariable ["ST_STHud_Disp", _this select 0];
    uiNamespace setVariable ["ST_STHud_Text", (_this select 0) displayCtrl 0];
    uiNamespace setVariable ["ST_STHud_Text2", (_this select 0) displayCtrl 1];
    uiNamespace setVariable ["ST_STHud_Map",  (_this select 0) displayCtrl 2];

    HUD_MAP ctrlMapAnimAdd [0, ST_STHud_ConstZoom, ST_STHud_ConstCentre];
    ctrlMapAnimCommit HUD_MAP;

    [] spawn
    {
        // ctrlMapScreenToWorld doesn't give useful results until the map is
        // stable. Sadly this isn't immediately after ctrlMapAnimCommit returns
        // even if the time is zero.
        waitUntil {ctrlMapAnimDone HUD_MAP};

        // De-offset the map so it's visible now the anim has finished
        // This avoids a flicker within the first few frames of the game caused
        // by the map visibly scrolling to the right place.
        private "_map_pos";
        _map_pos = ctrlPosition HUD_MAP;
        _map_pos set [1, (_map_pos select 1) + 100];
        HUD_MAP ctrlSetPosition _map_pos;
        HUD_MAP ctrlCommit 0;

        // Find the top edge of the map control in screen space, slightly inset.
        // We want to find it relative to where the map control is centered so
        // when we find the distance between these two points later on, we
        // cancel out certain rounding errors.
        private ["_top_s", "_half_height"];
        _top_s = HUD_MAP ctrlMapWorldToScreen ST_STHud_ConstCentre;
        _half_height = 0.5 * (_map_pos select 3);
        _top_s set [1, (_top_s select 1) + _half_height - HUD_BORDER];

        // Project this point back into the world
        private "_top_w";
        _top_w = HUD_MAP ctrlMapScreenToWorld _top_s;

        // This seemingly redundant step is to ensure our world space
        // coordinates have experienced the same form of rouding error.
        private ["_mid_s", "_mid_w"];
        _mid_s = HUD_MAP ctrlMapWorldToScreen ST_STHud_ConstCentre;
        _mid_w = HUD_MAP ctrlMapScreenToWorld _mid_s;

        // Now we have two world space points which correspond to the centre
        // of the HUD and the top edge. This allows us to find the right scale
        // value which will fit ST_STHud_MaxDist metres into the map control.
        ST_STHud_AutoScale = abs((_mid_w select 1) - (_top_w select 1)) / ST_STHud_MaxDist;

        // Fit the compass symbols slightly inside the outer ring.
        ST_STHud_CompassScale = (ST_STHud_MaxDist - 3) * ST_STHud_AutoScale;
    };

    HUD_TEXT ctrlSetTextColor [1, 1, 1, 0.8];
    HUD_TEXT ctrlSetScale 0.8;
    HUD_TEXT ctrlCommit 0;
    HUD_TEXT2 ctrlSetTextColor [1, 1, 1, 0.8];
    HUD_TEXT2 ctrlSetScale 0.8;
    HUD_TEXT2 ctrlCommit 0;
};

ST_STHud_Init =
{
    if (!isNil "ST_STHud_MapMarkerHandle") then
    {
        terminate ST_STHud_MapMarkerHandle;
    };

    if (!isNil "ST_STHud_AssignedTeamWatcherHandle") then
    {
        terminate ST_STHud_AssignedTeamWatcherHandle;
    };

    if(!a3cs_nametag_enableSthud) exitWith {call ST_STHud_UpdateUI;};

    // Workarounds for assignedTeam not working properly in MP, see below for details
    ST_STHud_AssignedTeamWatcherHandle = [] spawn ST_STHud_AssignedTeamWatcher;
    player setVariable ["ST_STHud_lastGroup", group(player), false];

    ST_STHud_MapMarkerHandle = [] spawn
    {
        while {true} do
        {
            if(!a3cs_nametag_enableSthud) exitWith {call ST_STHud_UpdateUI;};

            ST_STHud_ToRestart = false;

            waitUntil{sleep 1; SHOW_HUD};

            ST_STHud_AutoScale = 0;

            ST_STHud_Layer cutRsc ["ST_STHud_Rsc", "PLAIN"];

            // Gets set by the onLoad event once the map's anim completes
            waitUntil {ST_STHud_AutoScale != 0};

            HUD_MAP ctrlSetEventHandler ["Draw", "call ST_STHud_PerFrameUpdate"];

            call ST_STHud_UpdateUI;

            while {SHOW_HUD && (!ST_STHud_ToRestart)} do
            {
                if(!a3cs_nametag_enableSthud) exitWith {call ST_STHud_UpdateUI;};

                call ST_STHud_UpdateUI;
                call ST_STHud_UpdateNames;
                sleep 0.1;
            };
            HUD_MAP ctrlSetEventHandler ["Draw", ""];
            ST_STHud_Layer cutText ["", "PLAIN"];
        };
    };
};

ST_STHud_Reload =
{
    call a3cs_nametag_fnc_sthud_hud_core;
    //call compile preprocessFileLineNumbers "\@sthud\addons\sthud\hud_core.sqf";
    diag_log "Reloaded and compiled STHud...";
    ST_STHud_ToRestart = true;
    diag_log "Restarted STHud...";
};

ST_STHud_Restart =
{
    ST_STHud_ToRestart = true;
};

"ST_STHud_Restart" call STUI_Register_Restart;
