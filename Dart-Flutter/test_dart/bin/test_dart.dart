Iterable<int> dec(int x) sync* {
  if (x > 0) {
    yield* dec2(x - 1);
  }

  yield x;
}

Iterable<int> dec2(int x) sync* {
  yield x * 2;
}

void main() {
  var value = dec(3);
  for (var event in value) {
    print('In main x is $event ');
  }
}
