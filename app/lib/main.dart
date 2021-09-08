import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _initCheckBoxDr = false;
  bool _initCheckBoxMe = false;
  bool _initCheckBoxLatuSensu = false;

  String _infoText = "Informe seus dados";

  TextEditingController titleController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController graduacaoController = TextEditingController();

  Widget _buildTextField(String label, TextEditingController c) {
    return TextField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.green, fontSize: 20.0),
          border: OutlineInputBorder()),
      style: TextStyle(color: Colors.green, fontSize: 21.0),
      keyboardType: TextInputType.number,
      controller: c,
    );
  }

  void _calculate() {
    double title = double.parse(titleController.text);
    double day = double.parse(dayController.text);
    double graduacao = double.parse(graduacaoController.text);
    double result = (title + day + graduacao) * 0.0137;

    setState(() {
      if (result <= 0) {
        _infoText =
            'Algo deu errado. Verifique seus dados ${result.toStringAsPrecision(3)}';
      } else {
        _infoText = 'Nota Preliminar: ${result}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Seletiva 12RM'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person_outline,
              size: 170,
              color: Colors.green,
            ),

            CheckboxListTile(
              title: Text(
                'Possui Doutorado?',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              subtitle: Text('Marque para SIM ou manter em branco para NÃO.',
                  style: TextStyle(fontSize: 14)),
              activeColor: Colors.green,
              value: _initCheckBoxDr,
              onChanged: (bool? value) {
                setState(() {
                  _initCheckBoxDr = value!;
                });
              },
            ),

            CheckboxListTile(
              title: Text(
                'Possui Mestrado?',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              subtitle: Text('Marque para SIM ou manter em branco para NÃO.',
                  style: TextStyle(fontSize: 14)),
              activeColor: Colors.green,
              value: _initCheckBoxLatuSensu,
              onChanged: (bool? value) {
                setState(() {
                  _initCheckBoxLatuSensu = value!;
                });
              },
            ),

            CheckboxListTile(
              title: Text(
                'Possui Especialização?',
                style: TextStyle(fontSize: 20, color: Colors.green),
              ),
              subtitle: Text('Marque para SIM ou manter em branco para NÃO.',
                  style: TextStyle(fontSize: 14)),
              activeColor: Colors.green,
              value: _initCheckBoxMe,
              onChanged: (bool? value) {
                setState(() {
                  _initCheckBoxMe = value!;
                });
              },
            ),

            // _buildTextField('Título', titleController),
            // Divider(),
            // _buildTextField('Dias', dayController),
            // Divider(),
            // _buildTextField('Ensino Superior', graduacaoController),
            Container(
              padding: const EdgeInsets.only(top: 10),
              height: 50,
              child: RaisedButton(
                child: Text(
                  'Verificar',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                onPressed: () {
                  _calculate();
                },
                color: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                _infoText,
                style: TextStyle(color: Colors.green, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
