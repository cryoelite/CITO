void main(List<String> arguments) {
  var now = DateTime.now().microsecondsSinceEpoch;

  var sq = 22 / 7;
  var timeTaken = (DateTime.now().microsecondsSinceEpoch - now);
  print('Time take: $timeTaken \n Number: $sq ');
}
