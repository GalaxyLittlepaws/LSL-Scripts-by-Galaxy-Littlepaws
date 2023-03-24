// Notes: Place this script inside the prim that will be clicked on for the hunt.
// There is an optional API script that can be used to add external functionality, such as logging points to a database or talking with other obnjects during the hunt.

integer points = 0; // Change this to the number of points the hunted object is worth.

integer needGroup = 0; // Change this to 1 if you want to require the person clicking on the prim to be in the same group as the prim.

integer agentRange = 10; // Change this to the range in meters that the prim will detect avatars.

checkGroup() {
    if (needGroup == 1) {
        if (llDetectedGroup(0) == llGetGroup()) {
            return 1;
        } else {
            return 0;
        }
    } else {
        return 1;
    }
}

avatarDetect() {
    //if there is an agent in range, return 1
    if (llSensor("", AGENT, agentRange, PI) != []) {
        return 1;
    } else {
        return 0;
    }
}


default {

    state_entry() {
        llSetTimerEvent(1.0);
        llSetClickAction(CLICK_ACTION_NONE);
    }

    timer() {
        if (avatarDetect() == 1) {
            llSetClickAction(CLICK_ACTION_TOUCH);
        } else {
            llSetClickAction(CLICK_ACTION_NONE);
        }
    }

    touch_start(integer total_number) {
        if (checkGroup() == 1) {
            llOwnerSay("You found me! You get " + (string)points + " points!");
            llDie();
        } else {
            llOwnerSay("You are not in the same group as me!");
        }
    }
}