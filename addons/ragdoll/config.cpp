#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"a4es_common", "A3_Data_F", "A3_Modules_F", "A3_Data_F_aow_Loadorder"};
        author = ECSTRING(main,Author);
        authors[] = {"venomDeejays", "SzwedzikPL"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

/*
    Based on work of venomDeejays's mod "Ragdoll Physics Plus".
    https://github.com/venomDeejays/Ragdoll-Physics-Plus
*/

class PhysXMaterials {
    // base friction multiplier, don't touch this
    class PhysXMaterialBase {
        isDefault = "false";
        isAnisotropic = "false";
        restitution = 0.050000001;
        staticFriction = 0.75;
        dynamicFriction = 0.55000001;
    };
    // ragdoll friction multiplier
    class Ragdoll: PhysXMaterialBase {
        restitution = 0.15000001;
        staticFriction = 0.64999998;
        dynamicFriction = 0.55000001;
    };
};

class PhysXParams {
    // the below definitions handle explosion force. I'd suggest to keep it on the lower side
    // higher settings have unstable results, ex. at higher values, if a unit is damaged but not killed by an explosion, then is killed by a projectile, the unit inherits the explosion force on death
    // these settings haven't been changed in awhile, i can't say what each parameter does individually. try increasing certain parameters individually, then test and note what each change does.
    epeImpulseDamageCoef = 3;
    impulseForceRagdollCoef = 10;
    impulseTorqueRagdollCoef = 25;
    impulseSpeedRagdollCoef = 1;
    maxRagdollImpulseForceMagnitude = 30;
    maxRagdollImpulseTorqueMagnitude = 10;
    // underwater ragdoll parameters
    // buoyancy is glitchy, i'd suggest keeping it at the default value
    // adjust the resistance to make them sink slower/faster. the lower the value, the faster they sink	
    ragdollUnderwaterForceCoef = 9.6000004;
    ragdollUnderwaterInitImpulseCoef = 0.98000002;
    ragdollUnderwaterBuoyancyCoef = 9.7;
    ragdollUnderwaterResistanceCoef = 0.15;
    // collision settings
    // speed limit - how fast an object has to move to force ragdoll
    ragdollOnCollideSpeedLimit = 4;
    ragdollOnCollideMassLimit = 200;
    ragdollOnCollideForceCoef = 0.1;
    ragdollOnCollideMaxForce = 1;
    ragdollOnCollideMaxOffset = 10;
    ragdollOnCollideMaxOffsetSpeed = 100;
    // hit parameters control the spazzy hit reactions and when they trigger, current paramaters disable the hit reactions
    ragdollHitTime = 0.1;
    ragdollHitForceCoef = 0.0099999998;
    ragdollHitDmgLimit = 0.60000002;
    // enable/disable ragdoll collisons with physx objects
    ragdollVehicleCollision = 1;
    wheelPointRejectLimitSpeed = 5;
    wheelPointRejectAngle = "Pi/4.0";
    wheelPointRejectAngleFast = "Pi/3.0";
    wheelNormalRejectAngle = "Pi/4.0";
    wheelNormalRejectAngleFast = "Pi/2.4";
};

class RagDollDefaultLimit {
    value = 5;
    restitution = 1;
    hardness = 1;
};

class RagDollDefaultSpring {
    enabled = 1;
    value = 5;
    damper = 0;
    targetValue = 0;
};

class RagDollSphericalJoint {
    class TwistLimitLow: RagDollDefaultLimit {};
    class TwistLimitHigh: RagDollDefaultLimit {};
    class SwingLimit: RagDollDefaultLimit {};
    class TwistSpring: RagDollDefaultSpring {
        enabled = 1;
        damper = 0;
    };
    class SwingSpring: RagDollDefaultSpring {
        enabled = 1;
        damper = 0;
    };
    class JointSpring: RagDollDefaultSpring {
        enabled = 1;
        damper = 0;
    };
    type = "spherical";
    enableCollision = 1;
    projectionDistance = 15;
    projectionMode = "point";
};

class RagDollRevoluteJoint {
    class LimitLow: RagDollDefaultLimit {};
    class LimitHigh: RagDollDefaultLimit {};
    class Spring: RagDollDefaultSpring {
        enabled = 1;
    };
    type = "revolute";
    enableCollision = 1;
    projectionDistance = 15;
    projectionMode = "point";
};

// common paramaters for ragdoll skeleton
// if one of the below paramaters is not defined for a limb under JointsPX3, it will fall back to use these settings
// ex. if the left arm does not have swingSpring defined, it will use swingSpring = 0
// recommended to adjust these values individually per bone, listed under class JointsPX3. only adjust the below values if you want universal settings per bone, just make sure to delete the entry listed in the bone you want to edit
class RagDollD6Joint_PX3 {
    type = "D6";
    // enable collision with other parts of the skeleton. 0 = no collision, 1 = collision
    enableCollision = 0;
    // i can't exactly say what projection does, but it does seem to have some sort of effect if increased to a high enough value. its true function is unknown
    projectionDistance = 15;
    projectionMode = "point";
    // swing limit refers to the range of motion of the limb. Y value = forward/backward, Z value = side to side
    swingLimitY = 10;
    swingLimitZ = 10;
    // spring refers to the desire of the limb to go back to its default position. low value = looser limb, high value = the limb will want to snap back into place
    swingSpring = 0;
    // damping controls how fast the limb freely moves, low value = fast motion, high value = slow motion
    swingDamping = 0;
    // still undecided on how restitution works, a value higher than 1 seems to have weird/glitchy results on the skeleton.
    swingRestitution = 0.30000001;
    // i can't say how contact distance actually functions, but tweaking does have some interesting results. old RPP used a higher value, current version has the settings restored to default (0.05)
    // seems like it makes the limb want to stay closer to adjacent limb at higher values
    swingContactDistance = 0.050000001;
    // twist refers to the limb being able to, well, twist. lower value is one direction, upper is the opposite direction.
    twistLimitLower = 90;
    twistLimitUpper = 90;
    twistSpring = 0;
    twistDamping = 0;
    twistRestitution = 0.40000001;
    twistContactDistance = 0.050000001;
    //drive is similar to the standard spring/damp values, except it has a more exaggerated effect. 
    driveSpring = 0;
    driveDamping = 100;
    driveMaxForce = 100;
    driveUseAcceleration = 1;
    // make the defined limb have a velocity based on X/Y/Z. linear doesn't seem to have an effect, angular velocity will make the limb move in the assigned direction. positive and negative values are accepted
    driveLinearVelocity[] = {0,0,0};
    driveAngularVelocity[] = {0,0,0};
};

class CfgRagDollSkeletons {
    class BaseRagdoll {
        primaryWeaponBone = "";
        secondaryWeaponBone = "";
        weaponSleepLinearVelocity = 0.1;
        weaponSleepAngularVelocity = 0.1;
        weaponDropMinTime = 1;
        weaponDropMaxTime = 3;
        weaponDistanceLimit = 0.1;
        weaponDistanceLimitTime = 2;
        // the minimum amount of velocity the ragdoll has to be traveling to prevent it from freezing, until the MaxTime threshold has been met. Then it will freeze, regardless if its moving or not
        sleepLinearVelocity = 0.1;
        sleepAngularVelocity = 0.1;
        // minimum/maximum simulation time. set MaxTime to a high number to prevent freezing. higher numbers will impact FPS
        simulateMinTime = 30;
        simulateMaxTime = 180;
        simulateDistanceLimit = 0.5;
        simulateDistanceLimitTime = 2;
        recoveryBlendTime = 0.0099999998;
        recoveryCosLimit = -1;
        recoveryDistLimit = 100;
        animBlendTime = 0;
    };

    //don't touch these
    class Soldier: BaseRagdoll {
        primaryWeaponBone = "weapon";
        secondaryWeaponBone = "launcher";
        draggingMask = "dragging";
        hitMask = "hit";
        class WeaponLinkBones {
            class LinkBone1 {
                bone = "leftHand";
                canBeDropped = 1;
                prefference = 1;
            };
            class LinkBone2 {
                bone = "rightHand";
                canBeDropped = 1;
                prefference = 1;
            };
            class LinkBone3 {
                bone = "chest";
                canBeDropped = 1;
                prefference = 2;
            };
        };
        class Masks {
            class DraggingMask {
                name = "dragging";
                mask[] =  {
                    {
                        "pelvis",
                        0,
                        1
                    },
                    {
                        "chest",
                        0,
                        1
                    },
                    {
                        "head",
                        1,
                        0
                    },
                    {
                        "leftArm",
                        1,
                        0
                    },
                    {
                        "leftForeArm",
                        1,
                        0
                    },
                    {
                        "leftHand",
                        1,
                        0
                    },
                    {
                        "rightArm",
                        1,
                        0
                    },
                    {
                        "rightForeArm",
                        1,
                        0
                    },
                    {
                        "rightHand",
                        1,
                        0
                    },
                    {
                        "leftUpLeg",
                        1,
                        0
                    },
                    {
                        "leftLeg",
                        1,
                        0
                    },
                    {
                        "leftFoot",
                        1,
                        0
                    },
                    {
                        "rightUpLeg",
                        1,
                        0
                    },
                    {
                        "rightLeg",
                        1,
                        0
                    },
                    {
                        "rightFoot",
                        1,
                        0
                    },
                    {
                        "weapon",
                        0.2,
                        1
                    },
                    {
                        "launcher",
                        0,
                        1
                    }
                };
            };
            class HitMask {
                name = "hit";
                mask[] =  {
                    {
                        "pelvis",
                        0,
                        1
                    },
                    {
                        "chest",
                        1,
                        0
                    },
                    {
                        "head",
                        1,
                        0
                    },
                    {
                        "leftArm",
                        1,
                        0
                    },
                    {
                        "leftForeArm",
                        1,
                        0
                    },
                    {
                        "leftHand",
                        1,
                        0
                    },
                    {
                        "rightArm",
                        1,
                        0
                    },
                    {
                        "rightForeArm",
                        1,
                        0
                    },
                    {
                        "rightHand",
                        1,
                        0
                    },
                    {
                        "leftUpLeg",
                        0,
                        1
                    },
                    {
                        "leftLeg",
                        0,
                        1
                    },
                    {
                        "leftFoot",
                        0,
                        1
                    },
                    {
                        "rightUpLeg",
                        0,
                        1
                    },
                    {
                        "rightLeg",
                        0,
                        1
                    },
                    {
                        "rightFoot",
                        0,
                        1
                    },
                    {
                        "weapon",
                        0,
                        1
                    },
                    {
                        "launcher",
                        0,
                        1
                    }
                };
            };
        };
        class BaseRagdollBone {
            material = "Ragdoll";
            childrenUseStartTrans = 1;
        };
        // this is where you can edit the mass of certain bones, and the size of the bones hitbox, defined in XYZ values
        // hitbox values do not apply to live units, only ragdolls
        // certain types of bones only have certain properties available to them, ex. the head is a sphere bone, so it only has a radius and an offset control. trying to use the offset control on another type of bone doesn't work
        // the hitbox of capsule joints (arms, legs) unfortunately cannot be edited
        // lower mass values result in greater hit reactions from projectiles, but ragdolls will fall slower
        // higher values result in a heavier ragdoll that doesn't respond as well to projectile hits, but will fall quicker
        // keep in mind that adjusting the mass will arbitrarily manipulate the ragdolls center of gravity!
        class Bones {
            class Pelvis: BaseRagdollBone {
                name = "pelvis";
                type = "box";
                size[] = {0.135,0.10,0.22};
                startBone = "pelvis";
                endBone = "spine2";
                mass = 86;
            };
            class Chest: BaseRagdollBone {
                name = "chest";
                startBone = "spine2";
                endBone = "head";
                type = "box";
                size[] = {0.145,0.10,0.15};
                mass = 113;
            };
            class Head: BaseRagdollBone {
                name = "head";
                type = "sphere";
                startBone = "head";
                offset[] = {0,-0.1,0};
                mass = 38;
                radius = 0.11;
            };
            class LeftArm: BaseRagdollBone {
                name = "leftArm";
                type = "capsule";
                startBone = "leftArm";
                endBone = "leftForeArm";
                mass = 24;
            };
            class LeftForeArm: BaseRagdollBone {
                name = "leftForeArm";
                type = "capsule";
                startBone = "leftForeArm";
                endBone = "leftHand";
                mass = 16;
            };
            class LeftHand: BaseRagdollBone {
                name = "leftHand";
                type = "sphere";
                startBone = "leftHand";
                mass = 6;
                radius = 0.079999998;
                childrenUseStartTrans = 0;
            };
            class RightArm: BaseRagdollBone {
                name = "rightArm";
                type = "capsule";
                startBone = "rightArm";
                endBone = "rightForeArm";
                mass = 24;
            };
            class RightForeArm: BaseRagdollBone {
                name = "rightForeArm";
                type = "capsule";
                startBone = "rightForeArm";
                endBone = "rightHand";
                mass = 16;
            };
            class RightHand: BaseRagdollBone {
                name = "rightHand";
                type = "sphere";
                startBone = "rightHand";
                mass = 6;
                radius = 0.079999998;
                childrenUseStartTrans = 0;
            };
            class LeftUpLeg: BaseRagdollBone {
                name = "leftUpLeg";
                type = "capsule";
                startBone = "leftUpLeg";
                endBone = "leftLeg";
                mass = 48;
            };
            class LeftLeg: BaseRagdollBone {
                name = "leftLeg";
                type = "capsule";
                startBone = "leftLeg";
                endBone = "leftFoot";
                mass = 23;
            };
            class LeftFoot: BaseRagdollBone {
                name = "leftFoot";
                type = "box";
                startBone = "leftFoot";
                size[] = {0.15000001,0.050000001,0.07};
                mass = 12;
            };
            class RightUpLeg: BaseRagdollBone {
                name = "rightUpLeg";
                type = "capsule";
                startBone = "rightUpLeg";
                endBone = "rightLeg";
                mass = 48;
            };
            class RightLeg: BaseRagdollBone {
                name = "rightLeg";
                type = "capsule";
                startBone = "rightLeg";
                endBone = "rightFoot";
                mass = 23;
            };
            class RightFoot: BaseRagdollBone {
                name = "rightFoot";
                type = "box";
                startBone = "rightFoot";
                size[] = {0.15000001,0.050000001,0.07};
                mass = 12;
            };
            class Weapon: BaseRagdollBone {
                name = "weapon";
                type = "weapon";
                startBone = "weapon";
                endPosRelToStart[] = {0,0,0.40000001};
                mass = 4;
            };
            class Launcher: BaseRagdollBone {
                name = "launcher";
                type = "weapon";
                startBone = "launcher";
                endPosRelToStart[] = {0,0,0.40000001};
                mass = 9;
            };
        };
        // here is where you can change the individual settings for each bone
        // remember, if you do not define any parameter for the bone, it will fall back to the default parameters listed in class RagDollD6Joint_PX3
        // ex. if you delete the driveSpring and driveDamping entries from a certain bone, it will default to the same value listed under class RagDollD6Joint_PX3
        class JointsPX3 {
            class Pelvis_Chest_PX3: RagDollD6Joint_PX3 {
                name = "pelvis_chest";
                bone1 = "pelvis";
                bone2 = "chest";
                axis[] = {0,1,0.30000001};
                enableCollision = 0;
                swingLimitY = 30;
                swingLimitZ = 45;
                twistLimitLower = -65;
                twistLimitUpper = 65;
                driveLinearVelocity[] = {1000,1000,0};
                driveAngularVelocity[] = {0,0,0};
                driveSpring = 150;
                driveDamping = 30;
                driveSpringWater = 5;
                driveDampingWater = 5;
            };
            class Chest_Head_PX3: RagDollD6Joint_PX3 {
                name = "chest_head";
                bone1 = "chest";
                bone2 = "head";
                enableCollision = 1;
                swingLimitY = 20;
                swingLimitZ = 34;
                twistLimitLower = -60;
                twistLimitUpper = 60;
                driveLinearVelocity[] = {1000,1000,10};
                driveAngularVelocity[] = {1,0,0};
                driveSpring = 15;
                driveDamping = 30;
                driveSpringWater = 1;
                driveDampingWater = 3;
                twistSpring = 0;
                twistDamping = 0;
            };
            class Chest_LeftArm_PX3: RagDollD6Joint_PX3 {
                name = "chest_leftArm";
                bone1 = "chest";
                bone2 = "leftArm";
                enableCollision = 1;
                projectionDistance = 1;
                swingLimitY = 120;
                swingLimitZ = 30;
                twistLimitLower = -30;
                twistLimitUpper = 120;
                driveLinearVelocity[] = {0,0,0};
                driveAngularVelocity[] = {0,0,0};
                swingSpring = 500;
                swingDamping = 150;
                twistSpring = 0;
                twistDamping = 0;
                driveSpring = 25;
                driveDamping = 100;
                swingRestitution = 1;
                twistRestitution = 1;				
                driveSpringWater = 3;
                driveDampingWater = 3;
            };
            class Chest_RightArm_PX3: RagDollD6Joint_PX3 {
                name = "chest_rightArm";
                bone1 = "chest";
                bone2 = "rightArm";
                enableCollision = 1;
                projectionDistance = 1;
                swingLimitY = 120;
                swingLimitZ = 30;
                twistLimitLower = -30;
                twistLimitUpper = 120;
                driveLinearVelocity[] = {0,0,0};
                driveAngularVelocity[] = {0,0,0};
                swingSpring = 500;
                swingDamping = 150;
                twistSpring = 0;
                twistDamping = 0;
                swingRestitution = 1;
                twistRestitution = 1;
                driveSpring = 25;
                driveDamping = 100;
                driveSpringWater = 3;
                driveDampingWater = 3;
            };
            class Pelvis_LeftUpLeg_PX3: RagDollD6Joint_PX3 {
                name = "pelvis_leftUpLeg";
                bone1 = "pelvis";
                bone2 = "leftUpLeg";
                enableCollision = 0;
                swingLimitY = 1;
                swingLimitZ = 45;
                twistLimitLower = -31;
                twistLimitUpper = 45;
                swingSpring = 300;
                swingDamping = 150;
                twistSpring = 2500;
                twistDamping = 2500;
                driveSpring = 350;
                driveDamping = 15;
                driveMaxForce = 0.25;
                driveUseAcceleration = 1;
                swingContactDistance = 0.050000001;
                twistContactDistance = 0.050000001;
                swingRestitution = 0;
                twistRestitution = 0;
                driveLinearVelocity[] = {1000,1000,0};
                driveAngularVelocity[] = {0,0,0};
                driveSpringWater = 3;
                driveDampingWater = 3;
            };
            class Pelvis_RightUpLeg_PX3: RagDollD6Joint_PX3 {
                name = "pelvis_rightUpLeg";
                bone1 = "pelvis";
                bone2 = "rightUpLeg";
                enableCollision = 0;
                swingLimitY = 1;
                swingLimitZ = 45;
                twistLimitLower = -45;
                twistLimitUpper = 31;
                swingSpring = 300;
                swingDamping = 150;
                twistSpring = 2500;
                twistDamping = 2500;
                driveSpring = 350;
                driveDamping = 15;
                driveMaxForce = 0.25;
                driveUseAcceleration = 1;
                swingRestitution = 0;
                twistRestitution = 0;
                swingContactDistance = 0.050000001;
                twistContactDistance = 0.050000001;
                driveLinearVelocity[] = {1000,1000,0};
                driveAngularVelocity[] = {0,0,0};
                driveSpringWater = 3;
                driveDampingWater = 3;
            };
            class LeftArm_LeftForeArm_PX3: RagDollD6Joint_PX3 {
                name = "leftArm_leftForeArm";
                bone1 = "leftArm";
                bone2 = "leftForeArm";
                enableCollision = 1;
                axis[] = {-1,1,-0.2};
                swingLimitY = 10;
                swingLimitZ = 10;
                twistLimitLower = -5;
                twistLimitUpper = 150;
                driveLinearVelocity[] = {1000,1000,10};
                driveAngularVelocity[] = {0,0,1};
                driveSpring = 10;
                driveDamping = 1;
                driveSpringWater = 1;
                driveDampingWater = 1;
            };
            class RightArm_RightForeArm_PX3: RagDollD6Joint_PX3 {
                name = "rightArm_rightForeArm";
                bone1 = "rightArm";
                bone2 = "rightForeArm";
                enableCollision = 0;
                axis[] = {-1,-1,0.2};
                swingLimitY = 10;
                swingLimitZ = 10;
                twistLimitLower = -5;
                twistLimitUpper = 150;
                driveLinearVelocity[] = {1000,1000,10};
                driveAngularVelocity[] = {0,0,1};
                driveSpring = 10;
                driveDamping = 1;
                driveSpringWater = 1;
                driveDampingWater = 1;
            };
            class LeftForeArm_LeftHand_PX3: RagDollD6Joint_PX3 {
                name = "leftForeArm_leftHand";
                bone1 = "leftForeArm";
                bone2 = "leftHand";
                enableCollision = 0;
                swingLimitY = 45;
                swingLimitZ = 45;
                twistLimitLower = -50;
                twistLimitUpper = 50;
                driveLinearVelocity[] = {1000,1000,10};
                driveAngularVelocity[] = {0,0,1};
                driveSpring = 25;
                driveDamping = 50;
                driveSpringWater = 1;
                driveDampingWater = 1;
            };
            class RightForeArm_RightHand_PX3: RagDollD6Joint_PX3 {
                name = "rightForeArm_rightHand";
                bone1 = "rightForeArm";
                bone2 = "rightHand";
                enableCollision = 1;
                swingLimitY = 45;
                swingLimitZ = 45;
                twistLimitLower = -50;
                twistLimitUpper = 50;
                driveLinearVelocity[] = {1000,1000,10};
                driveAngularVelocity[] = {0,0,1};
                driveSpring = 25;
                driveDamping = 50;
                driveSpringWater = 1;
                driveDampingWater = 1;
            };
            class LeftUpLeg_LeftLeg_PX3: RagDollD6Joint_PX3 {
                name = "leftUpLeg_leftLeg";
                bone1 = "leftUpLeg";
                bone2 = "leftLeg";
                enableCollision = 0;
                axis[] = {1,0,0};
                swingLimitY = 1;
                swingLimitZ = 0;
                twistLimitLower = 0;
                twistLimitUpper = 90;
                swingSpring = 0;
                swingDamping = 0;
                twistSpring = 3000;
                twistDamping = 50;
                swingRestitution = 0;
                twistRestitution = 1;
                swingContactDistance = 0.050000001;
                twistContactDistance = 0.050000001;
                driveSpring = 10;
                driveDamping = 0;
                driveMaxForce = 1000;
                driveUseAcceleration = 0;
                driveSpringWater = 2;
                driveDampingWater = 2;
            };
            class RightUpLeg_RightLeg_PX3: RagDollD6Joint_PX3 {
                name = "rightUpLeg_rightLeg";
                bone1 = "rightUpLeg";
                bone2 = "rightLeg";
                enableCollision = 0;
                axis[] = {1,0,0};
                swingLimitY = 1;
                swingLimitZ = 0;
                twistLimitLower = 0;
                twistLimitUpper = 90;
                swingSpring = 0;
                swingDamping = 0;
                twistSpring = 3000;
                twistDamping = 50;
                swingRestitution = 0;
                twistRestitution = 1;
                swingContactDistance = 0.050000001;
                twistContactDistance = 0.050000001;
                driveSpring = 10;
                driveDamping = 0;
                driveMaxForce = 1000;
                driveUseAcceleration = 0;
                driveSpringWater = 2;
                driveDampingWater = 2;
            };
            class LeftLeg_LeftFoot_PX3: RagDollD6Joint_PX3 {
                name = "leftLeg_leftFoot";
                bone1 = "leftLeg";
                bone2 = "leftFoot";
                axis[] = {1,0,0};
                enableCollision = 1;
                swingLimitY = 5;
                swingLimitZ = 21;
                twistLimitLower = -5;
                twistLimitUpper = 45;
                driveLinearVelocity[] = {1000,1000,10};
                driveAngularVelocity[] = {0,0,25};
                swingSpring = 1200;
                swingDamping = 150;				
                twistSpring = 600;
                twistDamping = 50;				
                driveSpring = 1;
                driveDamping = 30;
                driveSpringWater = 2;
                driveDampingWater = 2;
            };
            class RightLeg_RightFoot_PX3: RagDollD6Joint_PX3 {
                name = "rightLeg_rightFoot";
                bone1 = "rightLeg";
                bone2 = "rightFoot";
                axis[] = {1,0,0};
                enableCollision = 1;
                swingLimitY = 5;
                swingLimitZ = 21;
                twistLimitLower = -5;
                twistLimitUpper = 45;
                driveLinearVelocity[] = {1000,1000,10};
                driveAngularVelocity[] = {0,0,-25};
                swingSpring = 1200;
                swingDamping = 150;				
                twistSpring = 600;
                twistDamping = 50;				
                driveSpring = 1;
                driveDamping = 30;
                driveSpringWater = 2;
                driveDampingWater = 2;
            };
        };
    };
};