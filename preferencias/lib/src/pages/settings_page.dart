import 'package:flutter/material.dart';
import 'package:preferencias/src/shared_prefs/preferencias_usuario.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:preferencias/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final prefs = new PreferenciasUsuario();

  bool _colorSecundario = false;
  int _genero = 1;
  String _nombre = 'Pedro';

  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;
    prefs.ultimaPagina = SettingsPage.routeName;
    _textController = new TextEditingController(text: _nombre);
  }

  _setSelectedRadio(int valor) {

    prefs.genero = valor;

    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color Secundario'), 
            onChanged: (value) {
              prefs.colorSecundario = value;
              _colorSecundario = value;
              setState(() => {});
            },
          ),
          RadioListTile(
            value: 1, 
            title: Text('Masculino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            value: 2, 
            title: Text('Femenino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono'
              ),
              onChanged: (value) {
                prefs.nombre = value;
              },
            )
          )
        ]
      )
    );
  }
}