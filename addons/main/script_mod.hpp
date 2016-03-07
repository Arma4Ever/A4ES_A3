// COMPONENT should be defined in the script_component.hpp and included BEFORE this hpp

#define MAINPREFIX z
#define PREFIX a3cs

#define MAJOR 0
#define MINOR 6
#define PATCHLVL 8
#define BUILD 0

#define VERSION MAJOR.MINOR.PATCHLVL.BUILD
#define VERSION_AR MAJOR,MINOR,PATCHLVL,BUILD

#define ACE_TAG A.C.E.
#define A3CS_TAG A3CS

#define A3CS_VERSION 0.6.8
#define A3CS_VERSION_ARRAY {0,6,8}

#define REQUIRED_VERSION 1.56

//wylacz debug przed release!
#define A3CS_DEBUG_ENABLED
