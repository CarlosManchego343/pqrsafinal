import 'package:pqrsafinal/Vweb/PQRS/vistasPQRS/PQRSActivas.dart';
import 'package:pqrsafinal/Vweb/PQRS/vistasPQRS/menuCreacionPQRS.dart';
import 'package:pqrsafinal/constants/Theme.dart';
import 'package:pqrsafinal/widgets/navbar.dart';
import 'package:flutter/material.dart';

class PQRSMenu extends StatefulWidget {
  @override
  PQRSMenuState createState() => PQRSMenuState();
}

class PQRSMenuState extends State<PQRSMenu> {
  List<Widget> _widgetsOptions = [PQRSActivas(), menuCreacionPQRS()];
  int _selectIndex = 0;

  void onChangedTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Scaffold(
            backgroundColor: ArgonColors.bgTituloLogin,
            body: ListView(
              padding: EdgeInsets.all(0),
              children: [
                SizedBox(height: 15),
                ListTile(
                  title: Text(
                    "PQRS Activas",
                    style: TextStyle(
                      color: ArgonColors.black,
                    ),
                  ),
                  leading: Icon(Icons.folder_open_outlined,
                      color: ArgonColors.black),
                  onTap: () => onChangedTap(1),
                ),
                SizedBox(height: 15),
                ListTile(
                  title: Text("Agregar PQRS",
                      style: TextStyle(
                        color: ArgonColors.black,
                      )),
                  leading: Icon(Icons.delete, color: ArgonColors.black),
                  onTap: () => onChangedTap(0),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 3,
          child: _widgetsOptions[_selectIndex],
        ),
      ],
    ));
  }
}
