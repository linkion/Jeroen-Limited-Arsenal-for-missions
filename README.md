# Jeroen-Limited-Arsenal-for-missions

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

## 

So far haven't gotten `JNL` to work since it requires some preconfiguration for individual vehicles

Haven't test `JNG`

`JND` is a debug
