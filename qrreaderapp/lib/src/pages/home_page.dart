import 'dart:io';

import 'package:flutter/material.dart';

import 'package:qrreaderapp/src/pages/direcciones_page.dart';
import 'package:qrreaderapp/src/pages/mapas_page.dart';
import 'package:qrreaderapp/src/bloc/scans_bloc.dart';
import 'package:qrreaderapp/src/models/scan_model.dart';
import 'package:barcode_scan/barcode_scan.dart';

import 'package:qrreaderapp/src/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scansBloc = new ScansBloc();

  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever), 
            onPressed: () => scansBloc.borrarScanTodos()
          )
        ]
      ),
      body: Center(
        child: _callPage(currentIndex)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.filter_center_focus),
        onPressed: () => _scanQR(context),
      ),
      bottomNavigationBar: _crearBottomNavigationBar(),
    );
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text('Mapas')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text('Direcciones')
        ),
      ]
    );
  }

  Widget _callPage(int paginaActual) {

    switch(paginaActual) {
      case 0: return MapasPage();
      case 1: return DireccionesPage();
      default: return MapasPage();
    }

  }


  // _scanQR(BuildContext context) async {
  //   // https://enriquechavezr.com

  //   String futureString = 'https://enriquechavezr.com';
  //   String futureString2 = 'geo:32.557085250140716,-116.61641493281253';

  //   if(futureString != null){
  //     final scan = ScanModel( valor: futureString );
  //     scansBloc.agregarScan(scan);

  //     final scan2 = ScanModel( valor: futureString2 );
  //     scansBloc.agregarScan(scan2);

  //     // Aca se hace un If con el fin de que no se trabe el navegador web despues de usar la camara
  //     // esto solo pasa en IOs
  //     if ( Platform.isIOS ) {
  //       Future.delayed(Duration(milliseconds: 750), () {
  //       utils.abrirScan(context, scan);
  //       });
  //     } else {
  //       utils.abrirScan(context, scan);
  //     }

  //   }

  // }

    _scanQR(BuildContext context) async {

      ScanResult futureString;

      try {
        futureString = await BarcodeScanner.scan();
      } catch (e) {
        print(e.toString());
      }

      print('future string :' + futureString.rawContent);

      if(futureString != null) {
        final scan = ScanModel( valor: futureString.rawContent );
        scansBloc.agregarScan(scan);

        // Aca se hace un If con el fin de que no se trabe el navegador web despues de usar la camara
        // esto solo pasa en IOs
        if ( Platform.isIOS ) {
          Future.delayed(Duration(milliseconds: 750), () {
            utils.abrirScan(context, scan);
          });
        } else {
          utils.abrirScan(context, scan);
        }
    }

  }

}