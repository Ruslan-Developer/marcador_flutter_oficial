import 'package:flutter/material.dart';
import 'package:marcador_flutter/paginas/pagina_ajustes.dart';
import 'package:marcador_flutter/paginas/pagina_juego.dart';

class PaginaPrincipal extends StatelessWidget {
  //MAp en el que dejaremos la configuracion del juego
  Map<String,Object> configuracion;

  PaginaPrincipal({
    super.key, required this.configuracion
    });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              //Cuando llamamos a ajustes pasamos de nuevo como parametro la configuración
              final destino=MaterialPageRoute(
                builder:(_)=>PaginaAjustes(configuracion: configuracion,) );
                Navigator.push(context, destino);
               
            }, 
            icon: Icon(Icons.settings))
        ],
      ),
      body: Container(
        color: Colors.white,
        child: DefaultTextStyle(
          style: const TextStyle(),
          child: Center(
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: Offset(10, 20),
                  ),
                ],
              ),
              padding: const EdgeInsets.only(
                  left: 20, 
                  top: 15, 
                  bottom: 30, 
                  right: 15),
              child: const Center(
                child: Text(
                  "Marcador\nde\nTenis-padel",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      shadows: [
                        Shadow(
                            color: Colors.white,
                            blurRadius: 1,
                            offset: Offset(1, 1),
                            ),
                      ]),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Pasamos la configuración al juego
          final destino = MaterialPageRoute(builder: (_) => PaginaJuego(configuracion: configuracion,));
          Navigator.push(context, destino);
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
