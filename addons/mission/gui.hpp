class RscDisplayEmpty;
class GVAR(invisibleGearFix): RscDisplayEmpty {
    onLoad = QUOTE(\
        [] call FUNC(fixInvisibleGear);\
        (_this select 0) closeDisplay 0;\
    );
};
