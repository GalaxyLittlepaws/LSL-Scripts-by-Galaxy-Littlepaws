// Find more of my scripts here: https://github.com/GalaxyLittlepaws/LSL-Scripts-by-Galaxy-Littlepaws
//
// This script stops an object from spinning, then removes itself.

default
{
    state_entry()
    {
        llTargetOmega(<0,0,0>, 0, 0); // No spinning!
        llSleep(3); //Wait 3 seconds to ensure it went through
        llRemoveInventory(llGetScriptName()); // Remove self from object
    }
}
