### Phoenix

Phoenix is an attempt at creating an Ashita V3 farmbot for Final Fantasy XI. Phoenix will be designed with the following in mind:

* Minimal Setup - Ashita and notepad are only needed to develop the program (Empower the community to easily make changes and enhance the program).
* Detailed Logging - Keep a log of the game state before each application tick (Reduce effort needed to track down bugs, by making the error cases repeatable by replaying the logs).
* Comprehensive Tests - Avoid running the game to verify that new changes don't break existing features (Reduce effort needed to enhance and maintain the program).

### Ideas

Replay System

Code Restrictions:
* No sleeping - Sleeps make behavior incredible hard to replicate. To imitate a sleep, return early from the function and re-enter checking if the correct amount of time has passed.

* No concurrent actions - Concurrent actions create unpredictable scenarios that are incredibly hard to replicate. Keep the code single threaded, but incredibly fast.

* No indirect inputs - All of the game state and user settings are gathered before an application tick. No other data may be used that wasn't specified at the beginning of a run. The application tick may return a new state containing an IsFighting flag or a new target, which will be applied to the game context used for the next tick. This way, if we record the game context for every tick, we can debug the system by replaying those logs. 

### Developing the code

Only Ashita and notepad are required to make changes to the program. However, if you wish to use an IDE, you could try the following set up.

1. Install IDEA Intellij community edition (free).
2. Install the EmmyLua plugin for Lua

### Running the tests

The test suite requires Lua and Busted to be installed. The following instructions are what I use to develop the program:

1. Enable the linux subsystem for Windows in "Turn Windows features on or off"

2. Install ubuntu as the subsystem shell.

3. Open bash in Window's powershell

###### Powershell

`bash`

4. Install Lua, LuaRocks and Busted

###### Bash

```
sudo apt-get update
sudo apt-get install lua5.2
sudo apt-get install luarocks
sudo apt-get install lua-filesystem
sudo apt-get install liblua5.2-dev
sudo luarocks install busted
```

6. Run tests using busted

###### Bash

`busted`
