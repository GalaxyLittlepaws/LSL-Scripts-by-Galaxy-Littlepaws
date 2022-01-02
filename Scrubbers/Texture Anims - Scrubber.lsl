// Find more of my scripts here: https://github.com/GalaxyLittlepaws/LSL-Scripts-by-Galaxy-Littlepaws
//
// This script removes texture animations and then removes itself from the object.

default
{
    state_entry()
    {
        llSetTextureAnim(FALSE, ALL_SIDES, 0, 0, 0.0, 0.0, 1.0); //Remove the texture animations from all sides
        llSleep(3); // Wait 3 seconds to ensure it went through
        llRemoveInventory(llGetScriptName()); //Remove self from object
    }
}
