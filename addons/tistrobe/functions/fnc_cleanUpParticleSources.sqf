#include "script_component.hpp"
/*
 * Author: SzwedzikPL
 * Cleanups deleted particle sources
 */
LOG(cleanUpParticleSources);

GVAR(particleSources) = GVAR(particleSources) select {!(isNull _x)};
