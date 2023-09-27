import 'dart:io';

Future<int> run(String command, [exe = "dart"]) async {
  final process =
      await Process.start(exe, command.split(" "), runInShell: true);
  await stdout.addStream(process.stdout);
  await stderr.addStream(process.stderr);
  return await process.exitCode;
}
