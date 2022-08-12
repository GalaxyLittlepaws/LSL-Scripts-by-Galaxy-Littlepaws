// Find more of my scripts here: https://github.com/GalaxyLittlepaws/LSL-Scripts-by-Galaxy-Littlepaws
//
// This script removes floating text from the object, then removes itself.

default
{
    state_entry()
    {
        llSetText("", <((float)0), ((float)0), ((float)0)>, 0); // Removes the floating text
        llSleep(3); // Wait 3 seconds to ensure it went through
        llRemoveInventory(llGetScriptName()); // Remove self from object
    }
}
