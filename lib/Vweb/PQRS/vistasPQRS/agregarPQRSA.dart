// ignore_for_file: prefer_const_constructors

import 'package:pqrsafinal/constants/Theme.dart';
import 'package:pqrsafinal/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class agregarPQRSA extends StatefulWidget {
  @override
  agregarPQRSAtate createState() => agregarPQRSAtate();
}

class agregarPQRSAtate extends State<agregarPQRSA> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore db = FirebaseFirestore.instance;

  String _tipoSeleccionado = 'Tipo de PQRSA';
  String _bloqueSeleccionado = 'Bloque';
  String _areaSeleccionada = 'Area';

  // ignore: prefer_final_fields
  List _tipo = [
    'Tipo de PQRSA',
    'Petición',
    'Queja',
    'Reclamo',
    'Sugerencia',
    'Agradecimiento'
  ];

  // ignore: prefer_final_fields
  List _bloque = ['Bloque', 'Vallemedio', 'Carbonera'];

  // ignore: prefer_final_fields
  List _area = [
    'Area',
    'Legal',
    'Finanzas',
    'Producción',
    'GTH',
    'Tierras',
    'Seguridad',
    'HSE',
    'Civil',
    'Driling',
    'Social'
  ];

  TextEditingController? _numeroRadicacion;
  TextEditingController? _dirjidaA;
  TextEditingController? _asunto;
  TextEditingController? _fechaRadicacion;
  TextEditingController? _documentoDelRecibidor;
  TextEditingController? _documentoDelCliente;

  @override
  void initState() {
    super.initState();
    _numeroRadicacion = TextEditingController(text: "");
    _dirjidaA = TextEditingController(text: "");
    _asunto = TextEditingController(text: "");
    _fechaRadicacion = TextEditingController(text: "");
    _documentoDelRecibidor = TextEditingController(text: "");
    _documentoDelCliente = TextEditingController(text: "");
  }

  void _limpiarCampos() {
    _tipoSeleccionado = "Tipo de PQRSA";
    _bloqueSeleccionado = "Bloque";
    _areaSeleccionada = "Area";
    _numeroRadicacion!.text = "";
    _dirjidaA!.text = "";
    _asunto!.text = "";
    _fechaRadicacion!.text = "";
    _documentoDelRecibidor!.text = "";
    _documentoDelCliente!.text = "";
  }

  void _agregarPQRSA() {
    if (_formKey.currentState!.validate()) {
      if (_tipoSeleccionado != 'Tipo de PQRSA') {
        if (_bloqueSeleccionado != 'Bloque') {
          if (_areaSeleccionada != 'Area') {
            db.collection('PQRSA').doc(_numeroRadicacion!.text).set({
              "Area": _areaSeleccionada,
              "Bloque": _bloqueSeleccionado,
              "Dirijido_a": _dirjidaA!.text,
              "Documento_del_cliente": _documentoDelCliente!.text,
              "Documento_del_recibidor": _documentoDelRecibidor!.text,
              "Fecha_de_radicacion": _fechaRadicacion!.text,
              "Numero_de_radicacion": _numeroRadicacion!.text,
              "Tipo_de_pqrsa": _tipoSeleccionado
            });
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Información registrada correctamente")));
            _limpiarCampos();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Por favor, elija una area")));
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Por favor, elija un bloque")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Por favor, elija un tipo de PQRSA")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  SizedBox(height: 100),
                  Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Input(
                              placeholder: "Fecha de radicación",
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.date_range_rounded),
                              controller: _fechaRadicacion,
                              validator: (fecha) {
                                if (fecha.isEmpty) {
                                  return 'Por favor introduzca la fecha de radicación';
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Container(
                              child: DropdownButtonFormField<String>(
                                hint: Text('Tipo'),
                                decoration: InputDecoration(
                                  filled: true,
                                  errorMaxLines: 2,
                                  labelStyle:
                                      TextStyle(color: ArgonColors.black),
                                  contentPadding: const EdgeInsets.only(
                                      top: 16.0, left: 10.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .focusColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .focusColor
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ArgonColors.bgTituloLogin,
                                    ),
                                  ),
                                ),
                                value: _tipoSeleccionado,
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                iconSize: 28,
                                elevation: 16,
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _tipoSeleccionado = newValue;
                                    });
                                  }
                                },
                                items: _tipo
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Container(
                              child: DropdownButtonFormField<String>(
                                hint: Text('Bloque'),
                                decoration: InputDecoration(
                                  filled: true,
                                  errorMaxLines: 2,
                                  labelStyle:
                                      TextStyle(color: ArgonColors.black),
                                  contentPadding: const EdgeInsets.only(
                                      top: 16.0, left: 10.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .focusColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .focusColor
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ArgonColors.bgTituloLogin,
                                    ),
                                  ),
                                ),
                                value: _bloqueSeleccionado,
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                iconSize: 28,
                                elevation: 16,
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _bloqueSeleccionado = newValue;
                                    });
                                  }
                                },
                                items: _bloque
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Input(
                              placeholder: "Asunto",
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.article_outlined),
                              controller: _asunto,
                              validator: (Asunto) {
                                if (Asunto.isEmpty) {
                                  return 'Por favor introduzca el asunto de la PQRSA';
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Container(
                              child: DropdownButtonFormField<String>(
                                hint: Text('Area'),
                                decoration: InputDecoration(
                                  filled: true,
                                  errorMaxLines: 2,
                                  labelStyle:
                                      TextStyle(color: ArgonColors.black),
                                  contentPadding: const EdgeInsets.only(
                                      top: 16.0, left: 10.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .focusColor
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .focusColor
                                          .withOpacity(0.5),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: ArgonColors.bgTituloLogin,
                                    ),
                                  ),
                                ),
                                value: _areaSeleccionada,
                                icon: const Icon(Icons.arrow_drop_down_sharp),
                                iconSize: 28,
                                elevation: 16,
                                style: Theme.of(context).textTheme.bodyText1,
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _areaSeleccionada = newValue;
                                    });
                                  }
                                },
                                items: _area
                                    .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Flexible(
                      flex: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Input(
                              placeholder: "Número de radicado",
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.fiber_pin_rounded),
                              controller: _numeroRadicacion,
                              validator: (numeroRadicado) {
                                if (numeroRadicado.isEmpty) {
                                  return 'Por favor introduzca el número de radicado';
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 18.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Input(
                              placeholder: "Dirijido a",
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.person),
                              controller: _dirjidaA,
                              validator: (DirijidoA) {
                                if (DirijidoA.isEmpty) {
                                  return 'Por favor introduzca el nombre de la persona a quien se dirije la PQRSA';
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Input(
                              placeholder: "Documento del radicado",
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.pin),
                              controller: _documentoDelCliente,
                              validator: (documentoC) {
                                if (documentoC.isEmpty) {
                                  return 'Por favor introduzca el número de documento del radicado';
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0,
                                left: 20.0,
                                right: 20.0,
                                bottom: 10.0),
                            child: Input(
                              placeholder: "Documento del recibidor",
                              inputFormatter:
                                  FilteringTextInputFormatter.deny(""),
                              prefixIcon: Icon(Icons.pin),
                              controller: _documentoDelRecibidor,
                              validator: (documentoE) {
                                if (documentoE.isEmpty) {
                                  return 'Por favor introduzca el número de documento del que recibio la PQRSA';
                                }
                              },
                            ),
                          ),
                        ],
                      ))
                ]),
                SizedBox(height: 15),
                FlatButton(
                  onPressed: () {
                    _agregarPQRSA();
                  },
                  child: Text(
                    "Registrar",
                    style: TextStyle(color: ArgonColors.black),
                  ),
                  color: ArgonColors.bgTituloLogin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
