steps to launch:
put typings folder in parent folder of this project. (Parent contains folders "dart_vsplugin" and "typings")
in terminal of dart_vsplugin folder type:
dart run :debug

modify the generated file /plugin/extension.js
add this line to the top: var vscode = require("vscode");
replace all "vscode.commands.vscode.commands" with "vscode.commands"
replace all "vscode.window.vscode.window" with "vscode.window"

In VSCode go to the debug tab and choose "Run extension"
In the new VSCode window press Ctrl+Shift+P and type in Hello world.
If everything works you would get "Hello World from dart_vscode!" message.
Currently I get the error:

NoSuchMethodError: method not found: 'call'
Receiver: Closure '\_\_activateVs_closure'
Arguments: []

extra:
This person was trying to do the same thing, but I am unsure if he ever succeded:
https://stackoverflow.com/questions/38663161/how-can-i-generate-code-to-export-functions-for-node-in-dart
it appears he used dartdevc to do it, but unfortunately that tool has been deprecated.
