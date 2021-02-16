import 'dart:async';

import 'dart:isolate';

class Lox {
  int val = 0;
  StreamController<int> streamController;
  Timer timer;
  Lox() {
    streamController = StreamController<int>(
        onListen: _startStream,
        onCancel: _stopStream,
        onPause: _stopStream,
        onResume: _startStream);
  }

  Stream<int> call() {
    return streamController.stream;
  }

  void _startStream() {
    timer = Timer.periodic(
      Duration(seconds: 5),
      (bkTime) {
        val++;
        streamController.add(val);
      },
    );
  }

  void _stopStream() {
    timer.cancel();
    streamController.close();
    print('Stopped');
  }
}

Future<void> doStuff() async {
  final lox = Lox();
  final stream = lox();
  final subscriber = stream.listen(
    (event) {
      print(event);
    },
  );
  await Future<void>.delayed(Duration(seconds: 30));
  await subscriber.cancel();
}

void main() {
  Future<void>(doStuff).then((_) => print('done'));

}
