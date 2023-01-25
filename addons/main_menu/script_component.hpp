#define COMPONENT main_menu
#include "\z\a4es\addons\main\script_mod.hpp"

#include "\a3\ui_f\hpp\defineCommonGrids.inc"
#include "\a3\ui_f\hpp\defineResincl.inc"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE

#ifdef DEBUG_ENABLED_MAIN_MENU
    #define DEBUG_MODE_FULL
#endif
    #ifdef DEBUG_SETTINGS_MAIN_MENU
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MAIN_MENU
#endif

#include "\z\a4es\addons\main\script_macros.hpp"

#define POS_X(N) ((N) * GUI_GRID_W + GUI_GRID_CENTER_X)
#define POS_Y(N) ((N) * GUI_GRID_H + GUI_GRID_CENTER_Y)
#define POS_W(N) ((N) * GUI_GRID_W)
#define POS_H(N) ((N) * GUI_GRID_H)

#define IDC_SERVERSTATUS_TITLE 1000
#define IDC_SERVERSTATUS_DESCRIPTION 1001
#define IDC_SERVERSTATUS_PASSWORD 1002
#define IDC_SERVERSTATUS_LOGIN 1003
#define IDC_SERVERSTATUS_MISSIONS 1004
