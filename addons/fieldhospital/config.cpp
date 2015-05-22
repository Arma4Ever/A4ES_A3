#include "script_component.hpp"
class CfgPatches
{
    class ADDON
    {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a3cs_main"};
        version = A3CS_VERSION;
        versionStr = A3CS_VERSION;
        versionAr[] = A3CS_VERSION_ARRAY;
        author[] = {"SzwedzikPL", "ACE3 Team"};
        authorUrl = "http://arma3coop.pl";
    };
};
class CfgVehicles
{
    class Camping_base_F;
    class A3CS_Fieldhospital: Camping_base_F
    {
        displayName = "Szpital polowy";
        vehicleClass = "a3cs_common";
        author = "$STR_A3_Bohemia_Interactive";
        scope = 2;
        scopeCurator = 2;
        model = "\A3\Structures_F_Bootcamp\Civ\Camping\PartyTent_01_F.p3d";
        icon = "iconObject_1x1";
        destrType = "DestructTent";
        cost = 100;
        armor = 3;
        mapSize = 13.06;
        hiddenSelections[] = {"Camo_1"};
        hiddenSelectionsTextures[] = {PATHTOF(data\fieldhospital_01_co.paa)};
        class EventHandlers {
            init = "(_this select 0) setVariable [""ace_medical_isMedicalFacility"", true]";
        };
    };
};