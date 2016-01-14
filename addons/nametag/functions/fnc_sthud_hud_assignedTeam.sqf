// Workaround for assignedTeam not working as desired in 1.60 (team assignments
// are not broadcast in MP)
//
// The workaround is pretty grotty, but enough people asked for this feature
// that I'll just Deal With It.
//
// The basic jist is that the group's leader client will watch for changes to
// assigned teams and broadcast them.
// Everyone uses a wrapped version of assignedTeam which fetches the "shared"
// version of this value.
//
// Subtleties to look out for:
// - Leader of group changes -> Copy the "shared" data to the engine before
//   checking for changes.
// - Someone else joining your group -> discard their assigned team
// - Joining an existing group -> discard your own, everyone else discards too
//
// We don't call assignTeam "locally" unless we're the group leader because
// if the command is fixed to broadcast changes in multiplayer, you'll get
// every group member broadcasting to everyone else until an update can be
// pushed out to every user of STHud.
//
// As a minor optimisation, most of this code doesn't execute in singleplayer.

#define  HUD_ASSIGNEDTEAM "ST_STHud_assignedTeam"

// [] spawn ST_STHud_AssignedTeamWatcher -> nothing
ST_STHud_AssignedTeamWatcher =
{
    /*
    // Nothing to do in SP
    if (!isMultiplayer) exitWith {};

    if(!a3cs_nametag_enableSthud) exitWith {};

    // Before we start the main loop, check to see if any units have had their
    // team assigned e.g. via unit init and push that into our system.
    if (leader(player) == player) then
    {
        {
            private "_unit";
            _unit = _x;

            // Update the shared data if it doesn't match the data from the engine
            if (assignedTeam(_unit) != (_unit call ST_STHud_assignedTeam)) then
            {
                _unit setVariable [HUD_ASSIGNEDTEAM, assignedTeam(_unit), true];
            };
        } forEach(units(player));
    };

    while {true} do
    {
        if(!a3cs_nametag_enableSthud) exitWith {};

        // Wait until player is group leader
        waitUntil {sleep 2; leader(player) == player};

        // Ensure the engine is using the latest values from the shared version
        // This preserves team assignments when the group's leader changes
        {
            private "_unit";
            _unit = _x;

            _unit assignTeam (_unit call ST_STHud_assignedTeam);
        } forEach(units(player));

        // While the unit remains the group leader, ensure all other team
        // members are using the values set locally.
        while {leader(player) == player} do
        {
            if(!a3cs_nametag_enableSthud) exitWith {};
            {
                private "_unit";
                _unit = _x;

                // Update the shared data if it doesn't match the data from the engine
                if (assignedTeam(_unit) != (_unit call ST_STHud_assignedTeam)) then
                {
                    _unit setVariable [HUD_ASSIGNEDTEAM, assignedTeam(_unit), true];
                };
            } forEach(units(player));
            sleep 5;
        };
    };
    */
};

// unit call ST_STHud_assignedTeam -> "MAIN" etc.
ST_STHud_assignedTeam =
{
    private "_unit";
    _unit = _this;

    if (true) exitWith {assignedTeam _unit};

    /*
    // Assume MAIN if not defined, which avoids any complex behaviour
    _assigned_team = _unit getVariable [HUD_ASSIGNEDTEAM, "MAIN"];

    // Early exit if not using teams
    if (_assigned_team == "MAIN") exitWith {"MAIN"};

    // Special behaviour when checking the unit colour of the player
    if (_unit == player) then
    {
        // If we've changed groups since last check, discard our existing team
        private "_last_group";
        _last_group = player getVariable ["ST_STHud_lastGroup", grpNull];
        if (group(player) != _last_group) then
        {
            _last_group = group(player);
            player setVariable ["ST_STHud_lastGroup", _last_group, false];

            // TODO: Should we broadcast this or just let the clients figure
            // this out independently?
            _unit setVariable [HUD_ASSIGNEDTEAM, "MAIN", true];
            _assigned_team = "MAIN";
        };
    };

    _assigned_team;
    */
};

// unit call ST_STHud_HasAssignedTeam -> true/false
ST_STHud_HasAssignedTeam =
{
    "MAIN" != (_this call ST_STHud_assignedTeam);
};
