import 'package:flutter/material.dart';

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
  Widget _buildTExtField(String label) {
    return TextField(
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.green, fontSize: 20.0),
          border: OutlineInputBorder()),
      style: TextStyle(color: Colors.green, fontSize: 21.0),
      keyboardType: TextInputType.number,
    );
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
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(
              Icons.person_outline,
              size: 170.0,
              color: Colors.green,
            ),
            _buildTExtField('Título'),
            Divider(),
            _buildTExtField('Altura'),
            RaisedButton(
              child: Text(
                'Verificar',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
