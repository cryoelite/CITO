int main() {
  final inp =
      '31+5+13+3+4+4+1+1+11+3+24+4+6+16+1+3+8+1+7+16+9+5+18+5+3+11+1+4+4+7+5+4+9+7+13+11+5+6+2+9+22+10+8+16+4+6+3+3+11+1+5+2+4+4+5+2+2+1+2+1+4+6+24+3+3+17+5+3+15+5+3+3+11+2+8+2+4+2+5+2+9+3+2+2+1+8+5+7+4+2+10+7+7+5+4+5+1+19+2+4+9+4+9+6+4+10+7+3+9+4+3+4+17+3+4+3+3+6+10+14+2+2+8+1+6+23+8+4+8+4+10+5+16+8+8+8+9+12+2+11+1+4+3+14+11+7+14+17+9+2+5+2+2+8+10+2+6+7+5+1+1+4+8+1+25+29+1+11+14+4+3+2+5+4+1+6+1+3+2+1+2+2+4+11+5+6+6+1+3+2+10+4+2+2+1+2+4+7+3+8+8+3+4+12+1+2+1+2+6+1+11+4+16+2+3+3+6+2+2+2+7+5+7+4+1+3+2+2+4+1+5+2+3+3+1+2+3+1+1+3+1+17+23+2+2+4+5+1+1+3+3+18+4+18+9+1+4+5+1+4+26+26+8+1+3+2+3+2+9+1+6+7+13+4+5+16+7+5+7+1+4+23+4+12+3+4+7+13+1+12+4+4+8+8+1+1+11+5+1+6+8+11+19+1+4+4+5+4+2+4+4+6+7+4+1+3+4+1+5+5+1+10+5+3+5+1+2+1+4+5+3+11+12+2+2+8+9+5+14+6+1+5+4+8+5+1+20+7+18+21+4+10+7+11+2+1+5+12+3+5+3+2+17+4+4+3+4+5+1+4+10+1+21+13+2+3+2+4+5+8+11+3+1+5+10+3+4+3+9+9+1+7+12+1+3+8+4+2+1+6+7+1+1+2+4+10+3+28+25+4+17+5+1+9+1+19+18+2+3+7+4+4+19+4+54+18+8+8+15+6+5+11+17+6+14+1+3+6+4+1+1+10+3+5+5+2+11+3+8+2+3+1+1+8+1+7+5+12+5+12+2+3+7+10+1+3+2+3+3+1+14+10+3+11+6+3+2+8+16+5+2+4+6+4+2+9+1+1+6+6+6+14+9+1+1+8+2+6+32+1+19+15+12+3+6+1+1+3+11+11+7+5+2+12+1+6+2+3+4+6+7+3+6+1+4+4+7+7+6+2+6+2+6+4+15+13+3+2+5+8+4+5+3+6+3+2+9+7+2+21+6+16+7+10+1+1+3+11+9+6+1+1+4+2+1+2+2+10+9+10+9+1+9+10+5+1+1+2+2+2+4+5+9+6+7+11+1+9+7+5+3+2+7+4+1+8+1+3+5+1+6+8+4+6+10+1+13+3+5+5+28+3+1+2+2+3+3+1+10+1+3+9+5+5+1+3+1+1+1+2+10+10+2+6+14+3+25+8+33+1+6+8+9';
  final inp2 =
      '31+5+13+3+4+4+1+1+11+3+24+4+6+16+1+3+8+1+7+16+9+5+18+5+3+11+1+4+4+7+5+4+9+7+13+11+5+6+2+9+22+10+8+16+4+6+3+3+11+1+5+2+4+4+5+2+2+1+2+1+4+6+24+3+3+17+5+3+15+5+3+3+11+2+8+2+4+2+5+2+9+3+2+2+1+8+5+7+4+2+10+7+7+5+4+5+1+19+2+4+9+4+9+6+4+10+7+3+9+4+3+4+17+3+4+3+3+6+10+14+2+2+8+1+6+23+8+4+8+4+10+5+16+8+8+8+9+12+2+11+1+4+3+14+11+7+14+17+9+2+5+2';
  final values = inp.split('+').map((e) => int.tryParse(e) ?? 0).toList();
  final sumVal =
      values.fold<int>(0, (previousValue, element) => previousValue + element);
  print('Result is ${sumVal / 60}');

  return 0;
}
