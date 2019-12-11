import 'dart:math';
import 'package:math_expressions/math_expressions.dart';

class Bisseccao {
  static double CalcularXk(double a, double b) {
    return (a + b) / 2;
  }

  static double CalcularF_Xk(double xk,String equacao) {
    String equacao2 = equacao.replaceAll(new RegExp('x'), '${xk}'); // 'résumé'
    print(equacao2);
    Parser p = new Parser();
    //cos(pi * (xk + 1) / 8) - (0.148 * xk) - 0.9062;
    //"cos(pi*x+1)"
    Expression exp = p.parse(equacao);
    Variable x = new Variable('x');
    ContextModel cm = new ContextModel();
    cm.bindVariable(x, new Number(xk));
    double resultado = exp.evaluate(EvaluationType.REAL, cm);

    print("aqui calcula" + exp.simplify().toString());
    print("aqui resultado" + resultado.toString());
    return  resultado;
//    return  cos(pi * (xk + 1) / 8) - (0.148 * xk) - 0.9062;

  }

  static double CalcularErro(double a, double b) {
    double denominador;
    denominador = a - b;
    if (denominador < 0) denominador *= -1;
    if (a < 0) a *= -1;
    return (denominador) / a;
  }

  static List<String> CalcularApeoximacao1(double a, double b, double precisao, int parada, String equacao) {
    List<String> resultados = [];
    double xk, erro = 1;
    double y;
    for (int i = 0; i < parada; i++) {
      xk = CalcularXk(a, b);
      y = CalcularF_Xk(xk,equacao);
      if (i != 1) erro = CalcularErro(a, b);
      resultados.add("k=$i, a=$a, b=$b, Xk=$xk, e=$erro, f(Xk)=${y.toString().substring(0, 5)}");
      print("teste" + y.toString());
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
