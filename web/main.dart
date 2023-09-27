import 'package:js/js.dart';
import 'package:typings/d/vscode.dart' as vscode;
import 'package:typings/d/vscode/vscode_commands.dart' as vscode_commands;
import 'package:typings/d/vscode/vscode_window.dart' as vscode_window;

/// Allows assigning a function to be callable from `window.functionName()`
@JS('activate')
external set _activate(void Function(vscode.ExtensionContext) f);

/// Allows calling the assigned function from Dart as well.
@JS()
external void activate(vscode.ExtensionContext context);

void __activateVs(vscode.ExtensionContext context) {
  // Use the console to output diagnostic information (console.log) and errors (console.error)
  // This line of code will only be executed once when your extension is activated
  print('Congratulations, your extension "dart_vscode" is now active!');

  // The command has been defined in the package.json file
  // Now provide the implementation of the command with  registerCommand
  // The commandId parameter must match the command field in package.json
  var disposable = vscode_commands.registerCommand(
      'dart_vscode.helloWorld',
      (a) => {
            // The code you place here will be executed every time your command is executed

            // Display a message box to the user
            vscode_window.showInformationMessage
                .$1('Hello World from dart_vscode!')
          });

  context.subscriptions.add(disposable as dynamic);
}

void main() {
  _activate = allowInterop(__activateVs);
}
