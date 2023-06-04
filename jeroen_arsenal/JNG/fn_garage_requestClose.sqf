/*
	Author: Jeroen Notenbomer

	Description:
	Removes the client from the servers list so it doesnt get called when the garage gets updated. This command needs to be excuted on the server!

	Parameter(s):
	ID clientOwner

	Returns:
	NOTHING
*/

if(!isServer)exitWith{};
params ["_clientOwner"];

_temp = serverNamespace getVariable ["jng_playersInArsenal",[]];
_temp= _temp - [_clientOwner];
serverNamespace setVariable ["jng_playersInArsenal",_temp];
