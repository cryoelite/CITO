import 'package:cito_dart/cito_dart.dart';

void main() {
  ({int a, int b}) rec = (a: 2, b: 3);
  var (:a, :b) = rec;
}
