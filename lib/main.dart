import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marcador_flutter/paginas/loading.dart';
import 'package:marcador_flutter/paginas/pagina_principal.dart';

void main() {
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //Map que contendrá la informacion sobre la configuracion
  Map<String,Object> configuracion={
    "Jugador 1":"Jugador 1",
    "Jugador 2":"Jugador 2",
    "Sets":3,
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //programacion imperativa
    //utilizada en Android
    
    //final texto=Text("Hola");
    //texto.style=TextStyle();
    
    //progamacion declarativa flutter, pasamos los datos como parametros al widget
    return MaterialApp(
      //Cuando llamamos a la página principal pasamos como parámetro el map de configuración
      home: PantallaDeCarga(configuracion: configuracion,),
      //home: PaginaPrincipal(configuracion: configuracion,),
    );
  }
   
  

}