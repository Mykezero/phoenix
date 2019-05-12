### Phoenix

Phoenix is an attempt at creating an Ashita V3 farmbot for Final Fantasy XI. Phoenix will be designed with the following in mind:

* Minimal Setup - Ashita and notepad are only needed to develop the program (Empower the community to easily make changes and enhance the program).
* Detailed Logging - Every method logs its name, inputs and outputs as JSON (Make bugs easy to track down by keeping replayable records of every behavior).
* Comprehensive Tests - Avoid running the game to verify that new changes don't break existing features (Reduce effort needed to enhance and maintain the program).

### Ideas

Replay System.

Code Restrictions:
* No sleeping - Sleeps make behavior incredible hard to replicate. To imitate a sleep, return early from the function and re-enter checking if the correct amount of time has passed.

* No concurrent actions - Concurrent actions create unpredictable scenarios that are incredibly hard to replicate. Keep the code single threaded, but incredibly fast.

* No indirect inputs - All of the game state and user settings are gathered before an application tick. No other data may be used that wasn't specified at the beginning of a run. You may change data during a run such as setting a IsFighting flag or setting a new Target, but only based on data that was specified at the beginning of the tick.

Snapshot - Snapshots are captured before and after every method invocation. They record: method name, inputs, outputs, starttime, endtime, and indirect inputs from other methods.

Replay - A collection of snapshots are replayable by organizing them by starttime and executing them in that order.

GameState - An immutable object created at the beginning of a frame that contains all of the world information.

AppState - An immutable object created at the beginning of a frame that contains users settings and maybe thing like who the last target was.

TimeWarp (should not be needed if no sleeps are used) - We can speed up a replay by dividing all time units by some interval. For example, if the interval between snapshots is 1000 MS and the sleep in the code an action is 1000 MS, then in the replay, we can divide the time units by 1000 to speed up replay to under one second.

### Developing the code

Only Ashita and notepad are required to make changes to the program. However, if you wish to use an IDE, you could try the following set up.

1. Install IDEA Intellij community edition (free).
2. Install the EmmyLua plugin for Lua

### Running the tests

The test suite requires Lua and Busted to be installed. The following instructions are what I use to develop the program:

1. Enable the linux subsystem for Windows in "Turn Windows features on or off"

2. Install opensuse as the subsystem shell.

3. Open bash in Window's powershell

###### Powershell

`bash`

3. Install lua

###### Bash

`yast install lua`

4. Install luarocks

###### Bash

```
wget https://luarocks.org/releases/luarocks-3.0.4.tar.gz
tar zxpf luarocks-3.0.4.tar.gz
cd luarocks-3.0.4
sudo yast --install lua-luafilesystem
sudo yast --install lua-devel
sudo ./configure; sudo make bootstrap
```

5. Install busted

###### Bash

`sudo /usr/local/bin/luarocks install busted`

6. Run tests using busted

###### Bash

`busted`
