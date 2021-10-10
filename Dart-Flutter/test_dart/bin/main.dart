import 'dart:io';

import 'dart:isolate';

Future<void> main() async {
  final rcvPort = ReceivePort();
  final isolate = await Isolate.spawn<SendPort>(mainCode, rcvPort.sendPort);
  await rcvPort.listen((message) {
    print('The size is: ' + message.toString() + ' MB');
    isolate.kill();
    rcvPort.close();
  });
  /* await Future.delayed(Duration(seconds: 5), () {
    print('killing');
    isolate.kill();
  }); */
}

void mainCode(SendPort sendPort) async {
  final dir = await Directory(
      r'C:\Users\millify\Documents\GitHub\CodeITestOn\Dart-Flutter\test_dart');
  final file = await File(dir.path + r'\pp.txt');
  print(dir.path);
  if (await file.exists()) {
    print('File exists');
    final lines = await file.readAsLines();
    final size = getDataSize(lines);

    sendPort.send(size);
  }
}

double getDataSize(List<String> strings) {
  var size = 0.0;
  for (final line in strings) {
    final parts = line.split(' ');
    if (parts.length >= 2) {
      final unit = parts[1].trim();
      final value = parts[0].trim();
      var valDouble = double.tryParse(value) ?? 0.0;
      if (unit == 'kB') {
        valDouble = valDouble / 1024;
      }
      size += valDouble;
    }
  }
  return size;
}
