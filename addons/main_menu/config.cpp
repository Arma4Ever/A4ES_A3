#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a4es_common", "a3_ui_f"};
        author = ECSTRING(main,Author);
        authors[] = {"veteran29", "SzwedzikPL"};
        url = CSTRING(URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

class RscStandardDisplay;
class RscVignette;
class RscControlsGroupNoScrollbars;
class RscText;
class RscStructuredText;
class RscTitle;
class RscPicture;
class RscPictureKeepAspect;
class RscVideo;
class RscButton;
class RscButtonMenu;
class RscButtonMenuOK;
class RscButtonMenuCancel;
class RscEdit;

class RscMainMenuSpotlight: RscControlsGroupNoScrollbars {
	class Controls {
		class GroupPicture: RscControlsGroupNoScrollbars {
			class Controls {
				class Picture: RscPictureKeepAspect {};
				class Video: RscVideo {};
			};
		};
		class GroupHover: RscControlsGroupNoScrollbars {
			class Controls {
				class Overlay: RscPicture {};
				class LineLeft: RscText {};
				class LineRight: LineLeft {};
				class LineTop: LineLeft {};
				class LineBottom: LineTop {};
			};
		};
		class TextBackground: RscPicture {};
		class Text: RscStructuredText {};
		class Button: RscButton {};
	};
};

#include "CfgMainMenuSpotlight.hpp"
#include "gui.hpp"
