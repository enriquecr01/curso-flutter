import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ['Uno', 'dos', 'tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes temp')
      ),
      body: ListView(
        children: _crearItemsCorto()
      ),
    );
  }

  List<Widget> _crearItems() {

    List<Widget> lista = new List<Widget>();

    for (var opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      lista..add(tempWidget)
           ..add(Divider( ));
    }

    return lista;
  }

  List<Widget> _crearItemsCorto() {
    return opciones.map((item) {

      return Column(children: <Widget>[
        ListTile(
          title: Text(item + '!'),
          subtitle: Text('SHIT'),
          leading: Icon(Icons.ac_unit),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {},
        ),
        Divider()
      ],);

    }).toList();
  }

}