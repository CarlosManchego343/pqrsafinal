import 'package:pqrsafinal/Vweb/PQRS/vistasPQRS/PQRSActivas.dart';
import 'package:pqrsafinal/Vweb/PQRS/vistasPQRS/menuCreacionPQRS.dart';
import 'package:pqrsafinal/constants/Theme.dart';
import 'package:pqrsafinal/widgets/navbar.dart';
import 'package:flutter/material.dart';

class PrincipalWeb extends StatefulWidget {
  @override
  PrincipalWebState createState() => PrincipalWebState();
}

class PrincipalWebState extends State<PrincipalWeb> with TickerProviderStateMixin{
  List<Widget> pages = [PQRSActivas(), menuCreacionPQRS()];
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: pages.length, vsync: this);
  }

  void salir() {
        Navigator.pushNamed(context, '/loginWeb');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Image.asset('assets/img/logoWattle.png', width: 280, height: 100),
        automaticallyImplyLeading: false,
        backgroundColor: ArgonColors.bgCuerpoLogin,
        actions: <Widget>[
          FlatButton(
            onPressed: salir, 
            child: Text('Cerrar sesión',
            style: TextStyle(
              color: ArgonColors.black,
              fontSize: 20
            ),
            ))
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: [
            Tab(text: "ConsultarPQRS",),
            Tab(text: "CrearPQRS")
          ],
        ),
      ),
      body: TabBarView(
        children: pages,
        controller: _controller,
      ),
      
    );
  }
}
