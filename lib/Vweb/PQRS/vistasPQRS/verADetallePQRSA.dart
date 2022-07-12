import 'package:flutter/material.dart';

import '../../../constants/Theme.dart';

class verADetallePQRSA extends StatefulWidget {
  @override
  verADetallePQRSAState createState() => verADetallePQRSAState();
}

class verADetallePQRSAState extends State<verADetallePQRSA> {
  void volverAPrincipal() {
    Navigator.pushNamed(context, '/principalWeb');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title:
              Image.asset('assets/img/logoWattle.png', width: 280, height: 100),
          automaticallyImplyLeading: false,
          backgroundColor: ArgonColors.bgCuerpoLogin,
          actions: <Widget>[
            FlatButton(
                onPressed: volverAPrincipal,
                child: Text(
                  'Volver al menú',
                  style: TextStyle(color: ArgonColors.black, fontSize: 20),
                ))
          ],
        ),
        body: Row(
          children: <Widget>[
            Flexible(
                flex: 2,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(15),
                  elevation: 10,
                  color: ArgonColors.bgTituloLogin,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Datos de la PQRSA",
                              style: TextStyle(
                                  fontSize: 34, color: ArgonColors.white)),
                        ),
                      ),
                      SizedBox(height: 15),
                      Divider(
                        height: 40.0,
                        thickness: 1.5,
                        indent: 32.0,
                        endIndent: 32.0,
                      ),
                      SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Align(
                            alignment: Alignment(-0.8, 1.0),
                            child: Text("Número de radicado:",
                                style: TextStyle(
                                    fontSize: 28, color: ArgonColors.black)),
                          ),
                          Align(
                            alignment: Alignment(0.8, 1.0),
                            child: Text("WAPPET-2020-00127",
                                style: TextStyle(
                                    fontSize: 18, color: ArgonColors.black)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Align(
                            alignment: Alignment(-0.84, 1.0),
                            child: Text("Asunto:",
                                style: TextStyle(
                                    fontSize: 28, color: ArgonColors.black)),
                          ),
                          Align(
                            alignment: Alignment(0.8, 1.0),
                            child: Text(
                                "Respuesta proyectos de inversión social vigencias 2018, 2019 y 2020",
                                style: TextStyle(
                                    fontSize: 18, color: ArgonColors.black)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Align(
                            alignment: Alignment(-0.84, 1.0),
                            child: Text("Dirijido a:",
                                style: TextStyle(
                                    fontSize: 28, color: ArgonColors.black)),
                          ),
                          Align(
                            alignment: Alignment(0.8, 1.0),
                            child: Text("Trevor Belmont",
                                style: TextStyle(
                                    fontSize: 18, color: ArgonColors.black)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Align(
                            alignment: Alignment(-0.8, 1.0),
                            child: Text("Tipo de PQRSA:",
                                style: TextStyle(
                                    fontSize: 28, color: ArgonColors.black)),
                          ),
                          Align(
                            alignment: Alignment(0.8, 1.0),
                            child: Text("Petición",
                                style: TextStyle(
                                    fontSize: 18, color: ArgonColors.black)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Align(
                            alignment: Alignment(-0.8, 1.0),
                            child: Text("Fecha de radicación:",
                                style: TextStyle(
                                    fontSize: 28, color: ArgonColors.black)),
                          ),
                          Align(
                            alignment: Alignment(0.8, 1.0),
                            child: Text("16/09/2020",
                                style: TextStyle(
                                    fontSize: 18, color: ArgonColors.black)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Align(
                            alignment: Alignment(-0.8, 1.0),
                            child: Text("Bloque:",
                                style: TextStyle(
                                    fontSize: 28, color: ArgonColors.black)),
                          ),
                          Align(
                            alignment: Alignment(0.8, 1.0),
                            child: Text("Vallemedio",
                                style: TextStyle(
                                    fontSize: 18, color: ArgonColors.black)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Align(
                            alignment: Alignment(-0.8, 1.0),
                            child: Text("Documento de quien recibio la PQRSA:",
                                style: TextStyle(
                                    fontSize: 28, color: ArgonColors.black)),
                          ),
                          Align(
                            alignment: Alignment(0.8, 1.0),
                            child: Text(
                                "1007656588",
                                style: TextStyle(
                                    fontSize: 18, color: ArgonColors.black)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                )),
            Flexible(
                flex: 2,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(15),
                  elevation: 10,
                  color: ArgonColors.bgTituloLogin,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Datos del radicante",
                              style: TextStyle(
                                  fontSize: 34, color: ArgonColors.white)),
                        ),
                      ),
                      SizedBox(height: 15),
                      Divider(
                        height: 40.0,
                        thickness: 1.5,
                        indent: 32.0,
                        endIndent: 32.0,
                      ),
                      SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Align(
                            alignment: Alignment(-0.8, 1.0),
                            child: Text("Número de documento:",
                                style: TextStyle(
                                    fontSize: 28, color: ArgonColors.black)),
                          ),
                          Align(
                            alignment: Alignment(0.8, 1.0),
                            child: Text("1007565696",
                                style: TextStyle(
                                    fontSize: 18, color: ArgonColors.black)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Align(
                            alignment: Alignment(-0.8, 1.0),
                            child: Text("Nombre:",
                                style: TextStyle(
                                    fontSize: 28, color: ArgonColors.black)),
                          ),
                          Align(
                            alignment: Alignment(0.8, 1.0),
                            child: Text("León Ernesto Perez Torrez",
                                style: TextStyle(
                                    fontSize: 18, color: ArgonColors.black)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Align(
                            alignment: Alignment(-0.8, 1.0),
                            child: Text("Telefono:",
                                style: TextStyle(
                                    fontSize: 28, color: ArgonColors.black)),
                          ),
                          Align(
                            alignment: Alignment(0.8, 1.0),
                            child: Text("3134568970",
                                style: TextStyle(
                                    fontSize: 18, color: ArgonColors.black)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Align(
                            alignment: Alignment(-0.8, 1.0),
                            child: Text("Correo electronico:",
                                style: TextStyle(
                                    fontSize: 28, color: ArgonColors.black)),
                          ),
                          Align(
                            alignment: Alignment(0.8, 1.0),
                            child: Text("leonept@gmail.com",
                                style: TextStyle(
                                    fontSize: 18, color: ArgonColors.black)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Align(
                            alignment: Alignment(-0.8, 1.0),
                            child: Text("Dirección:",
                                style: TextStyle(
                                    fontSize: 28, color: ArgonColors.black)),
                          ),
                          Align(
                            alignment: Alignment(0.8, 1.0),
                            child: Text("Carrera 3-B #45 - 06",
                                style: TextStyle(
                                    fontSize: 18, color: ArgonColors.black)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Align(
                            alignment: Alignment(-0.8, 1.0),
                            child: Text("Municipio:",
                                style: TextStyle(
                                    fontSize: 28, color: ArgonColors.black)),
                          ),
                          Align(
                            alignment: Alignment(0.8, 1.0),
                            child: Text("Pueblo viejo",
                                style: TextStyle(
                                    fontSize: 18, color: ArgonColors.black)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
                )
          ],
        ));
  }
}
