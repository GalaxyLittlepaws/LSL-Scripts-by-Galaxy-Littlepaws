# Easter Egg Hunt

**NOTICE: This game is a work in progress, and as such is not finished and won't work as-is. Please wait for a release.**

This is a system that will help you make any sort of easter-egg type hunt games.

It has protections against cheating, and is very easy to use.

You can easily hook it into your own game, or use it as a standalone.

## How to use

### Standalone

1. Add the script to your inventory, label it as you wish. You will need the 'Egg' script only.
2. Edit the script to your liking.
3. Add the script to your game objects as required, and place them on your parcel.
4. Get your friends to find the eggs!

### Hooking into your own game API

1. Add the scripts to your inventory, label them as you wish. You will need the 'API' script, and the 'Egg' script.
2. Edit the scripts to your liking.
3. Add the scripts to your game objects as required, and place them on your parcel.
4. Get your friends to find the eggs!

## How it works

The 'Main' script is put inside the game objects that you want to be the eggs. It will give out the prozes, and optionally send a message to the 'API' script when it is found.

The 'API' script is put inside the game object that you want to be the 'Egg Hunt' object. It will receive messages from the 'Main' script, and will send messages to the external API and/or HUD object.

The player will need to optionally put on the HUD/basket etc. and then wander around to touch the eggs to find them. The player will need to have nothing between them and the egg, and be within a certain range for it to be touchable and visible.

## How to edit

You can edit these variables in Main:

* `points` - This is the amount of points that the egg is worth. If you're not using points, keep it at 0.
* `needGroup` - This is a boolean that will determine if the egg needs to be found by someoen wearing the group tag of the rezzed egg.
* `agentRange` - This is the distance that the user needs to be from the egg to be able to see and click on it. This is to prevent cheating by camming.

### API

The API script is the script that you will need to edit to change the settings of the game. It is the script that you will need to attach to the game object that you want to be the 'Egg Hunt' object. You will need to edit the following variables:

* `apiKey` - This is the API key that will be used to communicate with the API.
* `apiURL` - This is the URL of the API. This is what will be getting messages, and responding as you have programmed.

## Anti-cheating

The system has anti-cheating built in. It will not allow a user to click on an egg if the user is not within a certain distance. The name of the egg prim is randomized after an amount of time. This is to prevent users from cheating by using the 'Area Search' feature, or by camming. This encourages exploration and makes it more fun.