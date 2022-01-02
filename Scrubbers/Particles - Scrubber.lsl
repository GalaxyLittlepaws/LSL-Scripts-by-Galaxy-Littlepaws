// Find more of my scripts here: https://github.com/GalaxyLittlepaws/LSL-Scripts-by-Galaxy-Littlepaws
//
// This script removes particles from an object, then removes itself

default
{
    state_entry()
    {
        llParticleSystem([]); // No more particles
        llSleep(3); // Wait 3 seconds to ensure it went through
        llRemoveInventory(llGetScriptName()); // Remove self from object
    }
}
