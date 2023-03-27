// Notes: Place this script inside the prim that will be clicked on for the hunt.
// There is an optional API script that can be used to add external functionality, such as logging points to a database or talking with other obnjects during the hunt.

integer points = 0; // Change this to the number of points the hunted object is worth. If this hunt will not use points, then keep it 0.

integer needGroup = 0; // Change this to 1 if you want to require the person clicking on the prim to be in the same group as the prim.

integer agentRange = 10; // Change this to the range in meters that the prim will detect avatars.



sendToAPI() {
    //TODO: Add API functionality
}

string freetouchpath(integer detected_num)
{
    key avi = llDetectedKey(detected_num);                 // first toucher
    vector avpos = llDetectedPos(detected_num);            // position of touching avi
    vector touchpos = llDetectedTouchPos(detected_num);    // position of touch
    list raycast = llCastRay(avpos, touchpos, []);         // check space between them
    integer status = llList2Integer(raycast,-1);    // last element is status
    if (status == 0)                            // ray hit nothing
    {   return(""); }                           // no obstacle
    //  Hard case. Check for ray hitting avi or object being touched. Those don't count.
    integer linknum = llDetectedLinkNumber(detected_num);  // which link was touched
    key linkkey = llGetLinkKey(linknum);        // key of link touched
    integer i;
    for (i=0; i<llGetListLength(raycast)-1; i = i+2)// list obstacles
    {   key obstacle = llList2Key(raycast,i);   // key of obstacle
        if (obstacle != linkkey && obstacle != avi)  // not false alarm
        {   string s = llKey2Name(obstacle);        // name of obstacle
            if (s == "") { s = "UUID " + (string)obstacle; }  // name lookup failed
            return(s);                           // return name of obstacle
        }
    }
    return("");                                 // true if no problem
}


default {
    state_entry() {
        llSetClickAction(CLICK_ACTION_NONE);
        llSensorRepeat("", NULL_KEY, AGENT, agentRange, PI, 1.0);
    }

    sensor(integer i) {
        if (i > 0) {
            llSetClickAction(CLICK_ACTION_TOUCH); // Enable clicking on the prim if there are avatars in range.
            llSetLinkAlpha(LINK_SET, 1.0, ALL_SIDES); // Make the prim visible if there are avatars in range.
        }
    }

    no_sensor() {
        llSetClickAction(CLICK_ACTION_NONE); // Disable clicking on the prim if there are no avatars in range.
        llSetLinkAlpha(LINK_SET, 0.0, ALL_SIDES); // Make the prim invisible if there are no avatars in range.
    }

    touch_start(integer total_number) {
        string obstruction = freetouchpath(0); // Touched. Is it valid?
        if (obstruction == "") {
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
        } else {
            llSay(0, "You can't reach this because " + obstruction + " is in the way.");
        }
    }
}