import 'package:flutter/material.dart';
import 'package:marcador_flutter/modelo/base_datos.dart';
import 'package:marcador_flutter/modelo/partido.dart';

class PaginaJuego extends StatefulWidget {
  Map<String,Object> configuracion;
  PaginaJuego({super.key, required this.configuracion});

  @override
  State<PaginaJuego> createState() => _PaginaJuegoState();
}

class _PaginaJuegoState extends State<PaginaJuego> {
  BDHelper bdHelper=BDHelper();
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
   Map<String,dynamic> _BDResultado= {
      "jugador1":"Jugador 1",
      "jugador2":"Jugador 2",
      "j1set1":"0",
      "j1set2":"0",
      "j1set3":"0",
      "j1set4":"0",
      "j1set5":"0",
      "j2set1":"0",
      "j2set2":"0",
      "j2set3":"0",
      "j2set4":"0",
      "j2set5":"0",
      };      
      int _numSets=3;
      var partido;
      bool _partidoFinalizado=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //recogemos los datos de configuración, los metemos en el marcador que actualizará la pantalla
    //e iniciamos la instancia que gestionará un partido con los parametros correctos.
    _marcador["Jugador Local"]=widget.configuracion["Jugador 1"].toString();
    _marcador["Jugador Visitante"]=widget.configuracion["Jugador 2"].toString();
    _numSets=int.parse(widget.configuracion["Sets"].toString());
    partido=Partido(numSets: _numSets, jugadorLocal: _marcador["Jugador Local"], jugadorVisitante: _marcador["Jugador Visitante"]);

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(),
      body: Container(
        padding: EdgeInsets.all(8),
        color: Colors.black,
        child:  DefaultTextStyle(
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          child:  Column(
            children: [
              const Center(
                child: Text("Marcador",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
              
                ),),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                    Expanded(
                      child: Text(_marcador["Jugador Local"]),
                    ),
                    const SizedBox(
                      width: 8,
                      ),
                    Text(_marcador["Set"][0]["Juegos Locales"]),
                    const SizedBox(
                      width: 8,
                      ),
                    Text(_marcador["Set"][1]["Juegos Locales"]),
                    const SizedBox(
                      width: 8,
                      ),
                    Text(_marcador["Set"][2]["Juegos Locales"]),
                    const SizedBox(
                      width: 8,
                      ),
                      //si el numero de sets es 5 aumentamos los elementos a mostrar.
                    if(_numSets==5)   Text(_marcador["Set"][3]["Juegos Locales"]),
                    if(_numSets==5)   const SizedBox(width: 8,),
                    if(_numSets==5)   Text(_marcador["Set"][4]["Juegos Locales"]),
                    if(_numSets==5)   const SizedBox(width: 8,),
                    Container(
                      color: Colors.red,
                      height: 25,
                      width: 2,
                    ),
                    const SizedBox(
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
                    const SizedBox(
                      width: 8,
                      ),
                    Text(_marcador["Set"][0]["Juegos Visitantes"]),
                    const SizedBox(
                      width: 8,
                      ),
                    Text((_marcador["Set"][1]["Juegos Visitantes"])),
                    const SizedBox(
                      width: 8,
                      ),
                    Text((_marcador["Set"][2]["Juegos Visitantes"])),
                    const SizedBox(
                      width: 8,
                      ),
                      if(_numSets==5)   Text(_marcador["Set"][3]["Juegos Visitantes"]),
                    if(_numSets==5)   const SizedBox(width: 8,),
                    if(_numSets==5)   Text(_marcador["Set"][4]["Juegos Visitantes"]),
                    if(_numSets==5)   const SizedBox(width: 8,),
                    Container(
                      color: Colors.red,
                      height: 25,
                      width: 2,
                    ),
                    const SizedBox(
                      width: 8,
                      ),
                    Text(_marcador["Puntos Visitantes"]),
                ],  
              ),
           if(_partidoFinalizado)
                 const SizedBox(
                              height:40,
                          ),
            if(_partidoFinalizado)
                const Text("Partido Finalizado",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                    
                      ),),
                  ],
            ),
        ),
      ),
       //Menú inferior 
      bottomNavigationBar: BottomNavigationBar(items: const [
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
          if(!_partidoFinalizado)
             { switch (value) {
                case 0:
                  _partidoFinalizado=partido.addLocalPoint();
                  _marcador = partido.getPartido();
                  setState(() {});
                  break;
                case 1:
                  _partidoFinalizado=partido.addLocalVisitante();
                  _marcador = partido.getPartido();
                  setState(() {});
                  break;
                default:
              }
              if(_partidoFinalizado){
                _BDResultado["jugador1"]=_marcador["Jugador Local"];
                _BDResultado["jugador2"]=_marcador["Jugador Visitante"];
                _BDResultado["j1set1"]=_marcador["Set"][0]["Juegos Locales"];
                _BDResultado["j1set2"]=_marcador["Set"][1]["Juegos Locales"];
                _BDResultado["j1set3"]=_marcador["Set"][2]["Juegos Locales"];
                _BDResultado["j1set4"]=_marcador["Set"][3]["Juegos Locales"];
                _BDResultado["j1set5"]=_marcador["Set"][4]["Juegos Locales"];
                _BDResultado["j2set1"]=_marcador["Set"][0]["Juegos Visitantes"];
                _BDResultado["j2set2"]=_marcador["Set"][1]["Juegos Visitantes"];
                _BDResultado["j2set3"]=_marcador["Set"][2]["Juegos Visitantes"];
                _BDResultado["j2set4"]=_marcador["Set"][3]["Juegos Visitantes"];
                _BDResultado["j2set5"]=_marcador["Set"][4]["Juegos Visitantes"];
                bdHelper.insertarBD("resultados", _BDResultado);
              }
             }
          else{
            setState(() {
              
            });
          }
        },
        ) ,
        
    );
  }
}