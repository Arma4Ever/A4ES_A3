#define COMPONENT squadradar
#define COMPONENT_BEAUTIFIED Squad radar
#include "\z\a3cs\addons\main\script_mod.hpp"

#define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
#define ENABLE_PERFORMANCE_COUNTERS

#include "\z\a3cs\addons\main\script_macros.hpp"

#define IDC_RSCRADAR_RADARBG 5700
#define IDC_RSCRADAR_RADAR 5701
#define IDC_RSCRADAR_MEMBERLIST 5702

#define RADAR_BASE_ICON_SIZE 17
#define RADAR_MAX_UNIT_DISTANCE 22
#define RADAR_FADE_MIN_UNIT_DISTANCE 20
#define RADAR_SPECIALSTATEUNITS_UPDATE_INTERVAL 1;
#define MEMBERLIST_COLUMN_ROWS 6

#define HIDE_MAP_MARKER(markerClass) class markerClass {\
    icon = "#(argb,8,8,3)color(0,0,0,0)"; \
    size = 0; \
    importance = 0; \
    coefMin = 0; \
    coefMax = 0; \
    color[] = {0,0,0,0}; \
}
