
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
class RscListbox;
class ctrlEdit;
class RscCombo;

#include "ui\define.hpp"
#include "ui\idcListBox.hpp"
#include "ui\idcEditBox.hpp"
#include "ui\baseDialogs.hpp"
#include "ui\idcAdminPanel.hpp"
#include "ui\idcDebugConsole.hpp"

#include "ui\openAdminPanel.hpp"
#include "ui\adminPanel.hpp"
#include "ui\debugConsole.hpp"

class RscDisplayMPInterrupt: RscStandardDisplay {
    class controls {
        class A4ES_openAdminPanel : A4ES_openAdminPanel {
            idc = 5040;
            text = CSTRING(AdminPanel);
            action = QUOTE(call DFUNC(openAdminPanel));
        };
    };
};
class RscDisplayInterrupt: RscStandardDisplay {
    class controls {
        class A4ES_openAdminPanel : A4ES_openAdminPanel {
            idc = 5040;
            text = CSTRING(AdminPanelSP);
            action = QUOTE(call DFUNC(openAdminPanel));
        };
    };
};
