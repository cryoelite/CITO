import 'dart:io';

import 'dart:isolate';

import 'package:dio/dio.dart';

Future<void> main() async {
  final rcvPort = ReceivePort();
  await Isolate.spawn(mainCode, rcvPort.sendPort);
  print('Done, the output is stored at ${await rcvPort.first}');
}

void mainCode(SendPort sendPort) async {
  final dir = await Directory(
      r'C:\Users\millify\Documents\GitHub\fynance\lib\localization');
  final file = await File(dir.path + r'\app_en.arb');
  final convFile = await File(await Directory.current.path + r'\conv_es.arb');

  print(dir.path);
  if (await file.exists()) {
    print('File exists');
    final confLines = List<String>.empty(growable: true);
    for (final elem in await file.readAsLines()) {
      try {
        confLines.add(await translateLine(elem));
      } catch (e) {
        print(e);
        break;
      }
    }

    final fileSink = convFile.openWrite(mode: FileMode.write);
    fileSink.writeAll(confLines, '\u{000A}');
    await fileSink.close();

    Isolate.exit(sendPort, convFile.path);
  }
}

Future<String> translateLine(String elem) async {
  elem = elem.trim();
  if (elem.length > 2) {
    final remCommaLine = elem.substring(0, elem.length - 2);
    final lineParts = remCommaLine.split('"');
    var convLine = '\u{0009}"' + lineParts[1] + ':' + ' "';
    final translatedLine = await translateAPI(lineParts[3]);
    print('Line translated ${lineParts[1]}');
    convLine += translatedLine + '"' + ',';
    return convLine;
  } else {
    return elem;
  }
}

Future<String> translateAPI(String elem) async {
  final apiurl = 'https://translo.p.rapidapi.com/translate';
  final headers = {
    'x-rapidapi-host': 'translo.p.rapidapi.com',
    'x-rapidapi-key': '839271869fmsh8de9eaefcd51eafp182353jsn4147569d7da0'
  };
  final queryParams = {
    'text': elem,
    'to': 'es',
    'from': 'en',
  };
  final dio = Dio();

  final response = await dio.get(
    apiurl,
    queryParameters: queryParams,
    options: Options(
      headers: headers,
    ),
  );

  final convValue = response.data['translated_text'].toString();
  return convValue;
}
