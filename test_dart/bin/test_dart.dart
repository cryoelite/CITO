import 'dart:async';

class Lox {
  int val;
  StreamController<int> streamController;
  Timer timer;
  Lox(this.streamController);
}

void main() {
  print('yo');
}
