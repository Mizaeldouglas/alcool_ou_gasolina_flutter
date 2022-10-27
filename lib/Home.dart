import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();

  var _textoResultado = "";

  void _calcular (){

    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if( precoAlcool == null || precoGasolina == null ){
      setState(() {
        _textoResultado = "Número inválido, digite números maiores que 0 e utilizando(.) ";
      });
    }else{
      if( (precoAlcool / precoGasolina) >= 0.7 ){
        setState(() {
          _textoResultado = "Melhor abastecer com gasolina";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com Alcool";
        });
      }
      _limparCampos();
    }
  }

  void _limparCampos() {
    _controllerAlcool.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Alcool ou Gasolina"),
          backgroundColor: Colors.blue[900],
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                ),
                Image.asset(
                  "images/logo.png",
                  fit: BoxFit.cover,
                ),
                Padding(padding: EdgeInsets.only(top: 40)),
                Text(
                  "Saiba qual a melhor opção para abastecimento de seu carro",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllerAlcool,
                  decoration:
                      InputDecoration(labelText: "Preço Alcool, ex: 3.49"),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllerGasolina,
                  decoration:
                      InputDecoration(labelText: "Preço Gasolina, ex: 4.79"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: RaisedButton(
                      color: Colors.blue[900],
                      child: Text(
                        "Calcular",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: _calcular
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _textoResultado,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
