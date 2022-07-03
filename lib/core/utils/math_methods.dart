import 'dart:math';

class MathMethods {
  static double getRandom(int min, int max) {
    Random rnd;

    rnd = new Random();
    num r = min + rnd.nextInt(max - min);
    //print("$r is in the range of $min and $max");
    return r.toDouble();
  }
}
