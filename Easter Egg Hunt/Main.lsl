// Notes: Place this script inside the prim that will be clicked on for the hunt.
// There is an optional API script that can be used to add external functionality, such as logging points to a database or talking with other obnjects during the hunt.



integer points = 0; // Change this to the number of points the hunted object is worth. If this hunt will not use points, then keep it 0.

integer needGroup = 0; // Change this to 1 if you want to require the person clicking on the prim to be in the same group as the prim.

integer agentRange = 10; // Change this to the range in meters that the prim will detect avatars.



sendToAPI() {
    //TODO: Add API functionality
}


default {
    state_entry() {
        llSetClickAction(CLICK_ACTION_NONE);
        llSensor("", NULL_KEY, AGENT, agentRange, PI);
    }

    sensor(integer detected) {
        if (detected > 0) {
            llSetClickAction(CLICK_ACTION_TOUCH); // Only allow clicking on the prim if there is an avatar in range.
            llSetLinkAlpha(LINK_SET, 1.0, ALL_SIDES); // Make the prim visible if there is an avatar in range.
        } else {
            llSetClickAction(CLICK_ACTION_NONE);
            llSetLinkAlpha(LINK_SET, 0.0, ALL_SIDES);
        }
    }

    touch_start(integer total_number) {
        if (needGroup = 1) {
            integer group = llSameGroup(llDetectedKey(0)); // checks to see if the person clicking on the object has the same group tag as the object, returns TRUE or FALSE.
            if ( group == TRUE )
            {
                if (points != 0) {
                    llSay(0, "You found me! You get " + (string)points + " points!");
                } else {
                    llSay(0, "You found me!");
                    // Add more things to do when found here.
                }
            }
            else if ( group == FALSE )
            {
                llSay(0, "You are not wearing the right group tag.");
            }
        } else {
            if (points != 0) {
                    llSay(0, "You found me! You get " + (string)points + " points!");
                } else {
                    llSay(0, "You found me!");
                    // Add more things to do when found here.
                }
        }
    }
}