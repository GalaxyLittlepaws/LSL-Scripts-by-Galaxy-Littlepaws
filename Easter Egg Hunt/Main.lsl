// Notes: Place this script inside the prim that will be clicked on for the hunt.
// There is an optional API script that can be used to add external functionality, such as logging points to a database or talking with other obnjects during the hunt.

integer points = 0; // Change this to the number of points the hunted object is worth.

integer huntTime = 60; // Change this to the number of seconds the prim will be active before poofing.

integer needGroup = 0; // Change this to 1 if you want to require the person clicking on the prim to be in the same group as the prim.

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


default {

    state_entry() {

        llSetTimerEvent(1.0);

    }

    timer() {

        if (huntTime > 0) {

            huntTime--;

        } else {

            llDie();

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