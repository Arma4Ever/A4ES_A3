class Display3DEN
{
	class ContextMenu: ctrlMenu
	{
		class Items
		{
			#include "contextMenu.hpp"
		};
	};
	class Controls
	{
		#include "statusbar.hpp"
		class MenuStrip: ctrlMenuStrip
		{
            class Items
			{
				// items[] += {};
				#include "menuStrip_tools.hpp"
				#include "menuStrip_help.hpp"
			};
		};
	};
};
