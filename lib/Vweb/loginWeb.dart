// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:ui';
import 'package:flutter/material.dart';

import 'package:pqrsafinal/constants/Theme.dart';

//widgets
import 'package:pqrsafinal/widgets/input.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/services.dart';

import '../widgets/inputContraseñia.dart';

class LoginWeb extends StatefulWidget {
  @override
  _LoginWebState createState() => _LoginWebState();
}

class _LoginWebState extends State<LoginWeb> {
  final FirebaseAuth _autenticacion = FirebaseAuth.instance;
  final double height = window.physicalSize.height;
  final _formKey = GlobalKey<FormState>();

  TextEditingController? _email;
  TextEditingController? _contrasenia;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController(text: "");
    _contrasenia = TextEditingController(text: "");
  }

  // ignore: non_constant_identifier_names
  void ClearTextEditingController() {
    _email!.text = "";
    _contrasenia!.text = "";
  }

  void _entrar() {
    ClearTextEditingController();
    Navigator.pushNamed(context, '/principalWeb');
  }

  Future<void> _entrarConEmailYContrasenia() async {
    if (_formKey.currentState!.validate()) {
      if (isEmail(_email!.text)) {
        try {
          UserCredential credenciales =
              await _autenticacion.signInWithEmailAndPassword(
                  email: _email!.text, password: _contrasenia!.text);
          _entrar();
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Este usuario no existe")));
          } else if (e.code == 'wrong-password') {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("La contraseña es incorrecta")));
          }
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("El email digitado no es valido")));
      }
    }
  }

  static bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/pozoBg.jpg"),
                    fit: BoxFit.cover)),
          ),
          Align(
            // ignore: unnecessary_new
            child: new Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Container(
                width: 500,
                height: 1000,
                child: SafeArea(
                  child: ListView(children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 145.0, left: 24.0, right: 24.0, bottom: 6.0),
                      child: Card(
                          elevation: 5,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  decoration: BoxDecoration(
                                      color: ArgonColors.bgTituloLogin,
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 0.5,
                                              color: ArgonColors.black))),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Center(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text("Bienvenido",
                                            style: TextStyle(
                                                color: ArgonColors.black,
                                                fontSize: 36.0)),
                                      )),
                                      // Divider()
                                    ],
                                  )),
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.48,
                                  color: ArgonColors.bgCuerpoLogin,
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SingleChildScrollView(
                                        child: Center(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Center(
                                            child: Text("Inicio de sesión",
                                                style: TextStyle(
                                                    color:
                                                        ArgonColors.secondary,
                                                    fontWeight: FontWeight.w200,
                                                    fontSize: 26)),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Input(
                                                  inputFormatter:
                                                      FilteringTextInputFormatter
                                                          .deny(""),
                                                  placeholder: "Correo",
                                                  prefixIcon: Icon(
                                                    Icons.email,
                                                    color: ArgonColors.black,
                                                  ),
                                                  controller: _email,
                                                  validator: (email) {
                                                    if (email.isEmpty) {
                                                      return 'Por favor ingrese un email';
                                                    }
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: InputContrasenia(
                                                  obscureText: false,
                                                  inputFormatter:
                                                      FilteringTextInputFormatter
                                                          .deny(""),
                                                  placeholder: "Contraseña",
                                                  prefixIcon: Icon(
                                                    Icons.lock,
                                                    color: ArgonColors.black,
                                                  ),
                                                  controller: _contrasenia,
                                                  validator: (contraseina) {
                                                    if (contraseina.isEmpty) {
                                                      return 'Por favor ingrese su contraseña';
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 16),
                                            child: Center(
                                              child: FlatButton(
                                                textColor: ArgonColors.black,
                                                color: ArgonColors.success,
                                                onPressed:
                                                    _entrarConEmailYContrasenia,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                ),
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 16.0,
                                                        right: 16.0,
                                                        top: 12,
                                                        bottom: 12),
                                                    child: Text("ACCEDER",
                                                        style: TextStyle(
                                                            color: ArgonColors
                                                                .secondary,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize: 16.0))),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )),
                                  ))
                            ],
                          )),
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
