
#include "\z\a3cs\addons\common\ui\define.hpp"
#include "ui\idcAdminPanel.hpp"
#include "ui\idcDebugConsole.hpp"

class RscTitle;
class RscHTML;
class RscText;
class RscEdit;
class RscButtonMenu;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscStandardDisplay;
class RscControlsGroupNoScrollbars;
class RscXSliderH;
class A3CS_ui_buttonBase;
class A3CS_ui_backgroundBase;
class A3CS_ui_comboBoxBase;
class A3CS_ui_staticBase;
class A3CS_ui_listNBoxBase;

#include "ui\openAdminPanel.hpp"
#include "ui\adminPanel.hpp"
#include "ui\debugConsole.hpp"

class RscDisplayMPInterrupt: RscStandardDisplay {
    class controls {
        class A3CS_openAdminPanel : A3CS_openAdminPanel {
            idc = 5040;
            text = CSTRING(AdminPanel);
            action = QUOTE(call DFUNC(openAdminPanel));
        };
    };
};
class RscDisplayInterrupt: RscStandardDisplay {
    class controls {
        class A3CS_openAdminPanel : A3CS_openAdminPanel {
            idc = 5040;
            text = CSTRING(AdminPanelSP);
            action = QUOTE(call DFUNC(openAdminPanel));
        };
    };
};
