import 'dart:io';

int lineCount = 0;

Future<void> main() async {
  final folderPath = r'C:\Users\millify\Documents\GitHub\fawnora';
  final dir = Directory(folderPath);
  final dirContents = await dir.list();
  await doStuff(dirContents);
  print('Total Lines $lineCount');
}

Future<void> doStuff(Stream<FileSystemEntity> stream) async {
  await for (var item in stream) {
    final itemStat = await item.stat();
    final itemType = itemStat.type;
    if (itemType == FileSystemEntityType.directory) {
      final uri = item.uri;
      final dir = Directory.fromUri(uri);
      final dirContents = await dir.list();
      await doStuff(dirContents);
    } else if (itemType == FileSystemEntityType.file) {
      if (item.path.endsWith('.dart')) {
        print('Current path ${item.path}');

        final uri = item.uri;
        final dartFile = await File.fromUri(uri).readAsLines();
        lineCount += dartFile.length;
      }
    }
  }
}
