import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final output = File('output.txt').openWrite();
  final process = await Process.start('ping', ['8.8.8.8']);
  var lineStream =
      process.stdout.transform(Utf8Decoder()).transform(LineSplitter());

  await process.stdout.pipe(output);

  await process.stderr.drain();
  print('exit code: ${await process.exitCode}');
}
