import 'dart:math';

class Bisseccao {
  static double CalcularXk(double a, double b) {
    return (a + b) / 2;
  }

  static double CalcularF_Xk(double xk) {
    return cos(pi * (xk + 1) / 8) - (0.148 * xk) - 0.9062;
  }

  static double CalcularErro(double a, double b) {
    double denominador;
    denominador = a - b;
    if (denominador < 0) denominador *= -1;
    if (a < 0) a *= -1;
    return (denominador) / a;
  }

  static List<String> CalcularApeoximacao1(double a, double b, double precisao, int parada) {
    List<String> resultados = [];
    double xk, y, erro = 1;
    for (int i = 0; i < parada; i++) {
      xk = CalcularXk(a, b);
      y = CalcularF_Xk(xk);
      if (i != 1) erro = CalcularErro(a, b);
      resultados.add("$i, $a, $b, $xk, $erro, ${y.toString().substring(0, 5)}");
      print("$i, $a, $b, $xk, $erro, ${y.toString().substring(0, 5)}");
      if (erro < precisao) {
        resultados.add("A Raiz = " + xk.toString().substring(0, 5));
        return resultados;
      }
      else if (y < 0)
        a = xk;
      else
        b = xk;
    }
    resultados.add("A Raiz = " + xk.toString().substring(0, 5));
    return resultados;
  }
}
