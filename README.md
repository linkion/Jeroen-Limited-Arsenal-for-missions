# TOTALLY DOESN'T WORK WITH MORE THAN ONE PLAYER
As of 10/14/2023 when I tried testing it with two clients running at the same time on my machine.
# Jeroen-Limited-Arsenal-for-missions

## Installation

Add these files/folders to the root of the mission:
* `jeroen_arsenal/`
* `Description.ext`
* `init.sqf`

Example:

![image](https://github.com/linkion/Jeroen-Limited-Arsenal-for-missions/assets/42103411/0d3414e7-3ae9-4f0b-9c89-bacde083fa25)

## How to use
For the crate/object you want to use, in the 3den attribute `Object: Init` write: 

`this call JN_fnc_arsenal_init;`

That will initialize the limited arsenal

To save, you need to in console, execute 

`copyToClipboard str jna_dataList;`

This would give a massive array that contains the limited arsenal data.

This can then be loaded either ingame by doing

`jna_dataList = [...];`

or from 3den by perhaps writing into the 3den attribute `Object: Init`

`jna_dataList = [...];`

Example:

![objectInitScreenshot](https://github.com/linkion/Jeroen-Limited-Arsenal-for-missions/assets/42103411/9ca8d0ed-276e-480d-9307-3b31069ecf6c)

## Limitations

* You can't make another limited arsenal in the world due to possible conflicts

## 

So far haven't gotten `JNL` to work since it requires some preconfiguration for individual vehicles

Haven't test `JNG`

`JND` is a debug

## Credits

Thank you to [Jeroen Notenbomer](https://github.com/Jeroen-Notenbomer) for bringing the limited arsenal to existance

Thank you to the [Arma Antistasi Community](https://github.com/official-antistasi-community) for keeping the antistasi gamemode alive and making improvements and fixing bugs

Source for [jeroen_arsenal](https://github.com/official-antistasi-community/A3-Antistasi/tree/master/A3A/addons/jeroen_arsenal)
