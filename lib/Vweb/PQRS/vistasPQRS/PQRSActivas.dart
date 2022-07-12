import 'package:pqrsafinal/Vweb/PQRS/vistasPQRS/columnaConNumeroRadicadoPQRSA.dart';
import 'package:pqrsafinal/Vweb/PQRS/vistasPQRS/tablaDePQRSA.dart';
import 'package:pqrsafinal/constants/Theme.dart';
import 'package:flutter/material.dart';

class PQRSActivas extends StatefulWidget {
  @override
  PQRSActivasState createState() => PQRSActivasState();
}

class PQRSActivasState extends State<PQRSActivas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Row(
            children: [
              columnaConNumeroRadicadoPQRSA(),
              tablaDePQRSA()
            ],
          ),
        ),
      ),
    );
  }
}
