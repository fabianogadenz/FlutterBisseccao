import 'package:calc_numerico_app/scripts/bisseccao.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _equacao = new TextEditingController();
  TextEditingController _pontoA = new TextEditingController();
  TextEditingController _pontoB = new TextEditingController();
  TextEditingController _precisao = new TextEditingController();
  TextEditingController _parada = new TextEditingController();
  List<String> resultados = [];

  @override
  void initState() {
    super.initState();
    _pontoA = new TextEditingController(text: '-1');
    _pontoB = new TextEditingController(text: '0');
    _precisao = new TextEditingController(text: '0.01');
    _parada = new TextEditingController(text: '10');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cálculo Numérico"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: 50,
                    child: TextField(
                      controller: _equacao,
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue, width: 5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          hintText: 'cos(pi*(xk+1)/8)-(0.148*xk)-0.9062'),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: 50,
                    child: TextField(
                      controller: _pontoA,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue, width: 5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          icon: Icon(Icons.control_point),
                          hintText: 'Ponto A'),
                    )),
                SizedBox(
                  width: 20,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: 50,
                    child: TextField(
                      controller: _pontoB,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue, width: 5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          icon: Icon(Icons.control_point_duplicate),
                          hintText: 'Ponto B'),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: 50,
                    child: TextField(
                      controller: _precisao,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue, width: 5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          icon: Icon(Icons.my_location),
                          hintText: 'Precisão'),
                    )),
                SizedBox(
                  width: 20,
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: 50,
                    child: TextField(
                      controller: _parada,
                      keyboardType: TextInputType.number,
                      decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlue, width: 5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                          ),
                          icon: Icon(Icons.stop),
                          hintText: 'Parada'),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            OutlineButton.icon(
              onPressed: () {
                double a = double.parse(_pontoA.text);
                double b = double.parse(_pontoB.text);
                double precisao = double.parse(_precisao.text);
                double raiz;
                int parada = int.parse(_parada.text);
                setState(() {
                  resultados = Bisseccao.CalcularApeoximacao1(a, b, precisao, parada);
                });
              },
              icon: Icon(
                Icons.clear_all,
                size: 28,
              ),
              label: Text(
                "Calcular",
                style: TextStyle(fontSize: 20),
              ),
              borderSide: BorderSide(
                color: Colors.blue, //Color of the border
                style: BorderStyle.solid, //Style of the border
                width: 2, //width of the border
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: resultados.length,
                itemBuilder: (context, i) {
                  return Text(resultados[i].toString());
                })
          ],
        ),
      ),
    );
  }
}
