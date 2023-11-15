import 'package:flutter/material.dart';
import 'package:marcador_flutter/modelo/partido.dart';

class PaginaJuego extends StatefulWidget {
  const PaginaJuego({super.key});

  @override
  State<PaginaJuego> createState() => _PaginaJuegoState();
}

class _PaginaJuegoState extends State<PaginaJuego> {
  Map<String,dynamic> _marcador= {
      "Jugador Local":"Jugador 1",
      "Jugador Visitante":"Jugador 2",
      "Set":[
        {"Juegos Locales":"0", "Juegos Visitantes":"0"},
        {"Juegos Locales":"0", "Juegos Visitantes":"0"},
        {"Juegos Locales":"0", "Juegos Visitantes":"0"},
        {"Juegos Locales":"0", "Juegos Visitantes":"0"},
        {"Juegos Locales":"0", "Juegos Visitantes":"0"},
      ],
      "Puntos Locales":"0",
      "Puntos Visitantes":"0"
      };
      final partido=Partido(numSets: 3, jugadorLocal: "Jugador 1", jugadorVisitante: "Jugador 2");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(8),
        color: Colors.black,
        child:  DefaultTextStyle(
          style: TextStyle(
            color: Colors.grey,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          child:  Column(
            children: [
              Center(
                child: Text("Marcador",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
              
                ),),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                    Expanded(
                      child: Text(_marcador["Jugador Local"]),
                    ),
                    SizedBox(
                      width: 8,
                      ),
                    Text(_marcador["Set"][0]["Juegos Locales"]),
                    SizedBox(
                      width: 8,
                      ),
                    Text(_marcador["Set"][1]["Juegos Locales"]),
                    SizedBox(
                      width: 8,
                      ),
                    Text(_marcador["Set"][2]["Juegos Locales"]),
                    SizedBox(
                      width: 8,
                      ),
                    Container(
                      color: Colors.red,
                      height: 25,
                      width: 2,
                    ),
                    SizedBox(
                      width: 8,
                      ),
                    Text(_marcador["Puntos Locales"]),
                ],  
              ),
              Container(
                color: Colors.red,
                height: 2,
                width: double.infinity,
              ),
              Row(
                children: [
                    Expanded(
                      child: Text(_marcador["Jugador Visitante"]),
                    ),
                    SizedBox(
                      width: 8,
                      ),
                    Text(_marcador["Set"][0]["Juegos Visitantes"]),
                    SizedBox(
                      width: 8,
                      ),
                    Text((_marcador["Set"][1]["Juegos Visitantes"])),
                    SizedBox(
                      width: 8,
                      ),
                    Text((_marcador["Set"][2]["Juegos Visitantes"])),
                    SizedBox(
                      width: 8,
                      ),
                    Container(
                      color: Colors.red,
                      height: 25,
                      width: 2,
                    ),
                    SizedBox(
                      width: 8,
                      ),
                    Text(_marcador["Puntos Visitantes"]),
                ],  
              ),
            ],
            ),
        ),
      ),
       //Menú inferior
        bottomNavigationBar: BottomNavigationBar(items: [
          //no se pueden pasar widgets, sino elementos de la clase bottonNavigationBarItem
          BottomNavigationBarItem(
            //ajuste del icono del boton inferior
            icon: Icon(Icons.home),
            label: "Punto Local",

            
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_right),
            label: "Punto Visitante"),
        ],
        onTap: (value) {
          switch (value) {
            case 0:
              partido.addLocalPoint();
              _marcador = partido.getPartido();
              setState(() {});
              break;
            case 1:
              partido.addLocalVisitante();
              _marcador = partido.getPartido();
              setState(() {});
              break;
            default:
          }
        },
        ) ,
        
    );
  }
}