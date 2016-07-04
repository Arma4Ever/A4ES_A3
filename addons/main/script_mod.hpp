// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define MAINPREFIX z
#define PREFIX a3cs

#define MAJOR 0
#define MINOR 7
#define PATCHLVL 2
#define BUILD 0

#define VERSION MAJOR.MINOR.PATCHLVL
#define VERSION_AR MAJOR,MINOR,PATCHLVL

#define REQUIRED_VERSION 1.6
#define REQUIRED_CBA_VERSION {2,4,1}

#define AUTHOR_CONFIG \
    author = "$STR_A3CS_Main_ModAuthor"; \
    authorUrl = "$STR_A3CS_Main_ModAuthorURL"; \
    url = "$STR_A3CS_Main_ModAuthorURL"
