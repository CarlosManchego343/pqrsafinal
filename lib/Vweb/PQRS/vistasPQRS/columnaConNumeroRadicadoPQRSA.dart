// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:pqrsafinal/constants/Theme.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class columnaConNumeroRadicadoPQRSA extends StatefulWidget {
  @override
  columnaConNumeroRadicacoPQRSAState createState() =>
      columnaConNumeroRadicacoPQRSAState();
}

List<DataRow> _crearFilas(QuerySnapshot snapshot) {
  List<DataRow> newList =
      snapshot.docs.map((DocumentSnapshot documentSnapshot) {
    return new DataRow(cells: [
      DataCell(Text(documentSnapshot.id)),
    ]);
  }).toList();

  return newList;
}

class columnaConNumeroRadicacoPQRSAState
    extends State<columnaConNumeroRadicadoPQRSA> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('PQRSA').snapshots(),
        builder: (context, snapshots) {
          if (!snapshots.hasData) return Text('Cargando...');
          return new DataTable(
            headingRowColor: MaterialStateProperty.all(ArgonColors.bgTituloLogin),
            decoration: BoxDecoration(
                border: Border(
                    right: BorderSide(
              color: ArgonColors.border,
              width: 2,
            ))),
            columns: [
              new DataColumn(label: Text('Número de radicado')),
            ],
            rows: _crearFilas(snapshots.data as QuerySnapshot<Object?>),
          );
        });
  }
}
