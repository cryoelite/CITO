import 'package:xml/xml.dart';
import 'dart:io';

Future<int> main() async {
  final longt = 79.6079953;
  final lat = 27.6592237;
  print(await findDistrict(lat, longt));
  return 0;
}

Future<String> findDistrict(double posLat, double posLong) async {
  var districtName = 'Unknown';
  final dir = Directory('./asset');
  if (await dir.exists()) {
    await for (var file in dir.list()) {
      if (file.path.endsWith('.kml')) {
        final kmlFile = await File(file.path).readAsString();
        final kmlParsed = XmlDocument.parse(kmlFile);
        final name = kmlParsed.findAllElements('name').elementAt(1).innerText;
        final coordinates =
            kmlParsed.findAllElements('coordinates').first.innerText.split(' ');
        final lat = <double>[];
        final longt = <double>[];
        coordinates.forEach((element) {
          final elemParts = element.split(',');
          if (elemParts.length == 3) {
            lat.add(double.tryParse(elemParts[1]) ?? 0);
            longt.add(double.tryParse(elemParts[0]) ?? 0);
          }
        });
        if (pnpoly(lat.length, lat, longt, posLat, posLong)) {
          districtName = name;
          break;
        }
        /* output +=
        '${name}\nminLat: ${lat.reduce(min)}-----minLong: ${longt.reduce(min)}\nmaxLat: ${lat.reduce(max)}-----maxLong: ${longt.reduce(max)}\n\n'; */
      }
    }
  }
  return districtName;
}

bool pnpoly(int nvert, List<double> vertx, List<double> verty, double testx,
    double testy) {
  var c = false;
  for (var i = 0, j = nvert - 1; i < nvert; j = i++) {
    if (((verty[i] > testy) != (verty[j] > testy)) &&
        (testx <
            (vertx[j] - vertx[i]) * (testy - verty[i]) / (verty[j] - verty[i]) +
                vertx[i])) {
      c = !c;
      print(i);
    }
  }
  return c;
}
