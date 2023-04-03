// Notes: Place this script inside the prim that will be clicked on for the hunt.
// There is an optional API script that can be used to add external functionality, such as logging points to a database or talking with other obnjects during the hunt.

integer points = 0; // Change this to the number of points the hunted object is worth. If this hunt will not use points, then keep it 0.

integer needGroup = 0; // Change this to 1 if you want to require the person clicking on the prim to be in the same group as the prim.

integer agentRange = 10; // Change this to the range in meters that the prim will detect avatars.

string passwd = "password"; // Change this to the password you want to use for the API. This is optional.

sendToAPI() {
    //TODO: Add API functionality
}

default {
    state_entry() {
        llSetClickAction(CLICK_ACTION_NONE);
        llSensorRepeat("", NULL_KEY, AGENT, agentRange, PI, 1.0);
    }

    sensor(integer i) {
        if (i > 0) {
            llSetLinkAlpha(LINK_SET, 1.0, ALL_SIDES); // Make the prim visible if there are avatars in range.
            llSetClickAction(CLICK_ACTION_TOUCH); // Enable clicking on the prim if there are avatars in range.
        }
    }

    no_sensor() {
        llSetLinkAlpha(LINK_SET, 0.0, ALL_SIDES); // Make the prim invisible if there are no avatars in range.
        llSetClickAction(CLICK_ACTION_NONE); // Disable clicking on the prim if there are no avatars in range.
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