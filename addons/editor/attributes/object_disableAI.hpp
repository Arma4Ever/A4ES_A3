class GVAR(disableAI) {
    collapsed = 1;
    displayName = CSTRING(DisableAI);
    class Attributes {
        class GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_TARGET);
            tooltip = CSTRING(DisableAI_TARGET_Tooltip);
            property = QGVAR(DisableAI_TARGET);
            control = "Checkbox";
            expression = "if (_value) then {_this disableAI 'TARGET';};";
            defaultValue = "false";
            condition = "objectBrain";
        };
        class GVAR(DisableAI_AUTOTARGET): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_AUTOTARGET);
            tooltip = CSTRING(DisableAI_AUTOTARGET_Tooltip);
            property = QGVAR(DisableAI_AUTOTARGET);
            expression = "if (_value) then {_this disableAI 'AUTOTARGET';};";
        };
        class GVAR(DisableAI_MOVE): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_MOVE);
            tooltip = CSTRING(DisableAI_MOVE_Tooltip);
            property = QGVAR(DisableAI_MOVE);
            expression = "if (_value) then {_this disableAI 'MOVE';};";
        };
        class GVAR(DisableAI_ANIM): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_ANIM);
            tooltip = CSTRING(DisableAI_ANIM_Tooltip);
            property = QGVAR(DisableAI_ANIM);
            expression = "if (_value) then {_this disableAI 'ANIM';};";
        };
        class GVAR(DisableAI_TEAMSWITCH): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_TEAMSWITCH);
            tooltip = CSTRING(DisableAI_TEAMSWITCH_Tooltip);
            property = QGVAR(DisableAI_TEAMSWITCH);
            expression = "if (_value) then {_this disableAI 'TEAMSWITCH';};";
        };
        class GVAR(DisableAI_FSM): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_FSM);
            tooltip = CSTRING(DisableAI_FSM_Tooltip);
            property = QGVAR(DisableAI_FSM);
            expression = "if (_value) then {_this disableAI 'FSM';};";
        };
        class GVAR(DisableAI_WEAPONAIM): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_WEAPONAIM);
            tooltip = CSTRING(DisableAI_WEAPONAIM_Tooltip);
            property = QGVAR(DisableAI_WEAPONAIM);
            expression = "if (_value) then {_this disableAI 'WEAPONAIM';};";
        };
        class GVAR(DisableAI_AIMINGERROR): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_AIMINGERROR);
            tooltip = CSTRING(DisableAI_AIMINGERROR_Tooltip);
            property = QGVAR(DisableAI_AIMINGERROR);
            expression = "if (_value) then {_this disableAI 'AIMINGERROR';};";
        };
        class GVAR(DisableAI_SUPPRESSION): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_SUPPRESSION);
            tooltip = CSTRING(DisableAI_SUPPRESSION_Tooltip);
            property = QGVAR(DisableAI_SUPPRESSION);
            expression = "if (_value) then {_this disableAI 'SUPPRESSION';};";
        };
        class GVAR(DisableAI_CHECKVISIBLE): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_CHECKVISIBLE);
            tooltip = CSTRING(DisableAI_CHECKVISIBLE_Tooltip);
            property = QGVAR(DisableAI_CHECKVISIBLE);
            expression = "if (_value) then {_this disableAI 'CHECKVISIBLE';};";
        };
        class GVAR(DisableAI_COVER): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_COVER);
            tooltip = CSTRING(DisableAI_COVER_Tooltip);
            property = QGVAR(DisableAI_COVER);
            expression = "if (_value) then {_this disableAI 'COVER';};";
        };
        class GVAR(DisableAI_AUTOCOMBAT): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_AUTOCOMBAT);
            tooltip = CSTRING(DisableAI_AUTOCOMBAT_Tooltip);
            property = QGVAR(DisableAI_AUTOCOMBAT);
            expression = "if (_value) then {_this disableAI 'AUTOCOMBAT';};";
        };
        class GVAR(DisableAI_PATH): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_PATH);
            tooltip = CSTRING(DisableAI_PATH_Tooltip);
            property = QGVAR(DisableAI_PATH);
            expression = "if (_value) then {_this disableAI 'PATH';};";
        };
        class GVAR(DisableAI_MINEDETECTION): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_MINEDETECTION);
            tooltip = CSTRING(DisableAI_MINEDETECTION_Tooltip);
            property = QGVAR(DisableAI_MINEDETECTION);
            expression = "if (_value) then {_this disableAI 'MINEDETECTION';};";
        };
        class GVAR(DisableAI_NVG): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_NVG);
            tooltip = CSTRING(DisableAI_NVG_Tooltip);
            property = QGVAR(DisableAI_NVG);
            expression = "if (_value) then {_this disableAI 'NVG';};";
        };
        class GVAR(DisableAI_LIGHTS): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_LIGHTS);
            tooltip = CSTRING(DisableAI_LIGHTS_Tooltip);
            property = QGVAR(DisableAI_LIGHTS);
            expression = "if (_value) then {_this disableAI 'LIGHTS';};";
        };
        class GVAR(DisableAI_RADIOPROTOCOL): GVAR(DisableAI_TARGET) {
            displayName = CSTRING(DisableAI_RADIOPROTOCOL);
            tooltip = CSTRING(DisableAI_RADIOPROTOCOL_Tooltip);
            property = QGVAR(DisableAI_RADIOPROTOCOL);
            expression = "if (_value) then {_this disableAI 'RADIOPROTOCOL';};";
        };
    };
};
