import 'package:pqrsafinal/Vweb/PQRS/vistasPQRS/PQRSMenu.dart';
import 'package:pqrsafinal/Vweb/PQRS/vistasPQRS/editarPQRSA.dart';
import 'package:pqrsafinal/Vweb/PQRS/vistasPQRS/verADetallePQRSA.dart';
import 'package:pqrsafinal/Vweb/principal.dart';
import 'package:pqrsafinal/firebase_options.dart';
import 'package:pqrsafinal/widgets/scrollViewWeb.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Vweb/loginWeb.dart';

Future main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());

  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        title: 'PQRSA',
        theme: ThemeData(fontFamily: 'OpenSans'),
        initialRoute: "/principalWeb",
        debugShowCheckedModeBanner: false,
        routes: <String, WidgetBuilder>{
          "/loginWeb": (BuildContext context) => new LoginWeb(),
          "/principalWeb": (BuildContext context) => new PrincipalWeb(),
          "/verADetallePQRSA": (BuildContext context) => new verADetallePQRSA(),
          "/editarPQRSA": (BuildContext context) => new editarPQRSA()
        });
  }
}
