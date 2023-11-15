import 'package:flutter/material.dart';
import 'package:marcador_flutter/paginas/pagina_principal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //programacion imperativa
    //utilizada en Android
    
    //final texto=Text("Hola");
    //texto.style=TextStyle();
    
    //progamacion declarativa flutter, pasamos los datos como parametros al widget
    return MaterialApp(
      home: PaginaPrincipal(),
    );
  }
}