import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider')),
      body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(children: <Widget>[
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ])),
    );
  }

  Widget _crearSlider() {
    return Slider(
      value: _sliderValue,
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      min: 0,
      max: 400,
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
              print(valor);
              setState(() {
                _sliderValue = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2020/06/batman-death-metal-1967935.jpg'),
      width: _sliderValue,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckbox() {
    return CheckboxListTile(
        title: Text('Bloquear Slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() => _bloquearCheck = valor);
        });
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Slider'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() => _bloquearCheck = valor);
        });
  }
}
