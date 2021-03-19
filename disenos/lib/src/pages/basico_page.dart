import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _crearImagen(),
                _crearTitulo(),
                _crearAcciones(),
                _crearTexto(),
                _crearTexto(),
                _crearTexto(),
                _crearTexto(),
                _crearTexto(),
              ]
            ),
          )
        ),
    );
  }

  Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: Image(
        height: 200.0,
        fit: BoxFit.cover,
        image: NetworkImage('https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(children: <Widget>[
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Lago mamalon',
                    style: estiloTitulo,
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    'Lago mamalon en Australia',
                    style: estiloSubtitulo,
                  )
                ]),
          ),
          Icon(Icons.star, color: Colors.red, size: 30.0),
          Text(
            '41',
            style: TextStyle(fontSize: 20.0),
          )
        ]),
      ),
    );
  }


  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call, 'CALL'),
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'SHARE'),
      ],
    );
  }


  Widget _accion(IconData icon, String texto) {
    return Column(
        children: <Widget>[
          Icon(icon, color: Colors.blue, size: 40.0),
          SizedBox(height: 5.0),
          Text(texto, style: TextStyle( fontSize: 15.0, color: Colors.blue ))
        ]
      );
  }

  Widget _crearTexto() {
    return SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              'Laborum cillum esse qui proident dolor aliquip in ut ipsum ad reprehenderit. Nostrud ea laboris ad commodo ut sit labore non proident officia voluptate. Dolor adipisicing fugiat culpa amet exercitation sint veniam. Ipsum velit laborum incididunt cillum anim irure officia. Irure do ea mollit occaecat sunt velit ipsum veniam est.',
              textAlign: TextAlign.justify
            )
          ),     
    );
  }

}
