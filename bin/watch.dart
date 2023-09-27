import 'package:path/path.dart' as p;
import 'package:watcher/watcher.dart';

import 'helper/run.dart';

void main(List<String> arguments) {
  var currentdir = (p.current);
  var watchFolders = [
    p.join(currentdir, "web"),
  ];
  print("Watching folder:  $watchFolders");

  remake().then((value) {
    for (var watchFolder in watchFolders) {
      DirectoryWatcher(watchFolder).events.listen((event) {
        remake();
      });
    }
  });
}

Future remake() async {
  await run("run :debug");
}
