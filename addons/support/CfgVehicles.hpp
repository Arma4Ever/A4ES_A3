
class SensorTemplatePassiveRadar;
class SensorTemplateAntiRadiation;
class SensorTemplateActiveRadar;
class SensorTemplateIR;
class SensorTemplateVisual;
class SensorTemplateMan;
class SensorTemplateLaser;
class SensorTemplateNV;
class SensorTemplateDataLink;
class DefaultVehicleSystemsDisplayManagerLeft {
    class components;
};
class DefaultVehicleSystemsDisplayManagerRight {
    class components;
};

class Eventhandlers;
class CfgVehicles {
    class NonStrategic;
    class StaticShip;
    class Building;
    class House_F;
    class FloatingStructure_F;
    class thingx;
    class Ship;
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class Turrets;
        class HitPoints;
    };
    class StaticMGWeapon: StaticWeapon {
        class Turrets: Turrets {
            class MainTurret;
        };
        class Components;
    };
    class B_Ship_MRLS_01_base_F: StaticMGWeapon {
        class Components: Components {
            class SensorsManagerComponent {
                class Components {
                    class DataLinkSensorComponent: SensorTemplateDataLink {
                        class AirTarget {
                            minRange = 64000;
                            maxRange = 64000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = -1;
                        };
                        class GroundTarget {
                            minRange = 64000;
                            maxRange = 64000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = -1;
                        };
                    };
                };
            };
        };

        class Turrets: Turrets {
            class MainTurret: MainTurret {
                class Components: Components {
                    class VehicleSystemsDisplayManagerComponentLeft: DefaultVehicleSystemsDisplayManagerLeft {
                        class Components {
                            class SensorDisplay {
                                componentType = "SensorsDisplayComponent";
                                range[] = {64000, 32000, 16000, 8000, 4000};
                                resource = "RscCustomInfoSensors";
                            };
                        };
                    };
                    class VehicleSystemsDisplayManagerComponentRight: DefaultVehicleSystemsDisplayManagerRight {
                        class Components {
                            class SensorDisplay {
                                componentType = "SensorsDisplayComponent";
                                range[] = {64000, 32000, 16000, 8000, 4000};
                                resource = "RscCustomInfoSensors";
                            };
                        };
                    };
                };
            };
        };
    };
    class B_Ship_MRLS_01_F: B_Ship_MRLS_01_base_F {};
};
