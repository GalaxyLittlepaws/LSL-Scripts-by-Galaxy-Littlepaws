// Find more of my scripts here: https://github.com/GalaxyLittlepaws/LSL-Scripts-by-Galaxy-Littlepaws
//
// This script stops an object from spinning, then removes itself.

default
{
    state_entry()
    {
        llTargetOmega(<((float)0), ((float)0), ((float)0)>, 0, 0); // No spinning
        llSleep(3); // Wait a bit to be sure it worked
        llRemoveInventory(llGetScriptName()); // Remove self from the object
    }
}
